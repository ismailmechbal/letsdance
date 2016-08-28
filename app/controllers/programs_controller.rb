class ProgramsController < ApplicationController

  def index
    @program = Program.new.get_program
  end

end