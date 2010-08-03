class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.integer :chord_id
      t.integer :fret
      t.integer :string
      t.integer :finger

      t.timestamps
    end
  end

  def self.down
    drop_table :notes
  end
end
