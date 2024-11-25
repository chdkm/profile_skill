class UserSkillsController < ApplicationController
    before_action :set_user
    before_action :set_user_skill, only: [:edit, :update, :destroy]
  
    def index
      @user_skills = @user.user_skills.includes(:skill_category)
    end
  
    def new
      @user_skill = @user.user_skills.new
      @skill_categories = SkillCategory.all
    end
  
    def create
      @user_skill = @user.user_skills.new(user_skill_params)
      if @user_skill.save
        redirect_to user_user_skills_path(@user), notice: 'スキル評価を追加しました。'
      else
        @skill_categories = SkillCategory.all
        render :new
      end
    end
  
    def edit
      @skill_categories = SkillCategory.all
    end
  
    def update
      if @user_skill.update(user_skill_params)
        redirect_to user_user_skills_path(@user), notice: 'スキル評価を更新しました。'
      else
        @skill_categories = SkillCategory.all
        render :edit
      end
    end
  
    def destroy
      @user_skill.destroy
      redirect_to user_user_skills_path(@user), notice: 'スキル評価を削除しました。'
    end
  
    private
  
    def set_user
      @user = User.find(params[:user_id])
    end
  
    def set_user_skill
      @user_skill = @user.user_skills.find(params[:id])
    end
  
    def user_skill_params
      params.require(:user_skill).permit(:skill_category_id, :rating)
    end
end
