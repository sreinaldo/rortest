class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  def index
    @profiles = current_user.profile.first
    @profile_name = @profiles.name if  @profiles.present?
  end

  def view_profiles
    @profiles = Profile.find params[:id]
    @profile_name = @profiles.name if  @profiles.present?
    render 'index'
  end


  # GET /profiles/1
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
    @profile.user = current_user
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to profiles_path, notice: 'Profile was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /profiles/1
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profiles_path, notice: 'Profile was successfully updated.' }
      else
        format.html { render :index }
      end
    end
  end

  # DELETE /profiles/1
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:name, :birthday, :user_id)
    end
end
