require 'rails_helper'
require 'support/utilities'


RSpec.feature "管理者機能", type: :feature do
  background do
    @admin_user = FactoryBot.create(:admin_user)
    @user1 = FactoryBot.create(:first_user)
    log_in(@admin_user)
    create_task(@admin_user)
  end
  scenario "ユーザー一覧のテスト" do
    visit admin_users_path
    expect(page).to have_content 'test_04'
    expect(page).to have_content 'test_01'
  end

  scenario "ユーザー作成のテスト" do
    visit new_admin_user_path
    fill_in 'ユーザー名', with: 'test'
    fill_in 'メールアドレス', with: 'test@yahoo.co.jp'
    check '管理者権限'
    fill_in 'パスワード', with: 'testtest'
    fill_in 'パスワード確認', with: 'testtest'
    click_on 'ユーザー登録'
    expect(page).to have_content 'ユーザー「test」を登録しました'
    expect(page).to have_content 'test@yahoo.co.jp'
  end

  scenario "ユーザー詳細のテスト" do
    visit admin_user_path(@admin_user)
    expect(page).to have_content 'test_04'
    expect(page).to have_content 'test_04@yahoo.co.jp'
    expect(page).to have_content '2019-11-14'
  end

  scenario "ユーザー更新のテスト" do
    visit edit_admin_user_path(@user1)
    fill_in 'ユーザー名', with: 'test_update'
    fill_in 'メールアドレス', with: 'test_update@yahoo.co.jp'
    check '管理者権限'
    fill_in 'パスワード', with: 'test_update'
    fill_in 'パスワード確認', with: 'test_update'
    click_on 'ユーザー情報更新'
    visit admin_users_path
    expect(page).to have_content 'test_update'
    expect(page).to have_content 'test_update@yahoo.co.jp'
  end

  scenario "ユーザー削除のテスト" do
    visit admin_users_path
    all('tr td')[17].click_link
    expect(page).to have_content 'ユーザー「test_01」を削除しました。'
  end

  scenario "ユーザーの一覧画面でそのユーザーが持っているタスクの数が表示されるかのテスト" do
    visit admin_users_path
    task_3 = all('tr td')[3]
    expect(task_3).to have_content '1'
  end

end
