class BirdsController < ApplicationController

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  def create
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end

  # GET /birds/:id
  def show
    render json: @bird
  end

  # PATCH /birds/:id
  def update
    @bird.update(bird_params)
    render json: bird
  end

  # PATCH /birds/:id/like
  def increment_likes
    @bird.update(likes: bird.likes + 1)
    render json: bird
  end

  # DELETE /birds/:id
  def destroy
    @bird.destroy

    head :no_content
  end

  private

  def bird_params
    params.permit(:name, :species, :likes)
  end

  def find_bird
    @bird = Bird.find(params[:id])
  end

end
