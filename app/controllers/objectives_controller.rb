class ObjectivesController < ApplicationController

  def index
    @topics = Topic.all
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @objective = @topic.objectives.create(objective_params)
    redirect_to topic_path(@topic)
  end

  def edit
    @objective = Objective.find(params[:id])
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @objective = @topic.objectives.find(params[:id])
    @objective.destroy
    redirect_to topic_path(@topic)
  end

  def update
    # @topic = Topic.find(params[:topic_id])
    @objective = objectives.find(params[:id])
    @objective.update(objective_params)
      redirect_to topic_path(@topic)
  end

  private

  def objective_params
    params.require(:objective).permit(:title, :details, :topic_id)
  end
end
