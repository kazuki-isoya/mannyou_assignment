class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :user
  # scope :search, -> (params) {where('(title LIKE ?) AND (completed LIKE ?)',
  #                                 "%#{params[:title]}%",
  #                                 "%#{params[:completed]}%").order(created_at: :desc)}

  enum completed: %i[未着手 着手中 完了]
  enum priority: %i[高 中 低]

  scope :title_search, -> title {
    where(title: title)
  }
  #LIKE検索

  scope :completed_search, -> completed {
    where(completed: completed)
  }
end
