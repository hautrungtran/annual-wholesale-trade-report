class CreateAnnualReports < ActiveRecord::Migration
  def change
    create_table :annual_reports do |t|
      t.belongs_to :data_item, index: true
      t.belongs_to :industry_classification, index: true
      t.belongs_to :operation_type, index: true
      t.integer :year
      t.decimal :value, precision: 13, scale: 2
    end
  end
end
