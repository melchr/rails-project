class AlbumsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @albums = Album.all
    end

    def new
        @album = Album.create
    end

    def create
        @album = current_user.albums.build(album_params)
        respond_to do |format|
            if @album.save
                format.html {redirect_to @album, notice: 'Album was successfully created.'}
            else
                format.html {render :new}
            end
        end
    end

private

    def set_album
        
    end

    def album_params
        params.require(:album).permit(:artist, :title)
    end
end
