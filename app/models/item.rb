class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  validates :name, presence: true, length: { maximum: 40}
  validates :explanation, presence: true, length: { maximum: 1000}
  validates :category_id, presence: true, inclusion: { in: %w(1), message: 'Select'}
  validates :status_id, presence: true, inclusion: { in: %w(1), message: 'Select'}
  validates :delivery_fee_id, presence: true, inclusion: { in: %w(1), message: 'Select'}
  validates :shipping_origin_id, presence: true, inclusion: { in: %w(1), message: 'Select'}
  validates :shipping_span_id, presence: true, inclusion: { in: %w(1), message: 'Select'}
  validates :price, presence: true, :numericality => { :greater_than => 299, :less_than => 10000000}, format: { with: /\A[0-9]+\Z/, message: 'Half-width number'}
  validates :image, presence: true
end
