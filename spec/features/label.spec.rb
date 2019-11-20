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
    fill_in 'ラベル名', with: 'test'
    click_on 'ラベルを作成'
    expect(page).to have_content 'test'
  end

  scenario "ユーザー削除のテスト" do
    visit labels_path
     save_and_open_page
<<<<<<< HEAD
    all('tr td')[4].click_link
=======
    all('tr td')[5].click_link
>>>>>>> 2e20a8597d74d66da036579f4935853f3f591681
    expect(page).to have_content 'ラベルを削除しました。'
  end
end
