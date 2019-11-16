require 'rails_helper'

RSpec.feature "管理者機能", type: :feature do
  background do
    @admin_user = FactoryBot.create(:admin_user)
    @user2 = FactoryBot.create(:first_user)
    log_in(@admin_user)
  end
  scenario "ユーザー一覧のテスト" do
    visit admin_users_path
    expect(page).to have_content 'test_04'
    expect(page).to have_content 'test_02'
  end

  senario "ユーザー作成テスト" do

end
