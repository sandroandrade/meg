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

Creating two RESTful server plugins:
$ ./bin/meg generate plugin Conference -t sinatra-service-plugin -a myserver/ acronym:string name:string city:string country:string venue:string start_date:datetime end_date:datetime
$ ./bin/meg generate plugin Speaker -t sinatra-service-plugin -a myserver/ name:string affiliation:string shortbio:string

Running the server:
$ cd myserver
$ rake db:migrate
$ sqlite3 db/development.sqlite3
Populate with some data:
insert into conferences values (1, 'QtCon-BR', 'QtCon Brasil', 'São Paulo', 'Brasil', 'Espaco Fit', '2017-08-18 09:00:00', '2017-08-20 18:00:00');
insert into conferences values (2, 'Akademy', 'Akademy', 'Berlin', 'Germany', 'BCC', '2017-03-01 09:00:00', '2017-03-03 18:00:00');
insert into conferences values (3, 'Conf.KDE.in', 'Conf.KDE.in', 'Guwahati', 'India', 'IIT', '2017-03-10 09:00:00', '2017-03-12 18:00:00');
insert into speakers values (1, 'Our beloved Konqi', 'KDE', 'Konqi is awesome');
insert into speakers values (2, 'Dirk Gently', 'Adams', 'He is a holistic detective');
Run the server:
$ ruby myserver.rb

Creating a new Qt RESTful client:
$ ./bin/meg new MyApp -t restful-app

Creating two RESTful client plugins:
$ ./bin/meg generate plugin conferences -t restful-client-plugin -a myapp -i name -c action/ic_speaker_notes acronym:string name:string city:string venue:string start_date:datetime end_date:datetime
$ ./bin/meg generate plugin speakers -t restful-client-plugin -a myapp -i name -c action/ic_record_voice_over name:string affiliation:string shortbio:string

Build and run your Qt mobile application
