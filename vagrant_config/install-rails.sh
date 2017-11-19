sudo apt-get -y install nodejs

gem install rails -v $1

sudo chown -Rc vagrant:rvm /usr/local/rvm/gems/ruby-2.3.3/wrappers
