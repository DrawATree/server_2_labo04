# Malyk Ratelle, le 1 novembre 2023

class MesmenusController < ApplicationController
  before_action :authenticate_user!

  def index
    @businesses = current_user.businesses.order(name: :ASC)
  end

  def display
    is_user_owner(params[:id])

    @business = Business.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => businessJson().to_json }
      format.xml { render :xml => businessJson().to_xml }
    end
  end

  private def businessJson
    return @business.as_json(
      include: { menus: {
          include: { menus: {
              include: :items
          } }
      } }, only: :menus
    )
  end

  private def is_user_owner(id)
    unless !current_user || current_user.is_admin?
      current_user.businesses.find(id) rescue redirect_to '/mesmenus', alert: "You don't have access to this. Redirected to your menus"
    end
  end

end
