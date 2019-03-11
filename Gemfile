source 'https://rubygems.org'
ruby '2.6.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rake'
gem 'slim'
gem 'builder'
gem 'uglifier'

gem 'righthand', github: 'negonicrac/righthand'

gem 'middleman'
gem 'middleman-blog'
gem 'middleman-livereload'
gem 'middleman-smusher'
gem 'middleman-minify-html'

gem 'bootstrap-sass'

gem 'favicon_maker'
gem 'fog'
