require 'statement_printer'
require 'timecop'

describe 'StatementPrinter' do
  let(:printer) { StatementPrinter.new }
  describe '#money_format' do
    it "returns the amount of money to two decimal places" do
      amount = 200
      expect(printer.money_format(amount)).to eq '200.00'
    end
  end
end
