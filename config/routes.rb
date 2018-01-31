Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
#其中两层的namespace 会让网址前增加/api/v1/、Controller 的目录多两层放在app/controllers/api/v1/ 下、Controller 类的名字前面增加Api::V1，变成Api::V1::ReservationsController、路由方法变成api_v1_XXXXX_path 和api_v1_XXXXX_url

#而其中post "/reservations" => "reservations#create", :as => :create_reservations的意思是

#客户端送出 POST /api/v1/reservations 时，会进入 Api::V1::ReservationsController 的 create 方法，而 as 参数的意思是产生这个地址的路由方法叫做 api_v1_create_reservations_path。

#最后，:defaults => { :format => :json } 意思是默认客户端要求的是 JSON 格式，本来的默认值是 HTML。如果没有改这个的话，你必须在网址最后面加上 .json 来指定客户端要求的格式，例如 GET /api/v1/trains.json。
 namespace :api, :defaults => { :format => :json } do
   namespace :v1 do
    get "/me" => "users#show", :as => :user
    patch "/me" => "users#update", :as => :update_user
    post "/signup" => "auth#signup"
    post "/login" => "auth#login"
    post "/logout" => "auth#logout"
    get "/reservations" => "reservations#index", :as => :reservations
     get "/trains"  => "trains#index", :as => :trains
     get "/trains/:train_number" => "trains#show", :as => :train

     get "/reservations/:booking_code" => "reservations#show", :as => :reservation
     post "/reservations" => "reservations#create", :as => :create_reservations
     patch "/reservations/:booking_code" => "reservations#update", :as => :update_reservation
     delete "/reservations/:booking_code" => "reservations#destroy", :as => :cancel_reservation
   end
 end
 #以下寫法也可以但這是看得懂 ruby 所使用的 但因這是寫 API所以要讓其他人看懂的話要寫上面方式
# namespace :api, :defaults => { :format => :json } do
#   namespace :v1 do
#     resources :trains, :only => [:index, :show]
#     resources :reservations, :only => [:show, :create, :update, :destroy]        
#   end
# end
 root "welcome#index"
end
