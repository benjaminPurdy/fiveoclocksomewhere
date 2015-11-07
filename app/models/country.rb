class Country < ActiveRecord::Base
  has_many :drink_country_mappings
  has_many :drinks, :through => :drink_country_mappings
end
