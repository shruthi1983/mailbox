class MessagesController < ApplicationController
  before_action do
	@conversation =Conversation.find(params[:conversation_id])
end

def index
 	@messages = @conversation.messages
 	@messages = @conversation.messages.new
end
 
def new
 @messages = @conversation.messages.new
end

def create
  @messages = @conversation.messages.new(message_params)	
   	if @message.save
   	   redirect_to conversation_message_path(@conversation)
    end
end 
private
def message_params
  params.require(:message).permit(:body,:user_id)
end  

   	  