class AlbumsController < ApplicationController
  def new
    @bands = Band.all_bands_ordered
    @band = Band.find_by(id: params[:band_id])
    @band ||= Band.all.first
    render :new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def show
    @album = Album.find_by(id: params[:id])
  end

  def edit
    @album = Album.find_by(id: params[:id])
    @bands = Band.all_bands_ordered
    render :edit
  end

  def update
    @album = Album.find_by(id: params[:id])

    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    @album.destroy
    redirect_to band_url(@album.band)
  end

  private

  def album_params
    params.require(:album).permit(:title, :year, :band_id, :studio)
  end
end
