require 'rails_helper'
require 'support/utilities'

RSpec.feature "タスク管理機能", type: :feature do

  background do
    @user1 = FactoryBot.create(:first_user)
    @task1 = FactoryBot.create(:task)
    @task2 = FactoryBot.create(:second_task)
    @task3 = FactoryBot.create(:third_task)
    log_in(@user1)
  end
  scenario "タスク一覧のテスト" do
    visit tasks_path
    expect(page).to have_content 'test_01'
    expect(page).to have_content 'test_02'
  end

  scenario "タスク作成のテスト" do
    visit new_task_path
    fill_in 'タスク名', with: 'test_task'
    fill_in 'タスク内容', with: 'test'
    fill_in '終了期限', with: '2019-11-14'
    select '高', from: '優先度'
    click_button '登録する'
    expect(page).to have_content 'test_task'
    expect(page).to have_content 'test'
    expect(page).to have_content '2019-11-14'
    expect(page).to have_content '未着手'
    expect(page).to have_content '高'
  end

  scenario "タスク詳細のテスト" do
    visit task_path(@task1)
    expect(page).to have_content 'test_01'
    expect(page).to have_content 'test_01'
    expect(page).to have_content '2019-11-14'
    expect(page).to have_content '未着手'
    expect(page).to have_content '高'
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    visit tasks_path
    task = all('tr td')
    task_0 = task[0]
    expect(task_0).to have_content 'test_03'
  end

  scenario '「終了期限でソート」を押すと終了期限の降順でソートされるかのテスト' do
    visit tasks_path
    click_on '終了期限でソート'
    task = all('tr td')
    task_0 = task[3]
    expect(task_0).to have_content '2019-11-16'
  end

  scenario '「優先度でソート」を押すと終了期限の降順でソートされるかのテスト' do
    visit tasks_path
    click_on '優先度でソート'
    task = all('tr td')
    task_0 = task[5]
    expect(task_0).to have_content '高'
  end
end
