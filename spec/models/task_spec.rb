require 'rails_helper'
#bundle exec rspec spec/models/task_spec.rb #テスト呼び出し

RSpec.describe 'タスク管理機能', type: :model do
  # @task = FactoryBot.create(:task)
  it 'titleが空ならバリデーションが通らない' do
    task = Task.new(title: '', content: 'not_empty')
    expect(task).not_to be_valid
  end
  it 'contentが空ならバリデーションが通らない' do
    task = Task.new(title: 'not_empty', content: '')
    expect(task).not_to be_valid
  end
  it 'titleとcontentに内容が記載されていればバリデーションが通る' do
    # task = Task.new(title: 'not_empty', content: 'not_empty')
    task = FactoryBot.build(:task)
    expect(task).to be_valid
  end
  context "検索機能" do
    before do
      @task1 = FactoryBot.create(:task, title: "task1")
    end
    it "タスク1で検索" do
      expect(Task.title_search("task1")).to include(@task1)
    end
  end

end
