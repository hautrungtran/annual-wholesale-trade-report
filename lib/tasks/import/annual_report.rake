namespace :import do
  desc 'Import Annual Reports'
  task :annual_report, [:file_path, :headers] => :environment do |t, args|
    args.with_defaults(headers: ['Data Item'])
    puts "import file: #{args.file_path}"
    if args.file_path
      XlsHelper.save_annual_report args.file_path, args.headers
      puts 'import successful.'.colorize(:green)
    else
      puts 'file path is required.'.colorize(:red)
    end
  end
end
