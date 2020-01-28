class MessagesController < ApplicationController

    def index
      @group = Group.find(params[:group_id])
      if params[:name]
        name = params[:name]
        @messages = Message.search(name)
      else
        @messages = @group.messages.all
      end
      json_response(@messages)
    end

    def show
      @group = Group.find(params[:group_id])
      @message = Message.find(params[:id])
      json_response(@message)
    end

    def create
      @group = Group.find(params[:group_id])
      @message = Message.create!(message_params)
      json_response(@message, :created)
    end

    def update
      @group = Group.find(params[:group_id])
      @message = Message.find(params[:id])
      if @message.update!(message_params)
        render status: 200, json: { message: "This message has been updates successfully." }
      end

    end

    def destroy
      @message = Message.find(params[:id])
      if @message.destroy!
        render status: 200, json: { message: "This message was deleted."}
      end
    end

    private

    def message_params
      params.permit(:author, :content, :group_id)
    end

end
