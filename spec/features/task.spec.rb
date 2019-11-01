require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  
  background do
    FactoryBot.create(:second_task, task_name: 'test1', content: 'test1', created_at: Time.current + 1.days)
    FactoryBot.create(:second_task, task_name: 'test2', content: 'test2', created_at: Time.current + 2.days)
    FactoryBot.create(:second_task, task_name: 'test3', content: 'test3', created_at: Time.current + 3.days)
    FactoryBot.create(:second_task, task_name: 'test4', content: 'test4', created_at: Time.current + 4.days)
  end
  scenario "タスク一覧のテスト" do
    visit tasks_path
    expect(page).to have_content 'test1'
    expect(page).to have_content 'test2'
  end

  scenario "タスク作成のテスト" do
    visit new_task_path
    fill_in 'Task name', with: 'test_task'
    fill_in 'Content', with: 'test'
    click_on 'タスクを更新'
    expect(page).to have_content 'test_task'
    expect(page).to have_content 'test'
  end

  scenario "タスク詳細のテスト" do
    @task = Task.create!(task_name: 'test_task', content: 'test')
    visit task_path(@task)
    expect(page).to have_content 'test_task'
    expect(page).to have_content 'test'
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    visit tasks_path
    # save_and_open_page
    task = all('tr td')
    task_0 = task[0]
    expect(task_0).to have_content 'test4'
  end
end
