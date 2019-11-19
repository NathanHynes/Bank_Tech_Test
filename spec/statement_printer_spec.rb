require 'statement_printer'
require 'timecop'

describe 'StatementPrinter' do
  let(:printer) { StatementPrinter.new }

  let(:transaction_history) { [
    { date: '14/01/2019', deposit: nil, withdrawal: 500, balance: 2500 },
    { date: '13/01/2019', deposit: 2000, withdrawal: nil, balance: 3000 },
    { date: '10/01/2019', deposit: 1000, withdrawal: nil, balance: 1000 }
  ]
  }
  let(:expected_output) { "date || credit || debit || balance\n14/01/2019 || || 500.00 || 2500.00\n13/01/2019 || 2000.00 || || 3000.00\n10/01/2019 || 1000.00 || || 1000.00\n" }

  describe '#money_format' do
    it "returns the amount of money to two decimal places" do
      amount = 200
      expect(printer.money_format(amount)).to eq '200.00'
    end
  end

  describe '#print' do
    it "returns transaction history in a readable format" do
      expect { printer.print(transaction_history) }.to output(expected_output).to_stdout
    end
  end
end
