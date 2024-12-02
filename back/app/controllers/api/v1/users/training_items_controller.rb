class Api::V1::Users::TrainingItemsController < Api::V1::BaseController
  before_action :check_correct_user

  def index
    user = User.find(params[:user_id])
    render json: user.created_training_items, each_serializer: TrainingItemSerializer
  end

  def create

  end

  def destroy
  end

  private
    def check_correct_user
      unless current_user.id.to_s == params[:user_id]
        render json: { error: '権限がありません' }, status: :forbidden
      end
    end
end
