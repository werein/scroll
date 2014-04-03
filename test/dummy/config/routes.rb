Rails.application.routes.draw do
  
  root to: 'welcome#index'

  mount Scroll::Engine => "/"
  mount Foundationstone::Engine => "/"
end
