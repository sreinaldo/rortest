class OverviewsController < ApplicationController
  before_action :set_overview, only: [:show, :edit, :update, :destroy]

  # GET /overviews
  # GET /overviews.json
  def index
    @overviews = Overview.all
  end

  # GET /overviews/1
  def show
  end

  # GET /overviews/new
  def new
    @overview = Overview.new
    @overview.profile = current_user.profile.first
  end

  # GET /overviews/1/edit
  def edit
  end

  # POST /overviews
  def create
    @overview = Overview.new(overview_params)
    @overview.profile = current_user.profile.first
    respond_to do |format|
      if @overview.save
        format.html { redirect_to profiles_path, notice: 'Overview was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @overview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /overviews/1
  def update
    respond_to do |format|
      if @overview.update(overview_params)
        format.html { redirect_to profiles_path, notice: 'Overview was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /overviews/1
  # DELETE /overviews/1.json
  def destroy
    @overview.destroy
    respond_to do |format|
      format.html { redirect_to overviews_url, notice: 'Overview was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_overview
      @overview = Overview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def overview_params
      params.require(:overview).permit(:description, :profile_id)
    end
end
