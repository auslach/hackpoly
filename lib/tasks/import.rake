require 'csv'

desc "Import list of universities from universities.csv file"
task :import_universities => :environment do
  file = "db/universities.csv"

  # clear the universities table
  University.delete_all

  puts "Importing from '#{file}'.."
  count = 0
  CSV.foreach(file, :headers => true) do |record|
    University.create(:name => record[1])
    count += 1
  end

  puts "#{count} universities imported."
end
