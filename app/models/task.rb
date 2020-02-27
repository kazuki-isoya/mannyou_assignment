class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  # scope :search, -> (params) {where('(title LIKE ?) AND (completed LIKE ?)',
  #                                 "%#{params[:title]}%",
  #                                 "%#{params[:completed]}%")}
end
