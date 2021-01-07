# spec/Player._spec.rb
require './lib/Player'

describe Player do
  context "#initialize" do
    it "proper initilize with John, marker: $" do
      john = Player.new('John', '$')
      expect(john.to_hash).to include(:name => 'John', :marker => '$')
    end
    it "proper initilize with Julia, marker: &" do
      john = Player.new('Julia', '&')
      expect(john.to_hash).to include(:name => 'Julia', :marker => '&')
    end
  end
end