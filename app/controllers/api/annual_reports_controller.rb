class Api::AnnualReportsController < Api::ApplicationController
  def search
    criteria = {}
    data_item_id = params[:data_item_id]
    criteria[:data_item_id] = data_item_id if data_item_id
    operation_type_id = params[:operation_type_id]
    criteria[:operation_type_id] = operation_type_id if operation_type_id
    reports = AnnualReport.where(criteria)
    respond_with reports
  end
end
