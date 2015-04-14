class CreateOperationTypes < ActiveRecord::Migration
  def change
    create_table :operation_types do |t|
      t.string :code, index: true
      t.string :name, index: true
    end
  end
end
