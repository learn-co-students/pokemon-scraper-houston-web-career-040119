require 'sqlite3'
require 'pry'


class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(db)
    @id = db[:id]
    @name = db[:name]
    @type = db[:type]
    @db = db[:db]

    @hp = nil

    
    
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}')")
  end

  def self.find(id, db)
    #binding.pry
    my_pokemon = db.execute("SELECT * FROM pokemon WHERE id = '#{id}'").flatten
    Pokemon.new(id: my_pokemon[0],name: my_pokemon[1], type: my_pokemon[2])
  end

  def bonus
    db.execute("UPDATE pokemon SET hp = 60")
  end


end
