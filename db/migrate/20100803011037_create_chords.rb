class CreateChords < ActiveRecord::Migration
  def self.up
    create_table :chords do |t|
      t.string :name
      t.string :hash_ref
      t.string :ip
      t.integer :position
      t.string :key

      t.timestamps
    end
  end

  def self.down
    drop_table :chords
  end
end
