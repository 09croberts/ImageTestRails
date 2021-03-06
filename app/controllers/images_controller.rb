class ImagesController < ApplicationController
  def index
    @ImagesAll = Image.all
    @Images = Image.search_btype(params[:search_btype])
    @Images = @Images.search_date(params[:search_date])
  end

  def new
  	@Image = Image.new
  end

  def create
  	@Image = Image.new(image_params)

  	if @Image.save
  		redirect_to images_path, notice: "The image has been uploaded"
  	else
  		render new
  	end
  end

  def destroy
  	@Image = Image.find(params[:id])
  	@Image.destroy
  	redirect_to images_path, notice: "The image has been deleted"
  end

  private
  	def image_params
  	params.require(:image).permit(:body_type, :attachment)
  end
end
