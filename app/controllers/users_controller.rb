class UsersController < ApplicationController



	def get_followers

		@user = User.find_by name: params[:request_user]
		
		if @user
			all_followers = Follower.where(:following => @user.name)


			followers_names = []
			all_followers.each do |element|
				followers_names.insert(-1,element.name)
			end
			
			respond_to do |format|
					format.html {render html: followers_names}
			end
		end
	end












end
