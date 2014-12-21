module BlogpostsHelper
	def blogposts_params
		params.require(:blogpost).permit(:title, :body, :tag_list, :image)
	end

end
