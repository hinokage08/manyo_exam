require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  scenario "タスク一覧のテスト" do
    Task.create!(task_name: 'test_task_01', content: 'test')
    Task.create!(task_name: 'test_task_02', content: 'sample')
    visit tasks_path
    expect(page).to have_content 'test'
    expect(page).to have_content 'sample'
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
end
