class CreateFootnotes < ActiveRecord::Migration
  def change
    create_table :footnotes do |t|
      t.string :code, index: true
      t.text :text
      t.timestamps
    end
  end
end
