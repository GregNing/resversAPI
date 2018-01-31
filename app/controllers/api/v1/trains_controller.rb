 class Api::V1::TrainsController < ApiController

  def index
    @trains = Train.all
    #其中 render :json => 某个变量 的语法，会把变量转成 JSON 字串输出。这里也不需要准备 View .erb 档案。
    render :json => {
      :data => @trains.map{ |train|
        { :number => train.number,
            :train_url => api_v1_train_url(train.number)
        }
      }
    }
  end

  def show
    @train = Train.find_by_number!( params[:train_number] )

    render :json => {
      :number => @train.number,
      :available_seats => @train.available_seats
    }
  end
end
