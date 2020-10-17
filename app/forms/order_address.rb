class OrderAddress

  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :order_id, :token
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
  with_options presence: true do
    validates :token
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctory'}
    validates :prefecture_id, numericality: {greater_than: 1, message: 'Select'}
    validates :city
    validates :house_number
    validates :phone_number, format: {with: /\A\d{11}\z/, message: 'Input correctory'}
  end
end
