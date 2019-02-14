class MoviesController < ApplicationController
  def index
    @movies = Movie.all

    render("movie_templates/index.html.erb")
  end

  def show
    @movie = Movie.find(params.fetch("id_to_display"))

    render("movie_templates/show.html.erb")
  end

  def new_form
    render("movie_templates/new_form.html.erb")
  end

  def create_row
    p = Movie.new
    
    p.title = params.fetch("title")
    p.year = params.fetch("year")
    p.duration = params.fetch("duration")
    p.description = params.fetch("description")
    p.image_url = params.fetch("image_url")
    p.save

    redirect_to("/movies", :notice => "Movie created successfully.")
  end

  def edit_form
    movie_id = params.fetch("prefill_with_id")
    @movie = Movie.find(movie_id)
    
    render("movie_templates/edit_form.html.erb")
  end

  def update_row
    movie_id = params.fetch("id_to_modify")
    @movie = Movie.find(movie_id)
    @movie.title = params.fetch("title")
    @movie.year = params.fetch("year")
    @movie.duration = params.fetch("duration")
    @movie.description = params.fetch("description")
    @movie.image_url = params.fetch("image_url")
    @movie.save

    redirect_to("/movies/" + movie_id, { :notice => "Movie updated successfully."})
  end

  def destroy_row
    movie = Movie.find(params.fetch("id_to_remove"))

    movie.destroy

    redirect_to("/movies", :notice => "Movie deleted successfully.")
  end
end
