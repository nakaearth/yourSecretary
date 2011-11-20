Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'KEY1', 'KEY2'
end 
