class BeverageFactory
  def self.build(key, driver, options)
    beverage_class(key).new(driver, options)
  end

  def self.register(key, klass)
    beverages[key] = klass
  end

  def self.beverage_class(key)
    beverages[key] || NullBeverage
  end

  def self.beverages
    @beverages ||= {}
  end
end
