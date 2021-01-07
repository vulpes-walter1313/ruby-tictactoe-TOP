class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end
  def to_hash
    { name: self.name, marker: self.marker}
  end
end