require 'rails_helper'
require 'support/utilities'

RSpec.describe Task, type: :model do

  before do
    @user = User.new(name: '成功テスト', email: 'success@yahoo.co.jp', password_digest: 'testtest')
  end


  it "titleが空ならバリデーションが通らない" do
    task = Task.new(task_name: '', content: '失敗テスト',deadline: '2019-11-20',status: '未着手', priority: '高', user: @user)
    expect(task).not_to be_valid
  end

  it "contentが空ならバリデーションが通らない" do
    task = Task.new(task_name: '失敗テスト', content: '', deadline: '2019-11-20',status: '未着手', priority: '高', user: @user)
    expect(task).not_to be_valid
  end

  it "deadlineが空ならバリデーションが通らない" do
    task = Task.new(task_name: '失敗テスト', content: '失敗テスト', deadline: '',status: '未着手', priority: '高', user: @user)
    expect(task).not_to be_valid
  end

  it "statusが空ならバリデーションが通らない" do
    task = Task.new(task_name: '失敗テスト', content: '失敗テスト', deadline: '2019-11-20', status: '', priority: '高', user: @user)
    expect(task).not_to be_valid
  end

  it "priotiryが空ならバリデーションが通らない" do
    task = Task.new(task_name: '失敗テスト', content: '失敗テスト', deadline: '2019-11-20', status: '未着手', priority: '', user: @user)
    expect(task).not_to be_valid
  end

  it "title,content,deadline,status,priorityに内容が記載されていればバリデーションが通る" do
    task = Task.new(task_name: '成功テスト', content: '成功テスト', deadline: '2019-11-20', status: '未着手', priority: '高', user: @user )
    expect(task).to be_valid
  end

  context "modelに記述したscopeによる絞り込みが正しいか確かめる" do

    before do
      FactoryBot.create(:first_user)
      FactoryBot.create(:second_task)
      FactoryBot.create(:third_task)
      @task = FactoryBot.create(:task)
    end

    it 'scopeによる絞り込みが正しいか確かめる(task_nameのみの絞り込み)' do
      expect(Task.name_search("test_01")).to include(@task)
    end

    it 'scopeによる絞り込みが正しいか確かめる(statusのみの絞り込み)' do
      expect(Task.status_search("未着手")).to include(@task)
    end
  end
end
