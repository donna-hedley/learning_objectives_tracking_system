class NotesController < ApplicationController
  def show
      @note = Note.find(params[:id])
  end

  def edit
    ## looks for note that has user id from user and obj ID from objectives
    ## if it finds a record, it prepares to edit
    if Note.where(user_id: session[:user_id], objective_id: params[:id]).present?
      ## edit a record
      puts "found A record"
      @note = Note.where(user_id: session[:user_id], objective_id: params[:id])
    else
    ## if it doesn't find one, it prepares to create a new record
      puts "found NO record"
      @note = Note.new
    end
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    puts @note
    if @note.save
      redirect_to objectives_path
    else
      render 'edit'
    end
  end

  def update
    @note = Note.where(user_id: session[:user_id], objective_id: params[:id])
    if @note.update(note_params)
      redirect_to objectives_path
    else
      render 'edit'
    end
  end

  private

    def note_params
      params.require(:note).permit(:plan_memo, :evidence_memo, :method_memo,
                                   :health_check_memo, :health_check_status, :user_id, :objective_id)
    end
end
