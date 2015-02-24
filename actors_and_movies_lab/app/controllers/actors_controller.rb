class ActorsController < ApplicationController
  def index
    @actors = Actor.all
  end

  def new
    @actor = Actor.new    
  end

  def create
    @actor = Actor.create actor_params
    redirect_to actors_path
  end

  def edit
     @actor = Actor.find(params[:id])
      @movies = Movie.all
  end

  def show
    @actor = Actor.find(params[:id])
    @movies = @actor.movies
  end

  def update
    actor = Actor.find(params[:id])
    actor.update_attributes actor_params
    redirect_to actor_path(actor)
  end

  def destroy
    actor = Actor.find(params[:id])
    actor.destroy
    redirect_to actors_path
  end

  def add_movie
    movie = Movie.find(params[:movie_id])
    actor = Actor.find(params[:id])
    actor.movies << movie
    redirect_to actor_path
  end

  def remove_movie
    movie = Movie.find(params[:movie_id])
    actor = Actor.find(params[:id])
    actor.movies.delete(movie)
    redirect_to actor_path(actor)
  end

  private

  def actor_params
    params.require(:actor).permit(:name, :title)
  end
end
