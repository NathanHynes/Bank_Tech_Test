require 'account'

describe 'Account' do
  let(:account) { Account.new }
  describe '#deposit' do
    it "should respond to deposit with one argument" do
      expect(account).to respond_to(:deposit).with(1).argument
    end

    it "increases the account balance by amount passed in" do
      expect { account.deposit(100) }.to change { account.balance }.by(100)
    end
  end

  describe '#withdraw' do
    it "should respond to withdraw with one argument" do
      expect(account).to respond_to(:withdraw).with(1).argument
    end

    it "should decrease the balance by the amount passed in" do
      account.deposit(100)
      expect { account.withdraw(50) }.to change { account.balance }.by(-50)
    end
  end
end
