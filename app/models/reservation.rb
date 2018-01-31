class Reservation < ApplicationRecord
    #针对每笔 Reservation 在新建的时候，随机数产生一个 booking_code 这是订票号码，订好票之后，可以用这个号码来做修改或取消订票
  validates_presence_of :train_id, :seat_number, :booking_code
  validates_uniqueness_of :seat_number, :scope => :train_id

  belongs_to :train

  before_validation :generate_booking_code, :on => :create

  def generate_booking_code
    self.booking_code = SecureRandom.uuid
  end
end
