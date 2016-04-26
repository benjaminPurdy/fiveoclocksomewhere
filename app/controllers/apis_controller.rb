class ApisController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  before_action :validate_params

  # POST /apis/update_timezones
  def update_timezones
    change_type = params[:api][:change_type].downcase!
    puts change_type
    case change_type
    when "up"
        update_countries_offset_time(60)
    when "down"
       update_countries_offset_time(-60)
    else
      head :unprocessable_entity
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def validate_params
      valid = params.require(:change_type)
    end

    def update_countries_offset_time(minutes)
      Country.all.each do |country|
        country.minutes_offset = country.minutes_offset + minutes
        country.save!
      end
      head :ok
    end
end
