FactoryGirl.define do
  factory :user, class: Auth::User do 
    email 'test@gmail.com'
    password '12345678'
    confirmed_at Time.zone.now
  end
end

FactoryGirl.define do
  factory :page, class: Scroll::Page do
    active true
    translations {[ association(:page_translation), association(:page_cs_translation)]}
  end

  factory :page_translation, class: Scroll::Page::Translation do
    title 'Apple iPhone'
    sequence(:slug) {|n| "Apple iPhone #{n}" }
    locale 'en'
    content 'Apple iPhone is best phone ever'
  end

  factory :page_cs_translation, class: Scroll::Page::Translation do
    title 'Apple iPhone'
    sequence(:slug) {|n| "Apple iPhone #{n}" }
    locale 'cs'
    content 'Apple iPhone je nejlepsi telefon'
  end

  factory :invalid_page, parent: :page do 
    translations nil
  end
end