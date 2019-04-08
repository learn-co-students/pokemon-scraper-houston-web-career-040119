require "sqlite3"
require "pry"


#   db.execute("sql code goes here")

class Pokemon
    
    
    attr_accessor :id, :name, :type, :hp, :db
    @@all = []
    
    def initialize(pokemon, hp = nil)
        @id = pokemon[:id]
        @name = pokemon[:name]
        @type = pokemon[:type]
        @db = pokemon[:db]
        @hp = pokemon[:hp]
        @@all.push(self)
    end
    
    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name,type)
    end
    
    def self.find(id_index, db)
        new_mon = db.execute("SELECT * FROM pokemon WHERE id = ?", id_index).flatten
        Pokemon.new(id: new_mon[0], name: new_mon[1], type: new_mon[2], hp: new_mon[3], db: db)
        # binding.pry
    end
    
    def alter_hp(new_hp, db)
        db.execute("UPDATE pokemon SET hp = ? WHERE id = ?",new_hp,self.id)
    end
    
end
