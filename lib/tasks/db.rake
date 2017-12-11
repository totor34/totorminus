namespace :db do
  desc "TODO"
  task seed_stations: :environment do
    def train_stations_list
      stations_hash = []
      filepath = Rails.root.join('db','trainline-eu_stations.csv')
      csv_options = { col_sep: ';', quote_char: '"', headers: :first_row}
      CSV.foreach(filepath, csv_options) do |row|
        station = {
          station: "#{row[1]}",
          uic8_sncf: "#{row[4]}",
          latitude: "#{row[5]}",
          longitude: "#{row[6]}",
          country: "#{row[8]}"
        }
        if station[:uic8_sncf] != "" && station[:country] == "FR"
          stations_hash << {
            station: station[:station],
            lat: station[:latitude].to_f,
            long: station[:longitude].to_f
          }
        end
      end
      return stations_hash
    end

    stations = train_stations_list

    stations.each_with_index do |station, index|
      StartPoint.create!(stations[index])
    end
  end

end
