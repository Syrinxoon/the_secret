Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "bAetdt9eiT2zjwN1O4hTwg", "e3RCjBIS24GcTnYJTItYdAsZiPX7IAcO3pKSs2A75g"
  provider :github, "452f43a12d41643ca795", "a5fdc7349a74ddd3ce6c706794d09ae6ea897bcc"
  provider :facebook, "570547766308496", "925ff9e344ca3b3490960ca9a6e5b658"
end