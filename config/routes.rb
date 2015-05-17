Rails.application.routes.draw do

resources :bets
 
 root "bets#index"
  
end
