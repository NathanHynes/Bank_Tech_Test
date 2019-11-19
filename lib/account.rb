require_relative 'transaction'
require_relative 'statement_printer'

class Account
  attr_reader :balance, :transaction_history

  DEFAULT_BALANCE = 0

  def initialize(transaction = Transaction, printer = StatementPrinter.new)
    @balance = DEFAULT_BALANCE
    @transaction = transaction
    @transaction_history = []
    @printer = printer
  end

  def deposit(amount)
    @balance += amount
    new_deposit = @transaction.new
    update_transaction_history(new_deposit.event(deposit: amount, balance: @balance))
  end

  def withdraw(amount)
    return "Sorry you are unable to withdraw more than your balance. Your current balance is #{@balance}" if @balance.zero? || @balance < amount

    @balance -= amount
    new_withdrawal = @transaction.new
    update_transaction_history(new_withdrawal.event(withdrawal: amount, balance: @balance))
  end

  def print_statement
    @printer.print(@transaction_history)
  end

  private

  def update_transaction_history(transaction)
    @transaction_history.unshift(transaction)
  end

end
