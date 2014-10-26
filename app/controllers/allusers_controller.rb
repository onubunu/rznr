class AllusersController < ApplicationController
  before_filter :authenticate_user!#, except: [ :index, :show ]
  before_filter :is_admin?#, except: [ :index, :show ]
  def index 
    @allusers = User.where(ENV["GNCML"]).all
  end
end
