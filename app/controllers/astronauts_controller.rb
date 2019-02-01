class AstronautsController < ApplicationController

  def index
    @astronauts = Astronaut.all
    @average_age = Astronaut.average(:age)
  end

end
