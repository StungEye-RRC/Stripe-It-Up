# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, :description, :price_cents, presence: true
  validates :price_cents, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  has_one_attached :image

  def tiny_image_url
    Rails.application.routes.url_helpers.rails_representation_url(image.variant(resize: '50x50').processed, only_path: true)
  end
end
