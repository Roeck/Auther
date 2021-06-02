class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :privacy_policy]

  def home
  end

end
