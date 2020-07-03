# config valid only for current version of Capistrano
# capistranoのバージョンを記載。固定のバージョンを利用し続け、バージョン変更によるトラブルを防止する
lock '3.14.1'

# Capistranoのログの表示に利用する
set :application, 'chat-space'

# どのリポジトリからアプリをpullするかを指定する
set :repo_url,  'git@github.com:megukentarou/chat-space.git'

# バージョンが変わっても共通で参照するディレクトリを指定
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.5.1' #カリキュラム通りに進めた場合、2.5.1か2.3.1です

# どの公開鍵を利用してデプロイするか
set :ssh_options, auth_methods: ['publickey'],
                  keys: ['ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDYUYYmJ9J8MOuB6ut8BnsJi3DEVE+h4xzOne2BnvsPXwW7zBQ+0AfT5ToCbzxSOpDyrYbBdbOQ6de2Y12E3A3Fka4gw3/Rmc3lynvv93ZVVw+Q1mm1JqKH5Tsg00j1zQM6Tq5vD+LB/a+el+h5AKoYQZKdDCCNvuGbxRrZ3lh+l/XJxpZbSAG8SuXzlWLeFEahRWOhpblOlv9cTahzTBjNmFAeyVEOnGM/d71VpFqpNgAkNsB9PJh7orK3T5YZq/U3coZN0jWBc4eoha5uS1MuTLNTdWLFk3ND79c8MN3iq3f+ZGaeQVGE1K97A/92Cc1/UJz/hWztYJGXpYwycrX6jZgOp4WINnCs2AQel0XLPoEh7ppX7yjLHFBxIAgQKZJIQtfuZBOlFwWJ2RiRq1L7qS1JUg9+S2vpEkv+vuNNDzvBm5a3ZXc5CsDyV68vUL1SjYA81jMRk0Qmxc64b6QVKjV49PwVd/faB5dVgjf57BEdXTPajdzvOV+Xx/cUfo2RAgtQKPDW3xZ8qDxpWq3ij5gUkFz/EQEkgvV6bIx9FdZv2JsKEJwmsPIy5oveKoV+v/huzNc9EYRqIzLc3kikntqWCZ+qniFjDTDUPUzJPOTsYFled9fTrjn1WndksbipPJgVBAl1sRjglQiIXP3l9Zb4lnSDTi9BLStr5OFjkw== ec2-user@ip-172-31-5-236'] 

# プロセス番号を記載したファイルの場所
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

# Unicornの設定ファイルの場所
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

# デプロイ処理が終わった後、Unicornを再起動するための記述
after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end