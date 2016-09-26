class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @messages = Message.all
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Your message was sent"
      respond_to do |format|
        format.html { redirect_to messages_path }
        format.js
      end
    else
      flash[:notice] = 'Message unable to be saved'
      render :new
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  private

  def message_params
    params.require(:message).permit(:from, :body, to:[])
  end
end
