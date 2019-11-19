require 'rails_helper'
require 'support/utilities'

RSpec.feature "ラベル機能", type: :feature do
  background do
    @admin_user = FactoryBot.create(:admin_user)
    @user1 = FactoryBot.create(:first_user)
    log_in(@admin_user)
    @label1 = FactoryBot.create(:label)
    @label2 = FactoryBot.create(:first_label)
  end
  scenario "ラベル一覧のテスト" do
    visit labels_path
    expect(page).to have_content 'test_01'
    expect(page).to have_content 'test_02'
  end

  scenario "タスク作成のテスト" do
    visit new_label_path
      save_and_open_page
    fill_in 'ラベル名', with: ''
    click_on 'ラベルを作成'
  end
end
