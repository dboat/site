class StaticPagesController < ApplicationController
  def home
    @title = "UCLA Dragon Boat"
    @dboat_img = "dboat.jpg"
  end

  def about
    @title = "About UCLA Dragon Boat"
  end

  def contact
    @title = "Contact UCLA Dragon Boat"
  end
end
