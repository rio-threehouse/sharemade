class ToppageController < ApplicationController
  def index
    if user_signed_in?
      @results = Result.all.order('created_at DESC')
    end
  end

  def about
  end
end
