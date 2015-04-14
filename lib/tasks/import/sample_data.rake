namespace :import do
  desc 'Import sample data'
  task :sample_data, [:clear_data, :headers] => :environment do |t, args|
    if args.clear_data
      puts 'clean up data....'
      IndustryClassification.destroy_all
      OperationType.destroy_all
      DataItem.destroy_all
      AnnualReport.destroy_all
      puts 'clean data done.'
    end
    current_dir = File.dirname(__FILE__)
    Rake::Task['import:annual_report'].invoke "#{current_dir}/data/2013_awts_sales_table1.xls"
    Rake::Task['import:annual_report'].reenable
    Rake::Task['import:annual_report'].invoke "#{current_dir}/data/2013_awts_ecom_table2.xls"
    Rake::Task['import:annual_report'].reenable
    Rake::Task['import:annual_report'].invoke "#{current_dir}/data/2013_awts_inv_table3.xls"
  end
end