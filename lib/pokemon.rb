require 'pry'
class Pokemon
  
  attr_accessor :id, :name, :type, :db 
  
  @@all = []
  
  def initialize(id = nil, name = nil, type = nil, db = nil)
    @id = id
    @name = name,
    @type = type,
    @db = db
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end
  
  def self.find(id, db)
    attr = db.execute("SELECT * FROM pokemon WHERE pokemon.id = id;").flatten
    binding.pry
   Pokemon.new(attr[0], attr[1], attr[2], db)
   
  end
  
end
