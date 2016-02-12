class SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :edit, :update, :destroy]

  # GET /skills
  def index
    @skills = Skill.all
  end

  # GET /skills/1
  def show
  end

  # GET /skills/new
  def new
    @skill = Skill.new
    @skill.profile = current_user.profile.first
  end

  # GET /skills/1/edit
  def edit
  end

  # POST /skills
  def create
    @skill = Skill.new(skill_params)

    respond_to do |format|
      if @skill.save
        format.html { redirect_to skills_path, notice: 'Skill was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /skills/1
  # PATCH/PUT /skills/1.json
  def update
    respond_to do |format|
      if @skill.update(skill_params)
        format.html { redirect_to skills_path, notice: 'Skill was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /skills/1
  # DELETE /skills/1.json
  def destroy
    @skill.destroy
    respond_to do |format|
      format.html { redirect_to skills_path, notice: 'Skill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill
      @skill = Skill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skill_params
      params.require(:skill).permit(:description, :profile_id)
    end
end
