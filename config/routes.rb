Rails.application.routes.draw do

root "bets#index"

devise_for :users, :controllers => { registrations: 'registrations' }

resources :bets do
	
	member do
		put "like" => "bets#upvote"
		put "unlike" => "bets#downvote"
	end

end

  
end
