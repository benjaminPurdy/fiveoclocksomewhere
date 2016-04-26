class HomePageController < ApplicationController

  def show
    countries = countries_where_its_five
    @country = countries.sample
    puts @country.inspect
    if @country.picture_url == nil
      @country.picture_url = "http://www.citi.io/wp-content/uploads/2015/08/1168-00-06.jpg"
    end

    @drink_recommendation = @country.drinks.sample
    if (@drink_recommendation.nil? || @drink_recommendation.empty)
      @drink_recommendation = Drink.offset(rand(Drink.count)).first
    end
  end

  def countries_where_its_five
    days_hours = 24
    current_utc_time = Time.current
    five_oclock = Time.current
    five_oclock = five_oclock.change({ hour: 17 })

    forward_hours_different = (five_oclock.hour - current_utc_time.hour)
    past_hours_different = (days_hours - forward_hours_different) * -1

    countries = Country.where(minutes_offset: (forward_hours_different * 60)..(((forward_hours_different + 1) * 60) -1))
    countries = countries +  Country.where(minutes_offset: (past_hours_different * 60)..(((past_hours_different - 1) * 60) -1))

  end
end
