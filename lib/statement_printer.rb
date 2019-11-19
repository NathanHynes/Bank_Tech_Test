class StatementPrinter

  STATEMENT_HEADER = 'date || credit || debit || balance'
  NEW_LINE = "\n"
  NEW_COLUMN = "|| "

  def initialize
    @header = STATEMENT_HEADER
    @new_line = NEW_LINE
    @new_column = NEW_COLUMN
  end

  def print_statement(transaction_history)
    statement = @header + @new_line

    transaction_history.each do |transaction|
      date = transaction[:date] + ' ' + @new_column
      credit = an_integer?(transaction[:deposit]).to_s + @new_column
      debit = an_integer?(transaction[:withdrawal]).to_s + @new_column
      balance = money_format(transaction[:balance])
      statement += date + credit + debit + balance + @new_line
    end
    return statement.chomp("\n")
  end

  def money_format(money)
    '%.2f' % money
  end

  private

  def an_integer?(money)
    if money.is_a? Integer
      return money_format(money) + ' '
    end

    return nil
  end
end
