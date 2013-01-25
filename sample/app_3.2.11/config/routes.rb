App3211::Application.routes.draw do
  resources :my_calendar do
    collection do
      get ':year/:month/:date' => 'my_calendar#show', :constraints => { :year => /\d{4}/, :month => /\d{1,2}/, :day => /\d{1,2}/}
    end
  end

  root :to => 'my_calendar#index'
end
