BiblesearchExample::Application.routes.draw do
	namespace :admin do
		get 'cache/refresh', to: 'cache#refresh', as: "refresh_cache"
		get 'cache', to: 'cache#index', as: "cache"
	end

	get '/:version_uid/passages', to: 'passages#show', as: "passages"
	get '/:version_uid/search/', to: 'search#show', as: "search"

	get '/:version_uid/:book_code/:chapter_number', to: 'chapters#show' , as: "show_chapter"
	get '/:version_uid/:book_code/:chapter_number/:verse_number', to: 'verses#show' , as: "show_verse"

	get '/versions/', to: 'versions#index', as: "versions"
	get '/versions/:version_uid', to: 'versions#show', as: "show_version"

	get '/about', to: 'pages#about', as: "about"

	root :to => 'versions#index'
end
