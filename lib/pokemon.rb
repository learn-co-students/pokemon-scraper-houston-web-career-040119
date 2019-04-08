require 'pry'

class Pokemon
    attr_accessor :name, :type, :db, :id

    def initialize(db)
        @id = db[:id]
        @name = db[:name]
        @type = db[:type]
        @db = db[:db]
    end

    def self.save(name, type, db)
        #"INSERT INTO pokemon(name, type, db) VALUES('Pikachu', 'electric', db);"
        #ins = db.prepare('insert into pokemon (name, type, db) values ('Pikachu', 'electric', db)')
        db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", [name, type])

    end

    def self.find(id, db)
        pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", [id]).flatten
        #this finds our pokemon based on id
        pokemon_hash = {id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db }
        Pokemon.new(pokemon_hash)
        #this part returns a new pokemon, after we located it w/id
    end
    
end
