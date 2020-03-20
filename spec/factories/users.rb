FactoryBot.define do
  factory :user do
    nickname              {"たなやん"}
    lastname              {"田中"}
    firstname             {"次郎"}
    lastname_kana         {"たなか"}
    firstname_kana        {"ジロウ"}
    birthdate             {"2008-03-19"}
    telephone_number      {"0923335555"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
  end
end
