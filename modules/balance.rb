# Module to include balance logic in classes
module Balance
  attr_reader :balance

  def add_balance(amount)
    @balance + amount
  end

  def reduce_balance(amount)
    @balance - amount
  end
end
