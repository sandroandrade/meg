Step to installation:

* Install ruby
* Run 'export PATH=$PATH:$(ruby -rubygems -e "puts Gem.user_dir")/bin'
* Run 'gem install bundle'
* Run 'bundle install'
* Run 'rake db:migrate'
* Run 'ruby <your-server>.rb
