class Api::V1::Users::TrainingItemsController < Api::V1::BaseController
  before_action :check_correct_user

  def index
    user = User.find(params[:user_id])
    render json: user.created_training_items, each_serializer: TrainingItemSerializer
  end

  def create
    user = User.find(params[:user_id])
    return unless user.created_training_items.create!(training_item_params)

    render status: :created
  end

  def update
  end

  def destroy
    @training_item = current_user.created_training_items.find(params[:id])
    unless @training_item
      render status: :not_found
    end

    if @training_item.destroy!
      render status: :ok
    end
  end

  private

  def check_correct_user
    return if current_user.id.to_s == params[:user_id]

    render json: { error: '権限がありません' }, status: :forbidden
  end

  def training_item_params
    params.require(:training_item).permit(:name, :weight_unit)
  end
end
