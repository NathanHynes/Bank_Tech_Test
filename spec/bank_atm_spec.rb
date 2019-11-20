require 'bank_atm'
require 'timecop'

describe 'StatementPrinter' do
  let(:bank_atm) { BankATM.new }

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
      expect(bank_atm.money_format(amount)).to eq '200.00'
    end
  end

  describe '#print' do
    it "returns transaction history in a readable format" do
      expect { bank_atm.print(transaction_history) }.to output(expected_output).to_stdout
    end
  end

  describe '#display_withdrawal_error_message' do
    it "returns error message and is only called when user tries to withdraw more than account balance" do
      expect(bank_atm.display_withdrawal_error_message(20)).to eq "Sorry you are unable to withdraw more than your balance. Your current balance is 20"
    end
  end
end
