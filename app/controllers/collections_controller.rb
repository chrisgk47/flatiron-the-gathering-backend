class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :update, :destroy]

  # GET /collections
  def index
    @collections = Collection.all

    render json: @collections
  end

  # GET /collections/1
  def show
    render json: @collection
  end

  # POST /collections
  def create
    @collection = Collection.new(collection_params)

    if @collection.save
      render json: @collection, status: :created, location: @collection
    else
      render json: @collection.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /collections/1
  def update
    if @collection.update(collection_params)
      render json: @collection
    else
      render json: @collection.errors, status: :unprocessable_entity
    end
  end

  # DELETE /collections/1
  def destroy
    @collection.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collection_params
      params.require(:collection).permit(:user_id, :card_id, :favorite)
    end
end
