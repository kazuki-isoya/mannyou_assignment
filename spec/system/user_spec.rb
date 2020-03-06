require 'rails_helper'
# bundle exec rspec spec/system/user_spec.rb #テスト呼び出し

RSpec.describe 'ユーザー機能', type: :system do
  before do
    @user1 = FactoryBot.create(:user, name: "user1")
    @user2 = FactoryBot.create(:user, name: "user2", email: "user2@email.com", admin: false)
    visit root_path
  end

  describe 'ログイン機能' do
    it 'ユーザー情報を入力してログインする' do
      fill_in 'session_email', with: 'user@email.com'
      fill_in 'session_password', with: 'password'
      click_on 'ログイン'
      expect(page).to have_content "ログインしました"
    end
    it 'ログアウトする' do
      fill_in 'session_email', with: 'user@email.com'
      fill_in 'session_password', with: 'password'
      click_on 'ログイン'
      click_on 'ログアウトする'
      expect(page).to have_content "ログアウトしました"
    end
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー作成ボタンを押した場合' do
      before do
        click_on '新しいユーザーを作成'
      end
      it 'ユーザー登録画面へ移動する' do
        expect(page).to have_content "ユーザーの作成"
      end
      it 'ユーザー情報を入力し登録する' do
        fill_in "名前", with: 'user3'
        fill_in "メールアドレス", with: 'user3@email.com'
        fill_in "パスワード", with: 'password'
        fill_in "パスワード(確認)", with: 'password'
        click_on 'ユーザーを作成する'
        expect(page).to have_content "ユーザー「user3」を登録しました"
      end
    end
  end



  describe 'ユーザー機能' do
    context 'ログインしている場合' do
      before do
        fill_in 'session_email', with: 'user@email.com'
        fill_in 'session_password', with: 'password'
        click_on 'ログイン'
      end
      it '他のユーザーの詳細ページに飛べない' do
        visit user_path(@user2)
        expect(page).to have_content '他のユーザーのプロフィール詳細は見られません'
      end

    end

  end

  describe '管理者機能' do
    before do
      fill_in 'session_email', with: 'user@email.com'
      fill_in 'session_password', with: 'password'
      click_on 'ログイン'
    end
    it '管理者ページのユーザー一覧へ飛ぶ' do
      click_on 'ユーザー一覧'
      expect(page).to have_content "ユーザー一覧"
    end
    it '管理者ページでユーザーを新規登録する' do
      click_on 'ユーザー一覧'
      click_on 'ユーザー新規登録'
      fill_in "名前", with: 'user2'
      fill_in "メールアドレス", with: 'user2@email.com'
      fill_in "パスワード", with: 'password'
      fill_in "パスワード(確認)", with: 'password'
      click_on 'ユーザー登録する'
      expect(page).to have_content "登録しました"
    end
    context '管理者ユーザーページの場合' do
      before do
        visit admin_users_path
      end
      it "ユーザーの詳細を確認する" do
        visit admin_user_path(@user2)
        expect(page).to have_content "user2"
      end
      it 'ユーザーの編集ページへ飛ぶ' do
        visit edit_admin_user_path(@user2)
        expect(page).to have_content "user2"
      end
      it "ユーザー情報を編集し登録し詳細を確認する" do
        visit edit_admin_user_path(@user2)
        fill_in '名前', with: 'user2-2'
        click_on 'ユーザー情報を編集する'
        expect(page).to have_content "user2-2"
      end
      it 'ユーザー情報を削除する' do
        click_on '削除', match: :first
        expect(page.driver.browser.switch_to.alert.text).to eq "削除しますか?"
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content "削除しました"
      end
    end

  end

end
