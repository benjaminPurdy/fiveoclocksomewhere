require 'rest_client'
require 'json'

namespace :update_country_offsets do
  task :new_task => :environment do

    country_codes = []

    url = 'http://api.timezonedb.com/'
    api_key = '252B3T5AZ7IX'
    country_codes_file = File.open('/Users/benjaminpurdy/Desktop/projects/five-oclock-somewhere/config/country_codes.txt')
    country_codes_file.lines do |line|
      line = line.split(" ")
      country_code = line.pop
      country_name = line.join(" ")
      country_codes.push({"country_name" =>country_name, "country_code" => country_code})
    end

    country_codes.each do |code|
      puts code
      custom_url = url + '?zone=' + code["country_code"] + '&key=' + api_key
      response = Hash.from_xml(RestClient.get custom_url).to_json
      parsed_json = ActiveSupport::JSON.decode(response)
      minutes_offset = parsed_json["result"]["gmtOffset"].to_i

      country = Country.find_or_initialize_by(name: code["country_name"], zone: code["country_code"])
      country.update(minutes_offset: minutes_offset/60)
      country.save
    end
  end

end

