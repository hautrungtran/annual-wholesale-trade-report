class CreateDataItems < ActiveRecord::Migration
  def change
    create_table :data_items do |t|
      t.string :code, index: true
      t.string :name, index: true
    end
  end
end
