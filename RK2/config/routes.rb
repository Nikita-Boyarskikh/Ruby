Rails.application.routes.draw do
  get 'rk2/input'

  get 'rk2/result'

  root 'rk2#input'
end
