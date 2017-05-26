require "payment_fee_tool/version"
require 'money'
I18n.enforce_available_locales = false

module PaymentFeeTool
  class CreditCard
    def self.calculate(amount)
      money = Money.new(amount)
      return Money.new(0) if amount == 0
      return ((money + Money.new(30))/0.971)-money
    end

    def self.add_fee_to(amount)
      return Money.new(amount) + calculate(amount)
    end
  end

  class WireTransfer
    def self.calculate(amount)
      return Money.new(20_00)
    end

    def self.add_fee_to(amount)
      return Money.new(amount) + calculate(amount)
    end
  end

  class Check
    def self.calculate(amount)
      return Money.new(0)
    end

    def self.add_fee_to(amount)
      return Money.new(amount) + calculate(amount)
    end
  end
end
