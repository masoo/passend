class MessagesController < ApplicationController

  def index
    @policy = MessagePolicy.new(current_user, nil)
    return render :file => "public/401.html", :layout => false, :status => :unauthorized unless @policy.index?

    @messages = MessagePolicy::Scope.new(current_user, Message).resolve
  end

  def show
    messages = MessagePolicy::Scope.new(current_user, Message).resolve
    message = messages.where(id: params[:id]).last
    @policy = MessagePolicy.new(current_user, message)
    return render :file => "public/401.html", :layout => false, :status => :unauthorized unless @policy.show?

    @message = message
  end

  def new
    @policy = MessagePolicy.new(current_user, nil)
    return render :file => "public/401.html", :layout => false, :status => :unauthorized unless @policy.new?

    @message = Message.new
  end

  def edit
    messages = MessagePolicy::Scope.new(current_user, Message).resolve
    message = messages.where(id: params[:id]).last
    @policy = MessagePolicy.new(current_user, message)
    return render :file => "public/401.html", :layout => false, :status => :unauthorized unless @policy.edit?

    @message = message
  end

  def create
    @policy = MessagePolicy.new(current_user, nil)
    return render :file => "public/401.html", :layout => false, :status => :unauthorized unless @policy.create?

    @message = Message.new(message_params)
    @emails = emails_params[:emails].split(",").map {|email| email.strip }

    begin
      Message.transaction {
        @message.save!
        @emails.each do |mail|
          Destination.create(email: mail, message_id: @message.id, user_id: current_user.id)
        end
      }
    rescue => error
        flash[:alert] = error.message
        render :new
    end
    redirect_to @message, notice: 'Message was successfully created.'
  end

  def update
    messages = MessagePolicy::Scope.new(current_user, Message).resolve
    message = messages.where(id: params[:id]).last
    @policy = MessagePolicy.new(current_user, message)
    return render :file => "public/401.html", :layout => false, :status => :unauthorized unless @policy.index?

    @message = message
    if @message.update(message_params)
      redirect_to @message, notice: 'Message was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    messages = MessagePolicy::Scope.new(current_user, Message).resolve
    message = messages.where(id: params[:id]).last
    @policy = MessagePolicy.new(current_user, message)
    return render :file => "public/401.html", :layout => false, :status => :unauthorized unless @policy.destroy?

    @message = message
    begin
      Message.transaction {
        @message.destinations.each do |destination|
          destination.destroy!
        end
        @message.destroy!
      }
      redirect_to messages_url, notice: 'Message was successfully destroyed.'
    rescue => error
      flash[:alert] = error.message
      redirect_to messages_url
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end

  def emails_params
    params.require(:message).permit(:emails)
  end
end
