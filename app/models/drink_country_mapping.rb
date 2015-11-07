class DrinkCountryMapping < ActiveRecord::Base
  belongs_to :country
  belongs_to :drink
end
