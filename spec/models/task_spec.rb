require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :model do
  it 'titleが空ならバリデーションが通らない' do
    task = Task.new(title: '', content: 'not_empty')
    expect(task).not_to be_valid
  end
  it 'contentが空ならバリデーションが通らない' do
    task = Task.new(title: 'not_empty', content: '')
    expect(task).not_to be_valid
  end
  it 'titleとcontentに内容が記載されていればバリデーションが通る' do
    task = Task.new(title: 'not_empty', content: 'not_empty')
    expect(task).to be_valid
  end
end
