server "54.168.170.197", user: "deploy", roles: %w{app db web}

# ec2 deploy user pass: name one

set :ssh_options, {
  keys: %w(~/.ssh/id_rsa),
  forward_agent: true,
  auth_methods: %w(publickey)
}