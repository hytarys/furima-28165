class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  validates :name, presence: true, length: { maximum: 40}
  validates :explanation, presence: true, length: { maximum: 1000}
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :shipping_origin_id, presence: true
  validates :shipping_span_id, presence: true
  validates :price, presence: true, length: { maximum: 7}
  validates :image, presence: true
end
