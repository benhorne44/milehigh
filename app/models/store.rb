require 'json'

class Store < ActiveRecord::Base

  has_many :reviews
  validates :name, presence: true

  def self.scrape_and_save_to_database
    scraped = Scraper.scrape_stores(Scraper.dispensary_urls)[:stores]

    stores = []
    scraped.each_with_index do |store, index|
      created = create(store)
      stores << created
      puts "created store #{index}"
    end
    stores
  end

  def menu_to_array
    JSON.parse(self.menu)
  end

  def store_name
    self.try(:name)
  end

  def positive_count
    reviews.positive.count
  end

  def negative_count
    reviews.negative.count
  end

  searchable do
    text :name, :address, :menu,
         :city, :hours, :zipcode, :slug
  end
end
