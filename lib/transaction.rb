class Transaction

  def event(deposit: nil, withdrawal: nil, balance:)
    date = Time.now.strftime("%d/%m/%Y")
    return { date: date, deposit: deposit, withdrawal: withdrawal, balance: balance }
  end
end
