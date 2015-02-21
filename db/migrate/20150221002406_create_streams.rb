class CreateStreams < ActiveRecord::Migration
  def change
    create_table :streams do |t|
      t.text :body
      t.integer :timelimit
      t.timestamps
    end
  end
end
