Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  Rails.application.routes.draw do
    namespace 'api' do
      namespace 'v1' do
        resources :initials do
          collection do
            get :index
          end
        end

        resources :users do
          collection do
            get :index
            post "(/create)" => :create
            post "(/log_in)" => :log_in
            put "(/update_data)" => :update_password
          end
        end
      end
    end
  end

end
