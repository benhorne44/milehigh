set :stage, :production

# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
# role :app, %w{deploy@example.com}
# role :web, %w{deploy@example.com}
# role :db,  %w{deploy@example.com}

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
# server 'example.com', user: 'deploy', roles: %w{web app}, my_property: :my_value
server "198.199.123.211", user: 'gschool', roles: [:app, :web, :db,], :primary => true

# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
set :pty, true
 set :ssh_options, {
   port: '25000',
   keys: %w(/home/gschool/.ssh/id_rsa),
   forward_agent: false,
   password: "gschool1"
   # auth_methods: %w(publickey password)
 }
# and/or per server
# role :all, %w{deploy@198.199.123.211}
# server "gschool@198.199.123.211",
#   user: 'gschool',
#   # roles: :all,
#   port: 25000,
#   ssh_options: {
#     user: 'gschool', # overrides user setting above
#     keys: %w(/home/gschool/.ssh/id_rsa),
#     forward_agent: false,
#     # :port => 25000,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
  # }
# setting per server overrides global ssh_options

# fetch(:default_env).merge!(rails_env: :production)
