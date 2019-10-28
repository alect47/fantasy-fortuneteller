require 'rake'
require 'rubygems'
require 'faraday'

namespace :import do
  desc 'Import from ff-nerd-service'

  # this will need to be updated to add api_key
  task players: :environment do
    player_data.each do |pd|
      Player.create!(active: pd[:active], jersey: pd[:jersey], lname: pd[:lname],
            fname: pd[:fname], display_name: pd[:displayName], team: pd[:team],
            position: pd[:position], height: pd[:height], weight: pd[:weight],
            college: pd[:college], experience: pd[:experience], birth_date: pd[:birthDate],
            photo_url: pd[:photoUrl], bye_week: pd[:byeWeek], ffn_id: pd[:ffn_id]
            )
    end
  end
end

def player_data
  json_response = Faraday.get "https://ff-nerd-service.herokuapp.com/players?key=#{ENV['MY_FF_API_KEY']}"
  JSON.parse(json_response.body, symbolize_names: true)
end