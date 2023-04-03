require_relative "beverage_factory"

class Beverage
  def self.prepares(beverage)
    BeverageFactory.register(beverage, self)
  end

  attr_reader :driver, :options

  def initialize(driver, options)
    @driver = driver
    @options = options
  end

  def prepare; end

  private

  def dispense_cup
    driver.dispense_cup
  end

  def heat_water
    driver.heat_water
  end

  def dispense_water
    driver.dispense_water
  end
end
