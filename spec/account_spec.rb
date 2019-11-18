require 'account'

describe 'Account' do
  let(:account) { Account.new }
  describe '#deposit' do
    it "should respond to deposit with one argument" do
      expect(account).to respond_to(:deposit).with(1).argument
    end
  end
end
