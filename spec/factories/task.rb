FactoryBot.define do

  factory :task do
    task_name { 'test' }
    content { 'test' }
  end

  factory :second_task, class: Task do
    task_name { 'sample' }
    content { 'sample' }
  end
end
