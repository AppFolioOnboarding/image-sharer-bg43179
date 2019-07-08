class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to @image
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def index
    @images = if params[:tag].present?
                Image.tagged_with(params[:tag]).order('created_at DESC')
              else
                Image.order('created_at DESC')
              end
  end

  def destroy
    Image.find(params[:id]).destroy

    flash[:notice] = 'Delete Success'
    redirect_to images_path
  end

  private

  def image_params
    params.require(:image).permit(:image_url, :tag_list)
  end
end
