class NotesController < ApplicationController
  def show
      @note = Note.find(params[:id])
  end

  def edit
   @note =  Note.find_by(user_id: session[:user_id], objective_id: params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    puts "into create"
    if @note.save
      redirect_to objectives_path
    else
      render 'new'
    end
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      flash[:success] = "Objective updated"
      redirect_to objectives_path
    else
      render 'show'
    end
  end


  private

    def note_params
      params.require(:note).permit(:plan_memo, :evidence_memo, :method_memo,
                                   :health_check_memo, :health_check_status, :user_id, :objective_id)
    end
end
