class StaticPagesController < ApplicationController
  def home
    @title = "UCLA Dragon Boat"
    @dboat_img = "dboat.jpg"
  end

  def about
  end

  def contact
  end
end
