require_relative 'bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail "There are no bikes available" unless @bikes[0]
    @bikes.pop
  end

  # def show_bike
  #   @bikes
  # end

  def dock(bike)
    fail "Capacity is full" if @bikes.length >= 20
    @bikes << bike
  end
end
