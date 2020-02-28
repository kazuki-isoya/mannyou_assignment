require 'rails_helper'
#bundle exec rspec spec/models/task_spec.rb #テスト呼び出し

RSpec.describe 'タスク管理機能', type: :model do
  # it 'titleが空ならバリデーションが通らない' do
  #   task = Task.new(title: '', content: 'not_empty')
  #   expect(task).not_to be_valid
  # end
  # it 'contentが空ならバリデーションが通らない' do
  #   task = Task.new(title: 'not_empty', content: '')
  #   expect(task).not_to be_valid
  # end
  # it 'titleとcontentに内容が記載されていればバリデーションが通る' do
  #   task = Task.new(title: 'not_empty', content: 'not_empty')
  #   expect(task).to be_valid
  # end
  it '検索すると絞り込みがされる' do
    # task1 = FactoryBot.create(:task)
    # task2 = FactoryBot.create(:second_task, completed: "完了")
    # task3 = FactoryBot.create(:second_task, completed: "着手中")
    # search = Task.where(task: {task_title_search: "factory_second_title", completed_search: "完了"})
    # expect_task = FactoryBot.create(:second_task, completed: "完了")
    # result = Task.where(task: {task_title_search: "Factoryで作ったタスクネーム２", completed_search: "完了"})
  end
end
