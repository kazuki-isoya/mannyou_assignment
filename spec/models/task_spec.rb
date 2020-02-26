require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  before do
    task = FactoryBot.create(:task, title: 'task')
  end
  describe 'タスク一覧画面' do
    context 'タスクを作成した場合' do
      it '作成済みのタスクが表示されること' do
        visit tasks_path
        expect(page).to have_content 'test'
      end
    end
    context '複数のタスクを作成した場合' do
      it 'タスクが作成日時の降順に並んでいること' do
        new_task = FactoryBot.create(:task, title: "new_task")
        visit tasks_path
        task_list = all('.task_row')
        expect(task_list[0]).to have_content "new_task"
        expect(task_list[1]).to have_content 'task'
      end
    end
  end
end
