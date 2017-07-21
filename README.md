# meg

Cross-platform mobile application development framework

# Installation

1. Install ruby
2. Run 'gem install bundler'
3. Run 'export PATH=$PATH:~/.gem/ruby/2.3.0/bin'
4. Run 'bundle install'
5. Run 'bin/meg'

# Use

Creating a new RESTful server:
$ ./bin/meg new myserver -t sinatra-server

Creating a new RESTful server plugin:
$ ./bin/meg generate plugin Conference -t sinatra-service-plugin -a myserver/ acronym:string name:string city:string country:string venue:string start_date:datetime end_date:datetime

Running the server:
$ cd myserver
$ rake db:migrate
$ sqlite3 db/development.sqlite3
Populate some data:
$ insert into conferences values (1, 'QtCon-BR', 'QtCon Brasil', 'São Paulo', 'Brasil', 'Espaco Fit', '2017-08-18 09:00:00', '2017-08-20 18:00:00');
$ insert into conferences values (2, 'Akademy', 'Akademy', 'Berlin', 'Germany', 'BCC', '2017-03-01 09:00:00', '2017-03-03 18:00:00');
Run the server:
$ ruby myserver.rb

Creating a new Qt RESTful client:
$ ./bin/meg new MyApp -t restful-app

Creating a new RESTful client plugin:
$ ./bin/meg generate plugin conferences -t restful-client-plugin -a myapp -i name -c action/ic_3d_rotation acronym:string name:string city:string venue:string start_date:datetime end_date:datetime

Build and run your Qt mobile application
