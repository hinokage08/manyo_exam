require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do

  background do
    FactoryBot.create(:second_task, task_name: 'test1', content: 'test1', created_at: Time.current + 1.days, deadline: '2019-11-14')
    FactoryBot.create(:second_task, task_name: 'test2', content: 'test2', created_at: Time.current + 2.days, deadline: '2019-11-15')
    FactoryBot.create(:second_task, task_name: 'test3', content: 'test3', created_at: Time.current + 3.days, deadline: '2019-11-16')
    FactoryBot.create(:second_task, task_name: 'test4', content: 'test4', created_at: Time.current + 4.days, deadline: '2019-11-17')
  end
  scenario "タスク一覧のテスト" do
    visit tasks_path
    expect(page).to have_content 'test1'
    expect(page).to have_content 'test2'
  end

  scenario "タスク作成のテスト" do
    visit new_task_path
    fill_in 'タスク名', with: 'test_task'
    fill_in '内容', with: 'test'
    fill_in 'Deadline', with: '2019-11-14'
    click_on 'タスクを更新'
    expect(page).to have_content 'test_task'
    expect(page).to have_content 'test'
    expect(page).to have_content '2019-11-14'
  end

  scenario "タスク詳細のテスト" do
    @task = Task.create!(task_name: 'test_task', content: 'test', deadline: '2019-11-14')
    visit task_path(@task)
    expect(page).to have_content 'test_task'
    expect(page).to have_content 'test'
    expect(page).to have_content '2019-11-14'
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    visit tasks_path
    task = all('tr td')
    task_0 = task[0]
    expect(task_0).to have_content 'test4'
  end

  scenario '「終了期限でソートする」を押すと終了期限の降順でソートされるかのテスト' do
    visit tasks_path
    click_on '終了期限でソートする'
    task = all('tr td')
    task_0 = task[3]
    save_and_open_page
    expect(task_0).to have_content '2019-11-17'
  end
end
