FactoryGirl.define do

  factory :user, aliases: [:owner, :author] do
    email               {Faker::Internet.unique.email}
    name                {Faker::Name.name}
    password            {Faker::Internet.password}
    #confirmed_at        DateTime.now
    #confirmation_token  {Faker::Crypto.unique.sha1}
  end

  factory :blog do 
    #association :owner
    domain              {Faker::Internet.domain_name}
    title               {Faker::Book.title}

  end

  factory :article do 
    association :blog
    association :author
    title               {Faker::TwinPeaks.quote}
    content             {Faker::Lorem.paragraphs}
  end

  factory :comment do
    association :article
    author      {Faker::Name.name}
    content     {Faker::HitchhikersGuideToTheGalaxy.quote}
  end


end