class Wallet < ActiveRecord::Base
  attr_accessible :name, :country_id, :url, :logo; :published
end