# Malyk Ratelle, le 18 octobre 2023

class Admin::HomeController < AdminController
  def index
    @businesses = Business.all.order(name: :DESC)
  end
end
