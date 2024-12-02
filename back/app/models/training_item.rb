class TrainingItem < ApplicationRecord
  belongs_to :created_user, class_name: 'User', foreign_key: :user_id

  enum :weight_unit, {
    kg: 1,
    lib: 2
  }
end
