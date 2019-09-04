class ToppageController < ApplicationController
  def index
    @results = Result.all.order('created_at DESC')
  end

  def about
  end
end
