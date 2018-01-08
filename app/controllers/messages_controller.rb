class MessagesController < ApplicationController
  def index
    authorize Message.new
    @messages = policy_scope(Message).all
  end

  def show
    @message = Message.find_by(uuid: params[:uuid])
    authorize @message
  end

  def new
    @message = Message.new
    authorize @message
  end

  def create
    authentication = current_user
    message = authentication.user.messages.build(message_params)
    message.uuid = SecureRandom.uuid.delete('-')
    authorize message
    emails = message.emails.split(',').map {|email| email.strip }
    begin
      ApplicationRecord.transaction do
        message.save!
        emails.each do |email|
          message.acceptances.create!(email: email)
        end
      end
    rescue => exception
      render :new
      return
    end
    redirect_to message_path(uuid: message.uuid), notice: "Message was successfully created."
  end

  def edit
    @message = policy_scope(Message).find_by(uuid: params[:uuid])
    authorize @message
  end

  def update
    message = policy_scope(Message).find_by(uuid: params[:uuid])
    authorize message
    begin
      ApplicationRecord.transaction do
        message.acceptances.destroy_all
        message.update!(message_params)
        emails = message.emails.split(',').map {|email| email.strip }
        emails.each do |email|
          message.acceptances.create!(email: email)
        end
      end
    rescue => exception
      @message = message
      render :edit
      return
    end
    redirect_to message_path(uuid: message.uuid), notice: 'Message was successfully updated.'
  end

  def destroy
    message = policy_scope(Message).find_by(uuid: params[:uuid])
    authorize message
    message.destroy
    redirect_to messages_path, notice: 'Call log was successfully destroyed.'
  end

  private
    def message_params
      params.require(:message).permit(:uuid, :body, :emails)
    end
end
