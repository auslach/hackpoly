require 'csv'

desc "Import list of universities from universities.csv file"
task :import_universities => :environment do

  # data provided by: https://inventory.data.gov/dataset/032e19b4-5a90-41dc-83ff-6e4cd234f565/resource/38625c3d-5388-4c16-a30f-d105432553a4
  file = "db/universities.csv"

  # clear the universities table
  University.delete_all

  puts "Importing from '#{file}'.."
  count = 0
  CSV.foreach(file, :headers => true) do |record|
    University.create(name: record[1], url: record[15])
    count += 1
  end

  puts "#{count} universities imported."
end

desc "Import list of majors"
task :import_majors => :environment do

  # data provided by: https://github.com/fivethirtyeight/data/blob/master/college-majors/majors-list.csv
  file = "db/majors.csv"

  Major.delete_all

  puts "Importing from '#{file}'.."
  count = 0
  CSV.foreach(file, :headers => true) do |record|
    Major.create(name: record[1])
    count += 1
  end

  puts "#{count} majors imported."
end
