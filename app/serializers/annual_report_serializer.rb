class AnnualReportSerializer < ActiveModel::Serializer
  attributes :id, :year, :value
  has_one :data_item
  has_one :industry_classification
  has_one :operation_type
end
