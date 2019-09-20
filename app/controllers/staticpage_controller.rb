class StaticpageController < ApplicationController
  def new
  end

  def index
    @all_events = Event.all
    @events = @all_events.last(3)
  end

  def show
  end

  def contact

  end
  def Aboutus

  end
end
