Rails.application.routes.draw do
  # get 'tasks/index'
  # get 'tasks/new'
  # get 'tasks/show'
  # get 'tasks/destroy'
  # get 'tasks/create'
  # get 'tasks/update'

  scope '/api' do
    scope '/v1' do
      scope '/tasks' do
        get '/' => 'tasks#index', as: 'tasks'
        post '/' => 'tasks#create'
        scope '/new' do
          get '/' => 'tasks#new', as: 'new_task'
        end
        scope '/:id' do
          get '/' => 'tasks#show', as: 'task'
          put '/' => 'tasks#update'
          patch '/' => 'tasks#update'
          delete '/' => 'tasks#destroy', as: 'delete_task'
          scope '/edit' do
            get '/' => 'tasks#edit', as: 'edit_task'
          end
        end
      end
    end
  end
end
