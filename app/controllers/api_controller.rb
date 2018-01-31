class ApiController < ActionController::Base
    #我们会把 API 用途的 controller 都继承自 ApiController，而不是ApplicationController。
    #这是因为 API 不需要 protect_from_forgery with: :exception 这一行的 CSRF 浏览器安全检查
end
