require 'account'

describe 'Account' do
  let(:account) { Account.new }
  describe '#deposit' do
    it "should respond to deposit with one argument" do
      expect(account).to respond_to(:deposit).with(1).argument
    end

    it "increases the account balance" do
      expect { account.deposit(100) }.to change { account.balance }.by(100)
    end
  end
end
