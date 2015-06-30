class TasklistItemsController < ApplicationController
  def index
  		@tasklist = Tasklist.find(params[:tasklist_id])
  end

  def new
  	@tasklist = Tasklist.find(params[:tasklist_id])
  	@tasklist_item = @tasklist.tasklist_items.new
  end

  def create
  	@tasklist = Tasklist.find(params[:tasklist_id])
  	@tasklist_item = @tasklist.tasklist_items.new(tasklist_item_params)
  	if @tasklist_item.save
  		flash[:success] = "Added tasklist item."
  		redirect_to tasklist_tasklist_items_path
  	else
  		flash[:error] = "There was a problem adding that tasklist item."
  		render action: :new
  	end
  end

  def edit
    @tasklist = Tasklist.find(params[:tasklist_id])
    @tasklist_item = @tasklist.tasklist_items.find(params[:id])
  end

  def update
    @tasklist = Tasklist.find(params[:tasklist_id])
    @tasklist_item = @tasklist.tasklist_items.find(params[:id])
      if @tasklist_item.update_attributes(tasklist_item_params)
        flash[:success] = "Saved tasklist item."
        redirect_to tasklist_tasklist_items_path
      else
        flash[:error] = "That tasklist item could not be saved."
        render action: :edit
      end
  end
  

  def url_options
    { tasklist_id: params [:tasklist_id] }.merge(super)
  end


  private
  def tasklist_item_params
  	params[:tasklist_item].permit(:content)
  end

end
