require_relative 'bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail "There are no bikes available" if self.send(:empty?)
    @bikes.pop
  end

  def dock(bike)
    fail "Capacity reached" if self.send(:full?)
    @bikes << bike
  end

  private

  def full?
    @bikes.count >= 20 ? true : false
  end

  def empty?
    @bikes.empty? ? true : false
  end
end

#  station = DockingStation.new
#
# 21.times { station.dock(Bike.new) }
