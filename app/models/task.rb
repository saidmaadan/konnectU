class Task < ApplicationRecord
  belongs_to :project

  validates :title, :video, :tag, :project, presence: true
  validates :title, length: { maximum: 50}
end
