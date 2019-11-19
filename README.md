# Bank_Tech_Test

## How to Use the programme
1. Fork this repo
2. cd into the folder Bank_Tech_Test and run `bundle install` to install the required gems.
3. In IRB type `require './lib/account.rb'` in IRB.
4. Next, create a new account by typing `account = Account.new`
5. Use the command `account.deposit(100)` to deposit £100 into your account.
6. Use the command `account.withdraw(20)` to withdraw £20 from your account.
7. To print your account statement use the command `account.print_statement`.

![Screenshot](screenshot.png)

## Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).


## Acceptance criteria

* Given a client makes a deposit of 1000 on 10-01-2012
* And a deposit of 2000 on 13-01-2012
* And a withdrawal of 500 on 14-01-2012
* When she prints her bank statement
* Then she would see:

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## User Stories
```
As a User,
I would like to be able to make a deposit to my Account
```
```
As a User,
I would like to be able to make a withdrawal from my Account
```
```
As a User,
I would like my transactions saved with the date the transaction was made.
```
```
As a User,
I would like the statement printed in an easy to read output with both deposits and withdrawals shown.
```
```
As a User,
I would like the statement to be ordered newest to oldest.
```

## Classes and Methods

### Account
* Starts with a balance of zero
* Starts with an empty statement history
* Has a Deposit Method which adds to the balance and pushes that change to the transaction history array.
* Has a Withdrawal Method which subtracts from the balance and pushes that change to the transaction history array
* Has a print statement method which relies on statement printer class to print the statement.
* Edge Case to consider: A user should not be able to withdraw more than their balance, or withdraw if their balance is zero.

### Transaction
* Has an event method. This effectively creates an instance of a transaction and saves it as a hash with a date, the credit or debit made and the balance after these actions.

### Print Statement
* Has a Print Method. This takes an array as an argument and then prints out the array in the output necessary for the acceptance criteria. Also has a few private methods to ensure correct formatting.

## Approach
 My approach when starting this challenge was to create user stories from the acceptance criteria provided. By doing this a clear structure for the programme emerged and allowed me to carry out further planning. The further planning I carried out was to break down how I envision the programme would look and this meant that 3 clear classes started to emerge. Within these classes I then started thinking about the methods and responsibility each class would have. This meant I could adhere to SRP and no one class would be doing too much. It also helped when it came to naming variables and methods.

## Code Quality and Testing.

I used Rspec to run the tests for the programme. Alongside Rspec I used rubocop for linting and simplecov to ensure I was covering all lines of code.
