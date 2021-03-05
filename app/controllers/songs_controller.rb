class SongsController < ApplicationController
    def show
        @song = Song.find(params[:id])
        # @genre = Genre.find(@song.genre_id)
        # @artist = Artist.find(@song.artist_id)
    end
    
    def new
        @song = Song.new
        @song.save
    end
    
    def create
        song = Song.create(post_params(:artist_id, :genre_id, :name))
        # song.update(post_params)
        # song.save
        redirect_to song_path(song)
    end
    
    def edit
        @genres = Genre.all
        @artists = Artist.all
        @song = Song.find(params[:id])
    end

    def index
        @songs = Song.all
    end
      
    def update
        @song = Song.find(params[:id])
   
        @song.update(post_params(:artist_id, :genre_id, :name))
        redirect_to song_path(@song)
    end 


    private

    def post_params(*args)
        params.require(:song).permit(*args)
    end

end
