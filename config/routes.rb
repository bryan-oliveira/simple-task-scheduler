Rails.application.routes.draw do

  root 'users#new'
  scope '/api' do
    scope '/v1' do
      get '/' => 'application#api_docs'
      post '/authenticate' => 'authentication#authenticate'

      scope '/users' do
        root 'users#new', as: 'users'
        post '/' => 'users#create'
        get '/signin' => 'users#signin', as: 'signin'
        post '/signin' => 'application#authenticate_request'
      end

      scope '/tasks' do
        get '/' => 'tasks#index', as: 'tasks'
        post '/' => 'tasks#create', as: 'create_task'

        scope '/new' do
          get '/' => 'tasks#new', as: 'new_task'
        end

        scope '/:id' do
          get '/' => 'tasks#show', as: 'task'
          put '/' => 'tasks#update', as: 'update_task'
          patch '/' => 'tasks#update'
          delete '/' => 'tasks#destroy', as: 'destroy_task'

          scope '/edit' do
            get '/' => 'tasks#edit', as: 'edit_task'
          end
        end

      end

      scope '/task_logs' do
        get '/' => 'task_logs#index', as: 'task_logs'
      end

    end
  end

end
