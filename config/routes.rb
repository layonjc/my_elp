Rails.application.routes.draw do
  root :to => "restaurants#index"
  # Routes for the Reminder resource:
  # CREATE
  get "/reminders/new", :controller => "reminders", :action => "new"
  post "/create_reminder", :controller => "reminders", :action => "create"

  # READ
  get "/reminders", :controller => "reminders", :action => "index"
  get "/reminders/:id", :controller => "reminders", :action => "show"

  # UPDATE
  get "/reminders/:id/edit", :controller => "reminders", :action => "edit"
  post "/update_reminder/:id", :controller => "reminders", :action => "update"

  # DELETE
  get "/delete_reminder/:id", :controller => "reminders", :action => "destroy"
  #------------------------------

  # Routes for the Pic resource:
  # CREATE
  get "/pics/new", :controller => "pics", :action => "new"
  post "/create_pic", :controller => "pics", :action => "create"

  # READ
  get "/pics", :controller => "pics", :action => "index"
  get "/pics/:id", :controller => "pics", :action => "show"

  # UPDATE
  get "/pics/:id/edit", :controller => "pics", :action => "edit"
  post "/update_pic/:id", :controller => "pics", :action => "update"

  # DELETE
  get "/delete_pic/:id", :controller => "pics", :action => "destroy"
  #------------------------------

  # Routes for the Restaurant resource:
  # CREATE
  get "/restaurants/new", :controller => "restaurants", :action => "new"
  post "/create_restaurant", :controller => "restaurants", :action => "create"

  # READ
  get "/restaurants", :controller => "restaurants", :action => "index"
  get "/restaurants/:id", :controller => "restaurants", :action => "show"

  # UPDATE
  get "/restaurants/:id/edit", :controller => "restaurants", :action => "edit"
  post "/update_restaurant/:id", :controller => "restaurants", :action => "update"

  # DELETE
  get "/delete_restaurant/:id", :controller => "restaurants", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
