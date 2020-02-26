Rails.application.routes.draw do

  get 'todolists/new'
	get 'top' => 'homes#top'
	post 'todolists' => 'todolists#create'

	get 'todolists' => 'todolists#index'
	get 'todolists/:id' => 'todolists#show', as:'todolist'
	#todolists/1 や todolists/3に該当する。
	#上の as: は　「'todolists#show'の設定を、
	#todolistとして利用できる」の意味になります. このasを「名前付きルート」と言います

	get 'todolists/:id/edit' => 'todolists#edit', as: 'edit_todolist'
	patch 'todolists/:id' => 'todolists#update', as:'update_todolist'
	delete 'todolists/:id' => 'todolists#destroy', as: 'destroy_todolist'
end
