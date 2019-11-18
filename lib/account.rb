class Account
  attr_reader :balance

  DEFAULT_BALANCE = 0

  def initialize
    @balance = DEFAULT_BALANCE
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    return "Sorry you are unable to withdraw more than your balance. Your current balance is #{@balance}" if @balance.zero? || @balance < amount

    @balance -= amount
  end

end
