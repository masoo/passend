﻿class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find_by(uuid: params[:uuid])
  end

  def new
    @message = Message.new
  end

  def create
    authentication = current_user
    message = authentication.user.messages.build(message_params)
    message.uuid = SecureRandom.uuid.delete('-')
    if message.save
      redirect_to message_path(uuid: message.uuid), notice: "Message was successfully created."
    else
      render :new
    end
  end

  def edit
    @message = Message.find_by(uuid: params[:uuid])
  end

  def update
    message = Message.find_by(uuid: params[:uuid])
    if message.update(message_params)
      redirect_to message_path(uuid: message.uuid), notice: 'Message was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    message = Message.find_by(uuid: params[:uuid])
    message.destroy
    redirect_to messages_path, notice: 'Call log was successfully destroyed.'
  end

  private
    def message_params
      params.require(:message).permit(:uuid, :body, :emails)
    end
end
