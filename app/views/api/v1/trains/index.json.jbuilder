# json.data do
# #   json.array! @trains do |train|
# #     json.number train.number
# #     json.train_url api_v1_train_url(train.number)
# #   end
#   json.array! @trains, :partial => "item", :as => :train
# end
#新增了一个 meta ，来描述总共有多少页、多少笔、下一页、上一页等等资讯。
 json.meta do
   json.current_page @trains.current_page
   json.total_pages @trains.total_pages
   json.per_page @trains.per_page
   json.total_entries @trains.total_entries

   if @trains.current_page == @trains.total_pages
     json.next_url nil # 最后一页就没有下一页了
   else
     json.next_url api_v1_trains_url( :page => @trains.next_page )
   end

   if @trains.current_page == 1
     json.previous_url nil # 第一页就没有上一页
   else
     json.previous_url api_v1_trains_url( :page => @trains.previous_page )
   end
 end

json.data do
  json.array! @trains, :partial => "item", :as => :train
end
