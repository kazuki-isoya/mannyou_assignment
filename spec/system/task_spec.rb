require 'rails_helper'
#bundle exec rspec spec/system/task_spec.rb #テスト呼び出し

RSpec.describe 'タスク管理機能', type: :system do


  before do
    @task1 = FactoryBot.create(:task, title: 'task1')
    @task2 = FactoryBot.create(:second_task, title: 'task2')
    @task3 = FactoryBot.create(:second_task, title: 'task3', time_limit: '2020-02-28 10:00:00')
  end
  describe 'タスク一覧画面' do
    # context 'タスクを作成した場合' do
    #   it '作成済みのタスクが表示されること' do
    #     visit tasks_path
    #     expect(page).to have_content 'test'
    #   end
    # end
    # context '複数のタスクを作成した場合' do
    #   it 'タスクが作成日時の降順に並んでいること' do
    #     visit tasks_path
    #     task_list = all('tbody tr')
    #     expect(task_list[0]).to have_content 'task3'
    #     expect(task_list[1]).to have_content 'task2'
    #     expect(task_list[2]).to have_content 'task1'
    #   end
    # end
    # context '終了期限でソートするボタンを押した場合' do
    #   it 'タスクが終了期限の降順に並んでいること' do
    #     visit tasks_path
    #     click_on '終了期限でソートする'
    #     expect(page).to have_content 'タスク一覧'
    #     task_list = all('tbody tr')
    #     expect(task_list[0]).to have_content 'task1'
    #     expect(task_list[1]).to have_content 'task2'
    #     expect(task_list[2]).to have_content 'task3'
    #   end
    # end
    context '検索ボタンを押した場合' do
      it '検索フォームに入力されているものだけが表示されること' do
        task4 = FactoryBot.create(:task, title: 'search_test')
        visit tasks_path
        fill_in "タスク名", with: 'search'
        fill_in "状態", with: ''
        click_on '検索'
        # byebug
        expect(page).to have_content 'search'
      end
    end
  end

  # describe 'タスク登録画面' do
  #   context '必要項目を入力して、createボタンを押した場合' do
  #     it 'データが保存されること' do
  #       visit new_task_path
  #       fill_in "タイトル", with: 'test_title'
  #       fill_in "内容", with: 'test_content'
  #       select_date("2020,3,3", from: "終了期限")
  #       select_time("13", "00", from: "終了期限")
  #       click_button '登録する'
  #       expect(page).to have_content 'test'
  #       expect(page).to have_content '2020-03-03 13:00:00'
  #     end
  #   end
  # end
#
#   describe 'タスク詳細画面' do
#      context '任意のタスク詳細画面に遷移した場合' do
#        it '該当タスクの内容が表示されたページに遷移すること' do
#          test3 = FactoryBot.create(:task, title: 'test3_title', content: 'test3_content')
#          visit task_path(test3)
#          expect(page).to have_content 'test3'
#        end
#      end
#   end
#
end
