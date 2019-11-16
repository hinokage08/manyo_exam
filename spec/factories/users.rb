FactoryBot.define do

  factory :first_user, class: User do
    name {'test_01' }
    email {'test_01@yahoo.co.jp'}
    password {'test_01'}
    password_confirmation {'test_01'}
  end

  factory :second_user, class: User do
    name {'test_02' }
    email {'test_02@yahoo.co.jp'}
    password {'test_02'}
    password_confirmation {'test_02'}
  end

  factory :third_user, class: User  do
    name {'test_03' }
    email {'test_03@yahoo.co.jp'}
    password {'test_03'}
    password_confirmation {'test_03'}
  end

  factory :admin_user, class: User  do
    name {'test_04' }
    email {'test_04@yahoo.co.jp'}
    password {'test_04'}
    password_confirmation {'test_04'}
  end
end
