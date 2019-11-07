require 'rails_helper'

RSpec.describe Task, type: :model do

  it "titleが空ならバリデーションが通らない" do
    task = Task.new(task_name: '', content: '失敗テスト',deadline: '2019-11-20',status: '未着手', priority: '高')
    expect(task).not_to be_valid
  end

  it "contentが空ならバリデーションが通らない" do
    task = Task.new(task_name: '失敗テスト', content: '', deadline: '2019-11-20',status: '未着手', priority: '高')
    expect(task).not_to be_valid
  end

  it "deadlineが空ならバリデーションが通らない" do
    task = Task.new(task_name: '失敗テスト', content: '失敗テスト', deadline: '',status: '未着手', priority: '高')
    expect(task).not_to be_valid
  end

  it "statusが空ならバリデーションが通らない" do
    task = Task.new(task_name: '失敗テスト', content: '失敗テスト', deadline: '2019-11-20', status: '', priority: '高')
    expect(task).not_to be_valid
  end

  it "priotiryが空ならバリデーションが通らない" do
    task = Task.new(task_name: '失敗テスト', content: '失敗テスト', deadline: '2019-11-20', status: '未着手', priority: '')
    expect(task).not_to be_valid
  end

  it "title,content,deadline,status,priorityに内容が記載されていればバリデーションが通る" do
    task = Task.new(task_name: '成功テスト', content: '成功テスト', deadline: '2019-11-20', status: '未着手', priority: '高')
    expect(task).to be_valid
  end
end
