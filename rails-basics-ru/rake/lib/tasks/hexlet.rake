# frozen_string_literal: true

require 'csv'

namespace :hexlet do

  desc 'Import users from a CSV file'
  task :import_users, [:csv_file] => :environment do |_t, args|
    csv_file_name = args.csv_file

    raise 'No CSV file provided' if !csv_file_name || csv_file_name.empty?
    raise 'CSV file does not exist' unless File.exist?(csv_file_name)

    CSV.foreach(csv_file_name, headers: true) do |row|
      user_data = {
        first_name: row['first_name'],
        last_name: row['last_name'],
        birthday: Date.strptime(row['birthday'], '%m/%d/%Y'),
        email: row['email'],
      }
      User.create(user_data)
    end
    # pp csv_file_name

  end

end
