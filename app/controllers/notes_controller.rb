class NotesController < ApplicationController

  def new
  end

  def create
    note = Note.new(note_params)
    note.user = current_user
    note.save!
    redirect_to notes_path
  end

  def update
    @note.update(note_params)
    redirect_to note_path(@note)
  end

  def edit
    @note = Note.find(params[:id])
  end

  def show
  end

  def index
    @notes = Note.none
    if current_user
      @notes = current_user.readable
    end
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
