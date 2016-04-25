class HomePageController < ApplicationController

  def show
    countries = countries_where_its_five
    @country = countries.sample
    if @country.picture_url == nil
      @country.picture_url = "http://www.citi.io/wp-content/uploads/2015/08/1168-00-06.jpg"
    end

    @drink_recommendation = @country.drinks.sample
    if (@drink_recommendation.nil? || @drink_recommendation.empty)
      @drink_recommendation = Drink.sample
    end
  end

  def countries_where_its_five
    current_utc_time = Time.current
    current_time_minutes = current_utc_time.min + (current_utc_time.hour * 60)
    days_minutes = 1440

    five_oclock = Time.current
    five_oclock = five_oclock.change({ hour: 17 })
    five_oclock = five_oclock.hour * 60

    negative_minute_difference = (current_time_minutes - five_oclock)
    positive_minute_difference = (current_time_minutes + days_minutes - five_oclock)

    start_of_hour = negative_minute_difference - (negative_minute_difference % 60) - 1
    end_of_hour = negative_minute_difference + (59 - (negative_minute_difference % 60))

    countries = Country.where(minutes_offset: (end_of_hour)..(start_of_hour))

    if countries.nil? || countries.empty?
      countries = Country.where(minutes_offset: (start_of_hour)..(end_of_hour))
    end
    countries
  end
end
