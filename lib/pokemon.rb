require 'sqlite3'
require 'pry'

class Pokemon

  @@all = []

  attr_accessor :id, :name, :type, :db, :hp

  def initialize (pokemon)
    # binding.pry
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
    @hp = pokemon[:hp]
    @@all << self
  end

  def self.save (name, type, db)
    #saves an instace of a pokemon with the correct id
    db.execute("INSERT INTO pokemon (name, type) VALUES ( ? , ?)",name,type)
  end

  def self.find (id, db)
    arr = db.execute("SELECT * FROM pokemon WHERE id = ?",id).flatten
    # binding.pry
    Pokemon.new({id: arr[0],name: arr[1], type: arr[2], hp: arr[3], db: db})
    #Bonus 1
    # The find method should create a new Pokemon object with an id, type, name AND hp after selecting their row from the database
    #by their id number. remember to also update the initialize method to accept an argument of hp that defaults to nil if not set
    #(so it still passes the non-bonus tests)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?",hp, self.id)
  end

  # def self.all
  #   @@all
  # end

end
