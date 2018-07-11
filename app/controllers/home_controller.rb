class HomeController < ApplicationController
  require 'net/http'
  require 'json'
  def index
    # require 'net/http'
    # require 'json'
    if user_signed_in?
      redirect_to cryptos_path
    else
      @url = 'https://api.coinmarketcap.com/v1/ticker/'
      @uri = URI(@url)
      @response = Net::HTTP.get(@uri)
      @coins = JSON.parse(@response)
      @my_coins = ["BTC", "XRP", "ADA", "XLM", "STEEM"]
    end
    
  end
  def about
    
  end

  def lookup
    # require 'net/http'
    # require 'json'
    @url = 'https://api.coinmarketcap.com/v1/ticker/'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @lookup_coin = JSON.parse(@response)
    
    @symbol = params[:sym]

    if @symbol 
      @symbol = @symbol.upcase
    end

    if @symbol == ""
      @symbol = "Hey you forgot to enter a currency!"
    end
  end
end
