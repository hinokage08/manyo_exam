require 'rails_helper'
require 'support/utilities'

RSpec.feature "ラベル機能", type: :feature do
  background do
    @admin_user = FactoryBot.create(:admin_user)
    @user1 = FactoryBot.create(:first_user)
    log_in(@admin_user)
    create_task(@admin_user)
  end
  scenario "ラベル一覧のテスト" do
    visit admin_users_path
    expect(page).to have_content 'test_04'
    expect(page).to have_content 'test_01'
  end
