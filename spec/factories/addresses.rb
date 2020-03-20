FactoryBot.define do
  factory :address do
    lastname              {"田中"}
    firstname             {"次郎"}
    lastname_kana         {"たなか"}
    firstname_kana        {"ジロウ"}
    postal_code           {"821-4567"}
    prefecture            {"北海道"}
    municipality          {"札幌市寒い町"}
    street                {"寒い通り3-4"}
    building              {"めちゃ寒荘303号"}
    telephone_number      {"0923335555"}
  end
end