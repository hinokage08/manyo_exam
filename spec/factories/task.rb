FactoryBot.define do

  factory :task do
    task_name { 'test_01' }
    content { 'test_01' }
    created_at { Time.current + 1.day }
    deadline { '2019-11-14' }
    status { '未着手' }
    priority { '高' }
  end

  factory :second_task, class: Task do
    task_name { 'test_02' }
    content { 'test_02' }
    created_at { Time.current + 2.day }
    deadline { '2019-11-15' }
    status { '着手中' }
    priority { '中' }
  end

  factory :third_task, class: Task do
    task_name { 'test_03' }
    content { 'test_03' }
    created_at { Time.current + 3.day }
    deadline { '2019-11-16' }
    status { '完了' }
    priority { '低' }
  end
end
