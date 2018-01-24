require 'docking_station'
require 'bike'

describe DockingStation do



  it { is_expected.to respond_to(:release_bike) }
  it 'releases working bikes' do
    bike = Bike.new
    subject.dock(bike)
    subject.release_bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }
  it 'allows bikes to dock' do
    bike = Bike.new
    expect(subject.dock(bike)).to match_array([bike])
  end

  it { is_expected.to respond_to(:bikes) }

  it 'shows bikes that have been docked' do
    bike = Bike.new
    docked_bike = subject.dock(bike)
    expect(subject.bikes).to eq([bike])
  end

  it 'doesn\'t release a bike if @bikes is empty' do
    expect { subject.release_bike }.to raise_error "There are no bikes available"
  end

  it 'doesn\'t allow you to dock a bike once capacity of 20 is reached' do
    20.times { subject.dock(Bike.new) }
    expect { subject.dock(Bike.new) }.to raise_error "Capacity is full"
  end

end
