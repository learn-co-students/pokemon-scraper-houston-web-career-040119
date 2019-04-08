require 'pry'

require_relative
class Pokemon
  
  attr_accessor :id, :name, :type, :db, :hp

  
  def initialize (id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db 
  
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name,type) VALUES (?, ?)",[name, type])
    
  end
  
  def self.find(id, db)
   test =  db.execute( "SELECT * FROM pokemon WHERE id = ?",id).flatten
   Pokemon.new(id: test[0],name: test[1],type: test[2],db: db)
  end
  
  def alter_hp(hp, db)
    db.execute('UPDATE pokemon SET hp = ? WHERE name = "Pikachu",hp)
    
  end
  
  
end
