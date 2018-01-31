class ApiController < ActionController::Base
    #我们会把 API 用途的 controller 都继承自 ApiController，而不是ApplicationController。
    #这是因为 API 不需要 protect_from_forgery with: :exception 这一行的 CSRF 浏览器安全检查
   before_action :authenticate_user_from_token!
 
   def authenticate_user_from_token!
 
     if params[:auth_token].present?
       user = User.find_by_authentication_token( params[:auth_token] )
        #只要呼叫 API 的时候，有多带 auth_token，就会设定好 current_user
       # sign_in 是 Devise 的方法，会设定好 current_user
       sign_in(user, store: false) if user
     end
   end
end
