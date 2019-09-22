Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'],
    :redirect_uri => ENV['GITHUB_REDIRECT']
end