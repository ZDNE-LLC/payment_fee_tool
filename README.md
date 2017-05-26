# PaymentFeeTool

This is a gem that calculates credit card upcharges for invoice payments.
This is a tool used internally at ZDN Enterprises.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'payment_fee_tool'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install payment_fee_tool

## Usage
- All methods accept a single parameter: Amount[Integer] (in cents)
- All methods return a `Money` object.

```ruby
# Calculates Credit Card Fee
amount_in_cents = 1000_00
PaymentFeeTool::CreditCard.calculate(amount_in_cents) # => $30.18
```
```ruby
# Calculates Credit Card Fee and adds it to the amount
amount_in_cents = 1000_00
PaymentFeeTool::CreditCard.add_fee_to(amount_in_cents) # => $1,030.18

```
```ruby
# Adds WireTransfer fee to amount (fee is always $20.00)
amount_in_cents = 1000_00
PaymentFeeTool::WireTransfer.add_fee_to(amount_in_cents) # => $1,020.00

amount_in_cents = 10_00
PaymentFeeTool::WireTransfer.add_fee_to(amount_in_cents) # => $30.00

```
```ruby
# Returns the amount, since there is no check fee.
amount_in_cents = 1000_00
PaymentFeeTool::Check.add_fee_to(amount_in_cents) # => $1,000.00

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/payment_fee_tool.
