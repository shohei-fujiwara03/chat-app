class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # deviseコントローラーからのアクションの場合に実行される


private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  # nameカラムはdeviseのデフォルトのカラムに此方が付け加えたもの。このため、devise_parameter_sanitizer.permitメソッドでnameカラムの保存を許可する必要がある。
end