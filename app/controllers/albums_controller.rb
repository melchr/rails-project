class AlbumsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_album, only: [:show, :edit]
    before_filter :set_user

    def index
        @albums = Album.all
    end

    def new
        @album = Album.new
        @album.build_user
    end

    def show
        @album = Album.find(params[:user_id])
    end

    def create
        @album = current_user.albums.build(album_params)
        respond_to do |format|
            if @album.save
                format.html {redirect_to @user, @album, notice: 'Album was successfully created.'}
            else
                format.html {render :new}
            end
        end
    end

private

    def set_user
        @user = User.find(params[:user_id])
    end

    def set_album
        @album = Album.find(params[:id])
    end

    def album_params
        params.require(:album).permit(:artist, :title, user_attributes: [:name])
    end
end
