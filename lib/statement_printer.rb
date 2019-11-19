class StatementPrinter

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
    return statement.chomp("\n")
  end

  def money_format(money)
    '%.2f' % money
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
