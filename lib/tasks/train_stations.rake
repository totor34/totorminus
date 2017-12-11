# Replaced by trainline-eu stations csv list available on GitHub
# require "open-uri"
# require "nokogiri"
# require "pry-byebug"


# def scrape_wikipedia_train_stations
#   url = "https://fr.wikipedia.org/wiki/Liste_de_gares_en_France"
#   html_file = open(url).read
#   html_doc = Nokogiri::HTML(html_file)
#   binding.pry
#   html_doc.search(".colonnes ul li ").each do |element|
#     puts element.text.strip
#   end

# end

# scrape_wikipedia_train_stations


# Using the trainline-eu csv file we can define a task for sseding
# require 'csv'
# require 'pry-byebug'

# def train_stations_list
#   stations_hash = []
#   filepath = File.join(__dir__, 'trainline-eu_stations.csv')
#   # './assets/trainline-eu_stations.csv'
#   csv_options = { col_sep: ';', quote_char: '"', headers: :first_row}
#   CSV.foreach(filepath, csv_options) do |row|
#     station = {
#       station: "#{row[1]}",
#       uic8_sncf: "#{row[4]}",
#       latitude: "#{row[5]}",
#       longitude: "#{row[6]}",
#       country: "#{row[8]}"
#     }
#     if station[:uic8_sncf] != "" && station[:country] == "FR"
#       stations_hash << station
#     end
#     # puts "#{row[1]} - #{row[4]} - #{row[5]} - #{row[6]} - #{row[8]}"
#     end
#    return stations_hash
# end

