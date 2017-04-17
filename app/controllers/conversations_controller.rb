class ConversationsController < ApplicationController
  layout 'application' 
  protect_from_forgery except: :create
  
  def create
    @conversation = ChatRequest.find_by(chat_id: params[:chat_id])

    add_to_conversations unless conversated?

    respond_to do |format|
      format.js
    end
  end

  def close
    @conversation = ChatRequest.find_by(params[:chat_id])

    session[:conversations].delete(@conversation.id)
    ChatRequest.find_by(chat_id: params[:chat_id]).destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def add_to_conversations
    session[:conversations] ||= []
    session[:conversations] << @conversation.id
  end

  def conversated?
    session[:conversations].include?(@conversation.id)
  end
end
