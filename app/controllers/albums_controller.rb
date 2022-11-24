class AlbumsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_album,  except: [:index,:new, :create]
  before_action :check_owner,  only: [:edit]
  
    def index
      @q = Album.all.ransack(params[:q])
      @albums = @q.result(distinct: true)
    end

  def show
  end
  
  def new
    @album = Album.new
  end

  def create  
    @album = current_user.albums.new(album_params)
     if @album.save
      redirect_to @album
    else
      render :new, status: :unprocessable_entity
  end
end

def edit
end
  
 def update
    if @album.update(album_params)
      redirect_to @album
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @album.destroy
    redirect_to root_path, status: :see_other
  end

private
  def set_album
    @album = Album.find(params[:id])
  end

  def check_owner
    redirect_to root_path if @album.user != current_user
  end

    def album_params
      params.require(:album).permit(:name, :description,:allow_download,:cover_image,:audio_data,:tag_list )
    end
end

