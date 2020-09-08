Rails.application.routes.draw do
  # post 'user_token' => 'user_token#create'
  # resources :users
  scope '/auth' do
 post '/signin', to: 'user_token#create'
 post '/signup', to: 'users#create'
 delete '/logout', to: 'user#destroy'

end
resources :curriculums
get '*path', to: "application#fallback_index_html", constraints: ->(request) do
    !request.xhr? && request.format.html?
  end
end
