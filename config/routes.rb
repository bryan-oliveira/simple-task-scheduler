Rails.application.routes.draw do
  # get 'tasks/index'
  # get 'tasks/new'
  # get 'tasks/show'
  # get 'tasks/destroy'
  # get 'tasks/create'
  # get 'tasks/update'
  get '/authentication' => 'users#new'
  scope '/api' do
    scope '/v1' do
      post '/authenticate' => 'authentication#authenticate'

      scope '/users' do
        root 'users#new', as: 'users'
        post '/' => 'users#create'
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
        end # /:id

      end # /tasks

      scope '/task_logs' do
        get '/' => 'task_logs#index', as: 'task_logs'
      end

    end
  end

end
