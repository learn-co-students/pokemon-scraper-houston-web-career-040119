require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id:,name:,type:,db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute('INSERT INTO pokemon (name, type) VALUES (?, ?)',[name,type])
  end

  def self.find(id, db)
    data_object = db.execute('SELECT name, type FROM pokemon WHERE id = ?', [id])

    name = data_object.flatten[0]
    type = data_object.flatten[1]

    Pokemon.new(id: id, name: name, type: type, db: db)
  end

  def alter_hp(hp, db)
    db.execute('UPDATE pokemon SET hp = ? WHERE id = ?', [hp, self.id])
  end

  def hp
    db.execute('SELECT hp FROM pokemon WHERE id = ?', [self.id]).flatten[0]
  end
end
