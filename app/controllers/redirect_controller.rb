class RedirectController < ApplicationController
  before_action :set_link

  def shorted_link
    @link.views += 1
    @link.save
    redirect_to @link.base_link, allow_other_host: true
  end
  
  private

  def set_link
    @link = Link.where("shorted_link = :link", link: params[:link]).first
  end
end