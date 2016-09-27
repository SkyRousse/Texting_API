class InboundMessagesController < ApplicationController
  protect_from_forgery except: :create

  def create
    inbound = InboundMessage.new(params[:Body], params[:To], params[:From])
    inbound.reply("An Automated Text")
  end
end
