class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :shipping_span
  with_options presence: true do
    validates :name, length: { maximum: 40}
    validates :explanation, length: { maximum: 1000}
    with_options numericality: { greater_than: 1, message:'を選択してください'} do
      validates :status_id
      validates :category_id
      validates :delivery_fee_id
      validates :shipping_origin_id
      validates :shipping_span_id
    end
    validates :price, :numericality => { greater_than: 299, less_than: 10000000}, format: { with: /\A[0-9]+\Z/, message: 'は半角数字で入力してください'}
    validates :image
  end
end
