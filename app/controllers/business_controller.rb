# Malyk Ratelle, le 18 octobre 2023

class BusinessController < ApplicationController

  def display

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
end
