require_relative "driver"
require_relative "beverage_factory"
require_relative "null_beverage"
require_relative "apple_cider"
require_relative "cocoa"
require_relative "coffee"
require_relative "tea"
require_relative "tomato_soup"

class CoffeeMachine
  attr_reader :driver

  def initialize(driver:)
    @driver = driver
  end

  def vend(drink: :coffee, options: {})
    BeverageFactory.build(drink, driver, options).prepare
  end
end
