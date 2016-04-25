class Drink < ActiveRecord::Base
  has_many :drink_country_mappings
  has_many :countries, :through => :drink_country_mappings

  def random
  end
end
