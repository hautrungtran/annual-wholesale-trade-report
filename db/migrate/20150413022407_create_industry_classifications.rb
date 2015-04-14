class CreateIndustryClassifications < ActiveRecord::Migration
  def change
    create_table :industry_classifications do |t|
      t.string :code, index: true
      t.string :name
    end
  end
end
