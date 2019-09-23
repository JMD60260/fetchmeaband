# frozen_string_literal: true

class StaticpageController < ApplicationController
  def new; end

  def index
    @the_events = Event.all
    @all_events = @the_events.last(3)
  end

  def show; end

  def contact; end

  def about_us; end
end
