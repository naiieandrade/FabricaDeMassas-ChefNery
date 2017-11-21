execute 'update packages' do 
    command 'apt-get update'
end

execute 'update packages' do 
    command 'apt-get update'
end

execute 'Install GPG key for rvm' do 
    command 'gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB'
end

execute 'Install rvm and ruby' do 
    command 'curl -sSL https://get.rvm.io | bash -s stable'
end

execute 'Install ruby 2.3.3 ' do 
    command '
source /usr/local/rvm/scripts/rvm || source /etc/profile.d/rvm.sh && rvm use 2.3.3'
end


package 'rails' 

package 'build-essential'

package 'nodejs'

execute 'install bundler' do
    command 'gem install bundler'
end

