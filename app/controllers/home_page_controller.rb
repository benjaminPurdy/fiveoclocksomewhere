class HomePageController < ApplicationController

  def show
    current_utc_time = Time.current
    current_time_minutes = current_utc_time.min + (current_utc_time.hour * 60)
    five_oclock = Time.current
    five_oclock = five_oclock.change({ hour: 17 })
    five_oclock = five_oclock.hour * 60
    minute_difference = (current_time_minutes - five_oclock)
    countries = countries_whos_time_matches minute_difference
    @country = countries.sample
  end

  def countries_whos_time_matches minute_difference
    puts minute_difference
    start_of_hour = minute_difference - (minute_difference % 60) - 1
    puts start_of_hour
    end_of_hour = minute_difference + (59 - (minute_difference % 60))
    puts end_of_hour
    negitive_check = Country.where(minutes_offset: (end_of_hour * -1)..(start_of_hour * -1))
    #positive_check = Country.where(minutes_offset: ((24*60) - start_of_hour)..((24*60) - end_of_hour))
    #countries = [negitive_check, positive_check].flatten

  end

  def dummy

  end
end
