class ProfilesController < ApplicationController
    def new
        # This form allows a user to fill out their own profile.
        @user = User.find( params[:user_id] )
        @profile = @user.build_profile
    end

    def create
        
    end
end