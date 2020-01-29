class CommentsController < ApplicationController

    def index
      @group = Group.find(params[:group_id])
      @message = Message.find(params[:message_id])
      if params[:name]
        name = params[:name]
        @comments = Comment.search(name)
      else
        @comments = @mesage.comments.all
      end
      json_response(@comments)
    end

    def show
      @group = Group.find(params[:group_id])
      @message = Message.find(params[:message_id])
      @comment = Comment.find(params[:id])
      json_response(@comment)
    end

    def create
      @group = Group.find(params[:group_id])
      @message = Message.find(params[:message_id])
      @comment = Comment.create!(comment_params)
      json_response(@comment, :created)
    end

    def update
      @group = Group.find(params[:group_id])
      @message = Message.find(params[:message_id])
      @comment = Comment.find(params[:id])
      if @comment.update!(comment_params)
        render status: 200, json: { comment: "This comment has been updates successfully." }
      end

    end

    def destroy
      @comment = Comment.find(params[:id])
      if @comment.destroy!
        render status: 200, json: { comment: "This comment was deleted."}
      end
    end

    private

    def comment_params
      params.permit(:author, :content, :message_id, :group_id)
    end

end
