class Api::V1::Users::TrainingItemsController < Api::V1::BaseController
  def index
    unless correct_user?
      return render json: { error: '権限がありません' }, status: :forbidden
    end

    user = User.find(params[:user_id])
    render json: user.created_training_items, each_serializer: TrainingItemSerializer
  end

  def create

  end

  def destroy
  end

  private
    def correct_user?
      current_user.id.to_s == params[:user_id]
    end
end
