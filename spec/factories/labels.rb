FactoryBot.define do
  factory :label do
    name { 'test_01' }
    user { User.first || association(:user) }
  end

  factory :first_label, class: Label do
    name { 'test_02' }
    user { User.first || association(:user) }
  end
end
