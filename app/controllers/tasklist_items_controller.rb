class TasklistItemsController < ApplicationController
  def index
  		@tasklist = Tasklist.find(params[:tasklist_id])
  end
end
