class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  with_options presence: true do
    validates :name, length: { maximum: 40}
    validates :explanation, length: { maximum: 1000}
    with_options numericality: { greater_than: 1, message:'Select'} do
      validates :status_id
      validates :category_id
      validates :delivery_fee_id
      validates :shipping_origin_id
      validates :shipping_span_id
    end
    validates :price, :numericality => { greater_than: 299, less_than: 10000000}, format: { with: /\A[0-9]+\Z/, message: 'Half-width number'}
    validates :image
  end
end
