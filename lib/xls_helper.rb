class XlsHelper
  def self.save_annual_report(file, headers)
    result = []
    document = Roo::Spreadsheet.open(file)
    document.each_with_pagename do |name, sheet|
      rows = sheet.parse(header_search: headers, clean: true)
      years = get_years(rows[0].values)
      rows.each do |row|
        result.push(save_reports(row, years))
      end
    end
    result
  end

  def self.get_years(headers)
    result = []
    (4..headers.length-1).each { |i|
      result.push(headers[i].to_f)
    }
    result
  end

  def self.save_reports(row, years)
    result = []
    industry_classification_code = row.values[0]
    return result unless industry_classification_code.is_a? Float
    data_item_name = row.values[1]
    industry_classification_name = row.values[2]
    operation_type_name = row.values[3]
    industry_classification = IndustryClassification.find_by_code(industry_classification_code) || IndustryClassification.new(code: industry_classification_code)
    industry_classification.name = industry_classification_name
    data_item = DataItem.find_by_name(data_item_name) || DataItem.new(name: data_item_name)
    operation_type = OperationType.find_by_name(operation_type_name) || OperationType.new(name: operation_type_name)
    years.each_with_index  do |year, i|
      report = AnnualReport.find_by(industry_classification_id: industry_classification.id, data_item_id: data_item.id, operation_type_id: operation_type.id, year: year) ||
          AnnualReport.new(industry_classification: industry_classification, data_item: data_item, operation_type: operation_type, year: year)
      report.value = row.values[i + 4]
      report.save
      result.push(report)
    end
    result
  end
end