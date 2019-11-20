require 'account'
require 'timecop'

describe 'Account' do
  let(:account) { Account.new(transaction, bank_atm) }
  let(:transaction) { double :transaction }
  let(:bank_atm) { double :bank_atm, print: expected_output }
  let(:instance_of_transaction) { double :transaction }
  let(:deposit_transaction) { { date: '18/11/2019', deposit: 200, withdrawal: nil, balance: 200 } }
  let(:withdrawal_transaction) { { date: '19/11/2019', deposit: nil, withdrawal: 50, balance: 150 } }
  let(:expected_output) { "date || credit || debit || balance\n19/11/2019 || || 50.00 || 150.00\n18/11/2019 || 200.00 || || 200.00" }

  describe '#deposit' do

    before do
      Timecop.freeze(2019, 11, 18)
      allow(transaction).to receive(:new).and_return(instance_of_transaction)
      allow(instance_of_transaction).to receive(:event).and_return(deposit_transaction)
    end

    it "should respond to deposit with one argument" do
      expect(account).to respond_to(:deposit).with(1).argument
    end

    it "increases the account balance by amount passed in" do
      expect { account.deposit(100) }.to change { account.balance }.by(100)
    end

    it "adds the transaction to transaction history" do
      account.deposit(200)
      expect(account.balance).to eq(200)
      expect(account.transaction_history.first).to eq deposit_transaction
    end
  end

  describe '#withdraw' do

    before do
      Timecop.freeze(2019, 11, 18)
      allow(transaction).to receive(:new).and_return(instance_of_transaction)
      allow(instance_of_transaction).to receive(:event).and_return(deposit_transaction)
    end

    it "should respond to withdraw with one argument" do
      expect(account).to respond_to(:withdraw).with(1).argument
    end

    it "should decrease the balance by the amount passed in" do
      account.deposit(100)
      expect { account.withdraw(50) }.to change { account.balance }.by(-50)
    end

    it "should not allow you to withdraw more than the current balance" do
      account.deposit(100)
      expect(bank_atm).to receive(:display_withdrawal_error_message)
      account.withdraw(150)
      expect(account.balance).to eq 100
      expect(account.balance).not_to eq(-50)
    end

    it "adds a withdrawal transaction to transaction history" do
      account.deposit(200)
      Timecop.freeze(2019, 11, 19)
      allow(instance_of_transaction).to receive(:event).and_return(withdrawal_transaction)
      account.withdraw(50)
      expect(account.transaction_history.first).to eq withdrawal_transaction
    end
  end

  describe '#print_statement' do

    before do
      Timecop.freeze(2019, 11, 18)
      allow(transaction).to receive(:new).and_return(instance_of_transaction)
      allow(instance_of_transaction).to receive(:event).and_return(deposit_transaction)
      account.deposit(200)
    end

    it "prints your transaction history" do
      Timecop.freeze(2019, 11, 19)
      allow(instance_of_transaction).to receive(:event).and_return(withdrawal_transaction)
      account.withdraw(50)
      expect(bank_atm).to receive(:print)
      account.print_statement
    end
  end
end
