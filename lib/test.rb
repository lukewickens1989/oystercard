# class Oystercard
# attr_accessor :balance, :state, :start_station, :exit_station, :journeys
# LIMIT = 90
# FARELIMIT = 1
#
#   def initialize
#     @balance = 0
#     @fare_limit = FARELIMIT
#     @start_station = nil
#     @journeys = []
#   end
#
#   def top_up(amount)
#     raise "Balance cannot exceed #{LIMIT}" if (@balance + amount) > LIMIT
#
#     @balance += amount
#   end
#
#   def touch_in(station)
#     raise "Not enough funds" if @balance < @fare_limit
#
#     @start_station = station
#   end
#
#   def in_journey?
#     @start_station != nil
#   end
#
#   def touch_out(station)
#     deduct(@fare_limit)
#     @exit_station = station
#     @journeys.push({@start_station => @exit_station})
#     @start_station = nil
#   end
#
#   private
#
#   def deduct(amount)
#     @balance -= amount
#   end
# end
#
# class Station
#
#   attr_accessor :name, :zone
#
#   def initialize(name, zone)
#     @name = name
#     @zone = zone
#   end
#
# end
#
# require 'oystercard'
# describe Oystercard do
#   let(:station) { double('station double') }
#   let(:station1) { double('station double') }
#
#   it 'can create an instance of oystercard' do
#     expect(subject).to be_kind_of(Oystercard)
#   end
#
#   it 'responds to the method balance' do
#     expect(subject).to respond_to(:balance)
#   end
#
#   it 'gives a default balance of 0' do
#     expect(subject.balance).to eq 0
#   end
#
#   it 'responds to the method top_up' do
#     expect(subject).to respond_to(:top_up).with(1).argument
#   end
#
#   it 'starts with no stored journeys' do
#     expect(subject.journeys).to eq []
#   end
#
#   it 'responds to the method touch_in' do
#     expect(subject).to respond_to(:touch_in).with(1).argument
#   end
#
#   it 'responds to the method in_journey?' do
#     expect(subject).to respond_to(:in_journey?)
#   end
#
#   it 'responds to the method touch_out' do
#     expect(subject).to respond_to(:touch_out).with(1).argument
#   end
#
#   describe '#top_up' do
#     it 'increases balance by amount' do
#       subject.top_up(10)
#       expect(subject.balance).to eq 10
#     end
#     it "raises an error when top up exceeds #{Oystercard::LIMIT}" do
#       message = "Balance cannot exceed #{Oystercard::LIMIT}"
#       expect { subject.top_up(Oystercard::LIMIT+1) }.to raise_error message
#     end
#   end
#
#   describe '#touch_in' do
#     it 'sets card state to in journey' do
#       subject.top_up(Oystercard::FARELIMIT)
#       subject.touch_in(station)
#       expect(subject.in_journey?). to eq true
#     end
#
#     it 'raises an error when balance is below 1' do
#       message = "Not enough funds"
#       expect { subject.touch_in(station) }.to raise_error message
#     end
#
#     it 'it remembers the start station' do
#       subject.top_up(Oystercard::FARELIMIT)
#       subject.touch_in(station)
#       expect(subject.start_station).to eq station
#     end
#   end
#
#
#   describe '#in_journey?' do
#     it 'returns true when in journey' do
#       subject.top_up(Oystercard::FARELIMIT)
#       subject.touch_in(station)
#       expect(subject).to be_in_journey
#     end
#
#     it 'returns false when not in journey' do
#       expect(subject).not_to be_in_journey
#     end
#   end
#
#   describe '#touch_out' do
#     it 'sets card state to not in journey' do
#       subject.top_up(Oystercard::FARELIMIT)
#       subject.touch_in(station)
#       subject.touch_out(station)
#       expect(subject.start_station).to eq nil
#     end
#
#     it 'it deducts FARELIMIT from balance' do
#       subject.top_up(Oystercard::FARELIMIT)
#       subject.touch_in(station)
#       expect { subject.touch_out(station) }.to change{ subject.balance }.by(-Oystercard::FARELIMIT)
#     end
#
#     it 'forgets the start station' do
#       subject.top_up(Oystercard::FARELIMIT)
#       subject.touch_in(station)
#       subject.touch_out(station)
#       expect(subject.start_station).to eq nil
#     end
#
#     it 'records journey from start to end station' do
#       subject.top_up(Oystercard::FARELIMIT)
#       subject.touch_in(station)
#       subject.touch_out(station1)
#       expect(subject.journeys).to include({station => station1})
#     end
#   end
# end
#
# require 'station'
#
# describe Station do
#   let(:station) { described_class.new("Euston", 1) }
#   it 'allows instance station to be created' do
#     expect(station).to be_instance_of(Station)
#   end
#
#   it 'can read its own name' do
#     expect(station.name).to eq 'Euston'
#   end
#
#   it 'it can read its own zone' do
#     expect(station.zone).to eq 1
#   end
# end
#
