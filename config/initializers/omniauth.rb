Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "883076264081-516idi9poub82a1ofdihleb866t5d7sp.apps.googleusercontent.com", "LKcamHZifvTA3I37qWpyVMd5", skip_jwt: true
end