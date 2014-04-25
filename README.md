# Orlando.io
Orlando Startup Community Directory
Connecting the people, places, and events, that make up the City Beautiful's tech community.

This projected is licensed under the terms of the GPL license.

#Instructions
~~~
bundle install --without production
rake db:migrate
rename config/application.example.yml to application.yml
replace tokens/keys in application.yml with your own keys for: AWS S3, Github, Facebook
optional: rake db:seed to pre-populate with a few profiles.
rails s
~~~
