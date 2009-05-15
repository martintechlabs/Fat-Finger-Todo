require 'mongrel_cluster/recipes'

set :application, "fftodo"
set :repository,  "file://localhost/usr/local/svn/repositories/svnmtl/#{application}"
set :user, 'mtldev'
set :deploy_to, "/home/mtldev/rubyapps/#{application}"
set :use_sudo, false
set :mongrel_conf, "/etc/mongrel_cluster/#{application}.yml"

ssh_options[:username] = 'mtldev'
ssh_options[:port] = 2222

role :app, "localhost"
role :web, "localhost"
role :db,  "localhost", :primary => true
