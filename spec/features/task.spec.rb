require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do

  background do
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
    FactoryBot.create(:third_task)
  end
  scenario "タスク一覧のテスト" do
    visit tasks_path
    expect(page).to have_content 'test_01'
    expect(page).to have_content 'test_02'
  end

  scenario "タスク作成のテスト" do
    visit new_task_path
    fill_in 'タスク名', with: 'test_task'
    fill_in '内容', with: 'test'
    fill_in 'Deadline', with: '2019-11-14'
    select '高', from: 'Priority'
    click_on 'タスクを作成'
    expect(page).to have_content 'test_task'
    expect(page).to have_content 'test'
    expect(page).to have_content '2019-11-14'
    expect(page).to have_content '未着手'
    expect(page).to have_content '高'
  end

  scenario "タスク詳細のテスト" do
    @task = Task.create!(task_name: 'test_task', content: 'test', deadline: '2019-11-14', status: '未着手', priority: '高')
    visit task_path(@task)
    expect(page).to have_content 'test_task'
    expect(page).to have_content 'test'
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

  scenario '「終了期限でソートする」を押すと終了期限の降順でソートされるかのテスト' do
    visit tasks_path
    click_on '終了期限でソートする'
    task = all('tr td')
    task_0 = task[3]
    expect(task_0).to have_content '2019-11-16'
  end

  scenario '「優先順位でソートする」を押すと終了期限の降順でソートされるかのテスト' do
    visit tasks_path
    click_on '優先順位でソートする'
    task = all('tr td')
    task_0 = task[5]
    expect(task_0).to have_content '高'
  end
end
