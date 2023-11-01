# Malyk Ratelle, le 18 octobre 2023

class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :must_be_an_admin

  def must_be_an_admin
    redirect_to '/' unless current_user.is_admin?
  end
end
