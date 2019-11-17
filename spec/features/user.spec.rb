require 'rails_helper'
require 'support/utilities'

RSpec.feature "ユーザー機能", type: :feature do

  background do
    @user1 = FactoryBot.create(:first_user)
    @user2 = FactoryBot.create(:second_user)
  end
  scenario "ユーザー登録のテスト" do
    visit new_user_path
    fill_in "ユーザー名",with: 'test'
    fill_in "メールアドレス",with:"test@yahoo.co.jp"
    fill_in "パスワード",with:"testtest"
    fill_in "パスワード確認",with:"testtest"
    click_button 'ユーザー登録'
    click_link 'Profile'
    expect(page).to have_content "test@yahoo.co.jp"
  end

  scenario "ログイン確認テスト" do
    log_in(@user1)
    visit user_path(@user1.id)
    expect(page).to have_content "test_01@yahoo.co.jp"
  end

  scenario "ログアウト確認テスト" do
    log_in(@user1)
    click_link 'Logout'
    expect(page).to have_content "ログアウトしました"
  end

  scenario  "ログインしていないのにタスクのページに飛ぼうとした場合は、ログインページに遷移する" do
    visit tasks_path
    expect(page).to have_content 'Email'
  end

  scenario "ユーザー登録した時、同時にログインも行われるかのテスト" do
    log_in(@user1)
    expect(page).to have_content "Logout"
  end

  scenario "自分以外のユーザーのマイページが見れないようになっているかのテスト" do
    log_in(@user1)
    visit user_path(@user2.id)
    expect(page).to have_content "権限がありません"
  end
end
