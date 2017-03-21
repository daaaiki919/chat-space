set :default_env, {
  rbenv_root: "/usr/local/rbenv",
  path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH",
  AWS_REGION: ENV['AWS_REGION'],
  AWS_ACCESS_KEY_ID: ENV['AWS_ACCESS_KEY_ID'],
  AWS_SECRET_ACCESS_KEY: ENV['AWS_SECRET_ACCESS_KEY']
}
