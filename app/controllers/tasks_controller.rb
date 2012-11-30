class TasksController < ApplicationController
  respond_to :json, :html

  def index
    respond_with Task.order('sortable desc')
  end
  
   def show
     respond_with Task.find(params[:id])
   end

   def create
     respond_with Task.create(params[:task])
   end

   def update
     respond_with Task.update(params[:id], params[:task])
   end

   def destroy
     task = Task.find(params[:id])
     if task.parent_id == 0
       Task.destroy_all(:parent_id => task.id)
     end
     respond_with Task.destroy(params[:id])
   end
   
   def sort
     length = params[:task].length
     p length
     params[:task].each_with_index do |id, index|
       Task.update_all({sortable: index}, {id: id})
     end
     
     render :nothing => true
   end
end
