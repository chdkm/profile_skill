class UserSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill_category

  validates :rating, presence: true, inclusion: { in: %w[S A B C D E F] }
end
