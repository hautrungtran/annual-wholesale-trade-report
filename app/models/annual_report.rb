class AnnualReport < ActiveRecord::Base
  belongs_to :data_item, autosave: true
  belongs_to :operation_type, autosave: true
  belongs_to :industry_classification, autosave: true
end
