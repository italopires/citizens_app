class Api::V1::CitiesController < ApplicationController
  def index
    @cities = City.where(state_id: params[:state_id]).order(:name)
  end
end