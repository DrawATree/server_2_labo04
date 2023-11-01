# Malyk Ratelle, le 18 octobre 2023

class Admin::BusinessController < AdminController
  def display
    @business = Business.find(params[:id])

  end
end
