class ElectionTrailsController < ApplicationController
  before_action :authenticate_user!

  def index
    @election_trails = Election.find(params[:election_id]).election_trails if params[:election_id]
  end
end
