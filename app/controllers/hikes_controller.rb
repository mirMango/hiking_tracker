class HikesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :set_hike, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  # GET /hikes or /hikes.json
  def index
    # @hikes = current_user.hikes
    @hikes = Hike.all
  end

  # GET /hikes/1 or /hikes/1.json
  def show1
  end

  # GET /hikes/new
  def new
    @hike = Hike.new
  end

  # GET /hikes/1/edit
  def edit
  end

  # POST /hikes or /hikes.json
  def create
    @hike = current_user.hikes.build(hike_params)

    respond_to do |format|
      if @hike.save
        format.html { redirect_to @hike, notice: "Hike was successfully created." }
        format.json { render :show, status: :created, location: @hike }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hike.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hikes/1 or /hikes/1.json
  def update
    respond_to do |format|
      if @hike.update(hike_params)
        format.html { redirect_to @hike, notice: "Hike was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @hike }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hike.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hikes/1 or /hikes/1.json
  def destroy
    @hike.destroy!

    respond_to do |format|
      format.html { redirect_to hikes_path, notice: "Hike was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hike
      @hike = Hike.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def hike_params
      params.expect(hike: [ :name, :distance, :description ])
    end

    def authorize_user!
      if current_user != @hike.user
        redirect_to hikes_path, alert: "Nu ai permisiunea să faci asta."
      end
    end
end
