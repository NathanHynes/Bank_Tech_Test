require_relative 'transaction'
require_relative 'bank_atm'

class Account
  attr_reader :balance, :transaction_history

  DEFAULT_BALANCE = 0

  def initialize(transaction = Transaction, bank_atm = BankATM.new)
    @balance = DEFAULT_BALANCE
    @transaction = transaction
    @transaction_history = []
    @bank_atm = bank_atm
  end

  def deposit(amount)
    @balance += amount
    new_deposit = @transaction.new
    update_transaction_history(new_deposit.event(deposit: amount, balance: @balance))
  end

  def withdraw(amount)
    if @balance.zero? || @balance < amount
      @bank_atm.display_withdrawal_error_message(@balance)
    else
      @balance -= amount
      new_withdrawal = @transaction.new
      update_transaction_history(new_withdrawal.event(withdrawal: amount, balance: @balance))
    end
  end

  def print_statement
    @bank_atm.print(@transaction_history)
  end

  private

  def update_transaction_history(transaction)
    @transaction_history.unshift(transaction)
  end
end
