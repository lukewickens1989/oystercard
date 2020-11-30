class Oystercard
attr_reader :balance, :state
LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Balance cannot exceed #{LIMIT}" if @balance + amount > LIMIT

    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @state = 'in journey'
  end

  def in_journey?
    true
  end

end
