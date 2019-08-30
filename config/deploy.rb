lock '3.11.0'

# set :default_env, {
#   rbenv_root: "/usr/local/rbenv",
#   path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH",
#   CS_AWS_ACCESS_KEY: ENV["CS_AWS_ACCESS_KEY"],
#   CS_AWS_SECRET: ENV["CS_AWS_SECRET"]
# }

set :application, 'other_chat'
set :repo_url,  'git@github.com:KazYam1001/other_chat.git'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.5.1' #カリキュラム通りに進めた場合、2.5.1か2.3.1です

set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/yampro.pem']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

# master.key用のシンボリックリンクを追加
# set :linked_files, %w{ config/master.key }

# # 元々記述されていた after 「'deploy:publishing', 'deploy:restart'」以下を削除して、次のように書き換え

# after 'deploy:publishing', 'deploy:restart'
# namespace :deploy do
#   task :restart do
#     # invoke 'unicorn:restart'
#     invoke 'unicorn:stop'
#     invoke 'unicorn:start'
#   end

#   desc 'upload master.key'
#   task :upload do
#     on roles(:app) do |host|
#       if test "[ ! -d #{shared_path}/config ]"
#         execute "mkdir -p #{shared_path}/config"
#       end
#       upload!('config/master.key', "#{shared_path}/config/master.key")
#     end
#   end
#   before :starting, 'deploy:upload'
#   after :finishing, 'deploy:cleanup'
# end
