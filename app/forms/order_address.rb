class OrderAddress

  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :order_id, :first_name, :last_name, :first_name_reading, :last_name_reading, :email, :nickname, :birthday, :user_id
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
