class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.belongs_to :genre, index: true
      t.belongs_to :artist, index: true
  #include indexes when you are using belongs_to
    end
  end
end
