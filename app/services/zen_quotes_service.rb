require 'net/http'
require 'json'

class ZenQuotesService
  def self.fetch_random_quote
    url = URI("https://zenquotes.io/api/random")
    response = Net::HTTP.get(url)
    JSON.parse(response).first
  end
end
