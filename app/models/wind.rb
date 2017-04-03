# Wind model.
class Wind < ApplicationRecord
  belongs_to :forecast # , foreign_key: true
  validates_presence_of :period
  validates :velocity, numericality: true, allow_blank: true
  validates :direction, length: { maximum: 2 }, allow_blank: true
end
