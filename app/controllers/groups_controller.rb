class GroupsController < ApplicationController

    def index
      if params[:name]
        name = params[:name]
        @groups = Group.search(name)
      else
        @groups = Group.all
      end
      json_response(@groups)
    end

    def show
      @group = Group.find(params[:id])
      json_response(@group)
    end

    def create
      @group = Group.create!(group_params)
      json_response(@group, :created)
    end

    def update
      @group = Group.find(params[:id])
      if @group.update!(group_params)
        render status: 200, json: { message: "This group has been updates successfully." }
      end

    end

    def destroy
      @group = Group.find(params[:id])
      if @group.destroy!
        render status: 200, json: { message: "This group was deleted."}
      end
    end

    private
    def group_params
      params.permit(:name)
    end

end
