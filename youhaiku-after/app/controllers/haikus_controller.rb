class HaikusController < ApplicationController
  before_filter :authorize, except: [:index, :show]

  def index
    @haikus = Haiku.find_with_reputation(:votes, :all, order: "votes desc")
  end

  def show
    @haiku = Haiku.find(params[:id])
  end

  def create
    @haiku = current_user.haikus.create!(params[:haiku])
    redirect_to @haiku, notice: "Successfully created haiku."
  end
  
  def vote
    value = params[:type] == "up" ? 1 : -1
    @haiku = Haiku.find(params[:id])
    @haiku.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thank you for voting"
  end
end
