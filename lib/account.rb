require_relative 'transaction'

class Account
  attr_reader :balance, :transaction_history

  DEFAULT_BALANCE = 0

  def initialize(transaction = Transaction)
    @balance = DEFAULT_BALANCE
    @transaction = transaction
    @transaction_history = []
  end

  def deposit(amount)
    @balance += amount
    new_transaction = @transaction.new
    @transaction_history.unshift(new_transaction.event(deposit: amount, balance: @balance))
  end

  def withdraw(amount)
    return "Sorry you are unable to withdraw more than your balance. Your current balance is #{@balance}" if @balance.zero? || @balance < amount

    @balance -= amount
  end

end
