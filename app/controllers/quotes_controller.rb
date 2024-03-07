class DashboardController < ApplicationController
  def show
    @quote = ZenQuotesService.fetch_random_quote
  end
end
