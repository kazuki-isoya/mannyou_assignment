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
  context "検索出来るか" do
    task1 = FactoryBot.create(:task, title: "task1")
    task2 = FactoryBot.create(:second_task, completed: "完了")
    task3 = FactoryBot.create(:second_task, completed: "着手中")
    it "タスク1で検索" do
      expect(Task.search("task1")).to include(task1)
    end

    it "検索できないか" do
      expect(Task.search("task1")).to_not include(hoohoho)
    end
  end

end
