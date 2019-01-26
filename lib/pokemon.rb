require 'pry'
class Pokemon
  
  attr_accessor :id, :name, :type, :db 
  
  @@all = []
  
  def initialize(id: , name: , type: , db: )
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
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    attr = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id)
    # a = attr.flatten[0]
    # binding.pry
   Pokemon.new(id: attr.flatten[0], name: attr.flatten[1].first, type: attr.flatten[2], db: attr.flatten[3])
   
  end
  
end
