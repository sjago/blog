class VotesController < ApplicationController	

  def create

    attrs = params.permit(:voteable_type, :voteable_id)
    Vote.new(attrs).save
    
    redirect_to :back

  end

end