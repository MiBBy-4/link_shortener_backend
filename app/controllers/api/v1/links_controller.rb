class Api::V1::LinksController < ApplicationController
  before_action :set_link, only: [:show, :update, :destroy]

  def index
    @links = Link.all
    render json: @links.to_json
  end

  def show
    render json: @link.to_json
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      render json: {
        status: 201,
        link: @link
      }
    else
      render json: {
        errors: @link.errors.full_messages,
        status: 422
      }
    end
  end

  def update
    if @link.update(link_params)
      render json: @link, status: 200
    else
      render json: {
        errors: @link.errors.full_messages,
        status: 422
      }
    end
  end

  def destroy
    @link.destroy
  end

  private

  def set_link
    @link = Link.find(params[:id])
  end

  def idea_params
    params.require(:link).permit(:base_link)
  end
end