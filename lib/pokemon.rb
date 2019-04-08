require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?,?)", [name, type])
  end

  def self.find(id, db)
    test = db.execute("SELECT * FROM pokemon WHERE id = ?",id).flatten
    # binding.pry
    Pokemon.new(id: test[0], name: test[1], type: test[2], hp: test[3], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end



end
