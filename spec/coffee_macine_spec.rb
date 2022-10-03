require_relative "../lib/coffee_machine"

RSpec.describe CoffeeMachine do
  subject(:machine) { described_class.new(driver: driver) }

  let(:driver) { Driver.new }

  describe "#vend" do
    it "serves hot water if an unknown beverage is requested" do
      allow(driver).to receive(:dispense_cup)
      allow(driver).to receive(:heat_water)
      allow(driver).to receive(:dispense_water)

      machine.vend(drink: :unknown)

      expect(driver).to have_received(:dispense_cup).ordered
      expect(driver).to have_received(:heat_water).ordered
      expect(driver).to have_received(:dispense_water).ordered
    end

    it "serves coffee by default" do
      coffee = instance_double(Coffee)

      allow(Coffee).to receive(:new).and_return(coffee)
      allow(coffee).to receive(:prepare)

      machine.vend

      expect(Coffee).to have_received(:new).with(driver, {})
      expect(coffee).to have_received(:prepare)
    end

    it "serves coffee with the provided options when coffee is requested" do
      coffee = instance_double(Coffee)

      allow(Coffee).to receive(:new).and_return(coffee)
      allow(coffee).to receive(:prepare)

      machine.vend(drink: :coffee, options: { sweet: true, creamy: true, fluffy: true })

      expect(Coffee).to have_received(:new).with(driver, { sweet: true, creamy: true, fluffy: true })
      expect(coffee).to have_received(:prepare)
    end

    it "serves tea with the provided options when tea is requested" do
      tea = instance_double(Tea)

      allow(Tea).to receive(:new).and_return(tea)
      allow(tea).to receive(:prepare)

      machine.vend(drink: :tea, options: { sweet: true, creamy: true })

      expect(Tea).to have_received(:new).with(driver, { sweet: true, creamy: true })
      expect(tea).to have_received(:prepare)
    end

    it "serves cocoa when cocoa is requested" do
      cocoa = instance_double(Cocoa)

      allow(Cocoa).to receive(:new).and_return(cocoa)
      allow(cocoa).to receive(:prepare)

      machine.vend(drink: :cocoa, options: { fluffy: true })

      expect(Cocoa).to have_received(:new).with(driver, { fluffy: true })
      expect(cocoa).to have_received(:prepare)
    end
  end
end
