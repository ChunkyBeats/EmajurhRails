class ImagesController < ApplicationController
  def new
    # @user = User.find(params[:user_id])
    @image = Image.new()
  end
  def create
    # @user = User.find(params[:user_id])
    @image = current_user.images.new(image_params)
    if @image.save
      flash[:notice] = "Emaje uploaded. Congrats!"
      redirect_to image_path(@image)
    else
      flash[:alert] = "You shall not upload!!!"
      redirect :back
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def destroy
    @image = Image.find(params[:id])
    if current_user.id == @image.user_id
      @image.destroy
      flash[:notice] = "errrh nerrrrr. deleterrrd."
      redirect_to '/'
    else
      flash[:alert] = "NERp./"
      redirect :back
    end
  end

  private
  def image_params
    params.require(:image).permit(:title, :description, :attachment)
  end
end
