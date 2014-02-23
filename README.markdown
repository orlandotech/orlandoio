# Orlando.io
Orlando Startup Community Directory
Connecting the people, places, and events, that make up the City Beautiful's tech community.

### V1
* Create user profile with name, bio, picture, social links, and skills.
* Login with email
* Login with Facebook Github
* Link email with Facebook / Github account
* Filter profiles based on skills


#Instructions
~~~
bundle install --without production
rake db:migrate
rename config/application.example.yml to application.yml
replace tokens/keys in application.yml with your own keys for: AWS S3, Github, Facebook
optional: rake db:seed to pre-populate with a few profiles.
rails s
~~~