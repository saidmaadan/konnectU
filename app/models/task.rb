class Task < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  belongs_to :project

  validates :title, :video, :tag, :project, presence: true
  validates :title, length: { maximum: 50}
end
