# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    flash[:alert] = {
      title: 'Discussion moved',
      body: 'Lorem ipsum dolor sit amet consectetur adipisicing elit oluptatum tenetur.'
    }
    render :index
  end
end
