class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  #ifでdevise_contorollerというヘルパーメソッドを指定。ここでtrueの時だけ処理という命令
  
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:profile,:occupation,:position])
    #sign_up時指定したキーの内容を対応するカラムに保存することを許可する
  end
end
