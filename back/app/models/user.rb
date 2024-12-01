# frozen_string_literal: true

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  include DeviseTokenAuth::Concerns::User

  has_many :created_training_items, class_name: "TrainingItem", foreign_key: "user_id", dependent: :destroy
end
