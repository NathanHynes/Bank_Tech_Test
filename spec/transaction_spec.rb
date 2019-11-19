require 'transaction'
require 'timecop'

describe Transaction do
  let(:transaction) { Transaction.new }
  let(:deposit) { 200 }
  let(:balance_after_deposit) { 200 }
  let(:withdrawal) { 50 }
  let(:balance_after_withdrawal) { 150 }

  describe '#event' do
    it "creates a new transaction event when a deposit is made" do
      Timecop.freeze(2019, 11, 18)
      expect(transaction.event(deposit: deposit, balance: balance_after_deposit)).to eq({ date: '18/11/2019', deposit: 200, withdrawal: nil, balance: 200 })
    end

    it "creates a new transaction event when a withdrawal is made" do
      Timecop.freeze(2019, 11, 17)
      expect(transaction.event(withdrawal: withdrawal, balance: balance_after_withdrawal)).to eq({ date: '17/11/2019', deposit: nil, withdrawal: 50, balance: 150 })
    end
  end
end
