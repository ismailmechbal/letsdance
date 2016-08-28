class ParticipantsController < ApplicationController

  def show
    @participant = Participant.new.get_participant(params[:id])
  end

end