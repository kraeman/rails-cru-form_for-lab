class GenresController < ApplicationController
    def show
        @genre = Genre.find(params[:id])
    end
    
    def new
        @genre = Genre.new
        @genre.save
    end
    
    def create
        @genre = Genre.last
        @genre.name = params['genre']['name']
        @genre.save
        redirect_to genre_path(@genre)
    end
    
    def edit
        @genre = Genre.find(params[:id])
    end
      
    def update
        @genre = Genre.find(params[:id])
   
        @genre.update(name: params[:genre][:name])
        redirect_to genre_path(@genre)
    end 
end
