# Malyk Ratelle, le 18 octobre 2023

class HomeController < ApplicationController

  def index
    @businesses = Business.all.order(name: :ASC)
  end

end
