FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@test'}
    password              {'aaa111'}
    password_confirmation {'aaa111'}
    lastname              {'岡'}
    firstname             {'聡実'}
    lastname_kana         {'オカ'}
    firstname_kana        {'サトミ'}
    dateofbirth           {Date.new(1990, 1, 1)}
  end
end