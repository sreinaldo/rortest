class EducationsController < ApplicationController
  before_action :set_education, only: [:show, :edit, :update, :destroy]

  # GET /educations
  # GET /educations.json
  def index
    @educations = Education.all
  end

  # GET /educations/1
  def show
  end

  # GET /educations/new
  def new
    @education = Education.new
    @education.profile = current_user.profile.first
  end

  # GET /educations/1/edit
  def edit
  end

  # POST /educations
  def create
    @education = Education.new(education_params)

    respond_to do |format|
      if @education.save
        format.html { redirect_to educations_path, notice: 'Education was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /educations/1
  def update
    respond_to do |format|
      if @education.update(education_params)
        format.html { redirect_to educations_path, notice: 'Education was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /educations/1
  def destroy
    @education.destroy
    respond_to do |format|
      format.html { redirect_to educations_path, notice: 'Education was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_education
      @education = Education.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def education_params
      params.require(:education).permit(:institution, :profile_id, :degree, :start_date, :end_date)
    end
end
