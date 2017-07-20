class Anime < ApplicationRecord
	scope :anime_name, lambda { |parameter| where("name like ?", "%#{parameter}%")}
	scope :anime_year, lambda { |parameter| where("year like ?", "%#{parameter}%")}
	scope :anime_episodes, lambda { |parameter| where("episodes like ?", "%#{parameter}%")}
	scope :anime_manga, lambda {|parameter| where("manga like ?", "%#{parameter}%")}
	scope :anime_author, lambda { |parameter| where("author like ?", "%#{parameter}%")}

	def self.search(parameters)
		anime_query = self.unscoped
		parameters.each do |parameter, value|
			if not value.empty? and anime_query.respond_to? parameter
				anime_query = anime_query.send(parameter, value)
			end
		end
		anime_query
	end
end
