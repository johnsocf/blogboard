class BlogpostsController < ApplicationController

include BlogpostsHelper


	def index
		@blogpost = Blogpost.all

	end

	def new
		@blogpost = Blogpost.new

	end

	def create
		@blogpost = blogpost.create(blogposts_params)
		@blogpost.user_id = current_user.email

		@blogpost.save

		@current_user = current_user

		puts "$$$$$$$$$$$$"
		puts @current_user.inspect


		if @current_user.saved_content
			puts @current_user.saved_content
		elsif @current_user.saved_title
			puts @current_user.saved_title
		end


		if @topic.valid?
			redirect_to blogpost_path(@blogpost)
			current_user.saved_title = nil
			current_user.saved_content = nil
			current_user.save
		else
			puts "---------"
			puts @blogpost.inspect

			if @blogpost.title == ""
				@current_user.saved_content = @blogpost.content
				@current_user.saved_title = nil
			elsif @blogpost.content == ""
				@current_user.saved_content = nil
				@current_user.saved_title = @blogpost.title
			end
			# puts @current_user.inspect

			@current_user.save

			redirect_to new_blogpost_path(@blogpost)
		end


		# if @blogpost.id
		# 	# redirect_to blogpost_path(@blogpost)
		# else
		# 	# redirect_to home_index_path
		# end
	end

	def show
		@blogpost = Blogpost.find(params[:id])
	end

	def destroy
		# puts '*********'
		# puts Blogpost.find(params[:id])
		@blogpost = Blogpost.find(params[:id])
		@blogpost.destroy

		redirect_to home_index_path
	end

end
