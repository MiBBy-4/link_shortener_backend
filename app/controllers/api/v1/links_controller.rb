class Api::V1::LinksController < ApplicationController
  before_action :set_link, only: [:show, :update, :destroy]

  def index
    @links = Link.all
    render json: @links.to_json(include: [:user, :tags])
  end

  def show
    render json: @link.to_json(include: [:user, :tags])
  end

  def create
    @link = Link.new(link_params)
    @link.shorted_link = generate_shorted_link
    @link.user_id = session[:user_id]
    if @link.save
      tags = tags_params
      unless tags.empty?
        tags.each { |tag| @link.tags.create(tag_name: tag, user_id: session[:user_id]) }
      end

      render json: {
        status: 201,
        link: @link,
        tags: tags
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

  def generate_shorted_link
    charset = Array('A'..'Z') + Array('a'..'z')
    Array.new(rand(4..15)) { charset.sample }.join
  end

  def set_link
    @link = Link.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:base_link, :description)
  end

  def tags_params
    params.require(:tags)
  end
end
