class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :user
  has_many :labelings, dependent: :destroy
  has_many :labels, through: :labelings
  # scope :search, -> (params) {where('(title LIKE ?) AND (completed LIKE ?)',
  #                                 "%#{params[:title]}%",
  #                                 "%#{params[:completed]}%").order(created_at: :desc)}

  enum completed: %i[未着手 着手中 完了]
  enum priority: %i[高 中 低]

#タスク検索
  scope :title_search, -> title {
    where(title: title)
  }

#タスク検索：状態
  scope :completed_search, -> completed {
    where(completed: completed)
  }

#ラベル検索
  # scope :label_search, -> label_id {
  #   where(label_id: label_id)
  # }
end
