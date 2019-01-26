require 'pry'
class Pokemon
  
  attr_accessor :id, :name, :type, :db 
  
  @@all = []
  
  def initialize(id: 1, name: "Pikachu", type: "electric", db: "<SQLite3::Database:0x00000003a2c620")
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
   Pokemon.new("id: #{attr.flatten[0]}, name: #{attr.flatten[1]}, type: #{attr.flatten[2]}")
  end
  
end
