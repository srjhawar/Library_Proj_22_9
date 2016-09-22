class BookingHistory < ActiveRecord::Base
  def to_param
    room_num
  end
end
