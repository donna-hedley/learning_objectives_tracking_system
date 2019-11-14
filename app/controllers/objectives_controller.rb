class ObjectivesController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @objective = @topic.objectives.create(objective_params)
    redirect_to topic_path(@topic)
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @objective = @topic.objectives.find(params[:id])
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @objective = @topic.objectives.find(params[:id])
    @objective.destroy
    redirect_to topic_path(@topic)
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @objective = @topic.objectives.find(params[:id])
    @objective.update(objective_params)
      redirect_to topic_path(@topic)

  end

  private

  def objective_params
    params.require(:objective).permit(:title, :details, :topic_id)
  end
end
