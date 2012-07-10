class HaikusController < ApplicationController
  before_filter :authorize, except: [:index, :show]

  def index
    @haikus = Haiku.by_votes
  end

  def show
    @haiku = Haiku.find(params[:id])
  end

  def create
    @haiku = current_user.haikus.create!(params[:haiku])
    redirect_to @haiku, notice: "Successfully created haiku."
  end

  def vote
    vote = current_user.haiku_votes.new(value: params[:value], haiku_id: params[:id])
    if vote.save
      redirect_to :back, notice: "Thank you for voting."
    else
      redirect_to :back, alert: "Unablet to vote, perhaps you already did."
    end
  end
end
