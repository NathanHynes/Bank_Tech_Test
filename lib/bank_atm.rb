class BankATM

  STATEMENT_HEADER = 'date || credit || debit || balance'
  NEW_LINE = "\n"
  NEW_COLUMN = "|| "

  def initialize
    @header = STATEMENT_HEADER + NEW_LINE
    @new_line = NEW_LINE
    @new_column = NEW_COLUMN
  end

  def print(transaction_history)
    statement = @header
    transaction_history.each do |transaction|
      date = date_format(transaction[:date])
      balance = money_format(transaction[:balance])
      statement += date + transaction_format(transaction[:deposit]) + transaction_format(transaction[:withdrawal]) + balance + @new_line
    end
    puts statement.chomp
  end

  def money_format(money)
    '%.2f' % money
  end

  def display_withdrawal_error_message(account_balance)
    "Sorry you are unable to withdraw more than your balance. Your current balance is #{account_balance}"
  end

  private

  def transaction_format(money)
    if money.is_a? Integer
      return money_format(money) + ' ' + @new_column
    end

    return '' + @new_column
  end

  def date_format(date)
    date + ' ' + @new_column
  end
end
