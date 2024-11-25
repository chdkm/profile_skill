class SkillCategoriesController < ApplicationController
    before_action :set_skill_category, only: [:edit, :update, :destroy]

    def index
      @skill_categories = SkillCategory.all
    end
  
    def new
      @skill_category = SkillCategory.new
    end
  
    def create
      @skill_category = SkillCategory.new(skill_category_params)
      if @skill_category.save
        redirect_to skill_categories_path, notice: 'スキルカテゴリを作成しました。'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @skill_category.update(skill_category_params)
        redirect_to skill_categories_path, notice: 'スキルカテゴリを更新しました。'
      else
        render :edit
      end
    end
  
    def destroy
      @skill_category.destroy
      redirect_to skill_categories_path, notice: 'スキルカテゴリを削除しました。'
    end
  
    private
  
    def set_skill_category
      @skill_category = SkillCategory.find(params[:id])
    end
  
    def skill_category_params
      params.require(:skill_category).permit(:name)
    end
end
