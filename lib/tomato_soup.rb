require_relative "beverage"

class TomatoSoup < Beverage
  prepares :tomato_soup

  def prepare
    dispense_cup
    heat_water
    dispense_condensed_soup
    dispense_water
    dispense_croutons if cruncy?
    dispense_hot_sauce if spicy?
  end

  private

  def dispense_condensed_soup
    driver.dispense_condensed_soup
  end

  def dispense_croutons
    driver.dispense_croutons
  end

  def dispense_hot_sauce
    driver.dispense_hot_sauce
  end

  def cruncy?
    options[:cruncy]
  end

  def spicy?
    options[:spicy]
  end
end
