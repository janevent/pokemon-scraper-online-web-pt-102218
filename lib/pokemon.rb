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
    attr = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id).flatten
    # binding.pry
   Pokemon.new(id: attr[0], name: attr[1], type: attr[2], db: db)
   
  end
  
end
