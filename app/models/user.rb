class User < ApplicationRecord
    has_many :user_skills, dependent: :destroy
    has_many :skill_categories, through: :user_skills
end
