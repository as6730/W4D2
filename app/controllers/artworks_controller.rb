class ArtworksController < ApplicationController

  def index
    render json: Artwork.all
  end

  def create
    artwork = Artwork.new(artwork_params)

    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    artwork = Artwork.find(params[:id])

    if artwork
      render json: artwork
    else
      "No artwork exists."
    end
  end

  def update
    artwork = Artwork.find(params[:id])

    if artwork
      artwork.update(artwork_params)
      render json: artwork
    else
      redirect_to artworks_url
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])

    artwork.destroy(artwork_params)
    redirect_to artworks_url
  end

  private

  def artwork_params
    params.require(:artwork).permit(:artist_id, :title, :image_url)
  end
end
