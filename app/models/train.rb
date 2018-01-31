class Train < ApplicationRecord
     validates_presence_of :number
      has_many :reservations
      mount_uploader :train_logo, TrainLogoUploader
     # 产生所有位置从 1A~6C
    # ["1A", "1B", "1C", "2A", "2B", "2C", "3A", "3B", "3C", 
    #  "4A", "4B", "4C", "5A", "5B", "5C", "6A", "6B", "6C"]
    SEATS = begin
      (1..6).to_a.map do |series|
        ["A","B","C"].map do |letter|
         "#{series}#{letter}"
        end
      end
    end.flatten
     def available_seats
       # TODO: 回传有空的座位，这里先暂时固定回传一个数组，等会再来处理
       #修改 app/models/train.rb 加上关联和资料验证，以及一个 available_seats 方法回传可以被预订的座位号码
        #["1A", "1B", "1C", "1D", "1F"]
        # 所有 SEATS 扣掉已经订位的资料
        return SEATS - self.reservations.pluck(:seat_number)
     end
end
