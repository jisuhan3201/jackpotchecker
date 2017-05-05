Rails.application.routes.draw do
  root 'jackpot#index'

  get 'result' => 'jackpot#checker'
end
