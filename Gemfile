current_dir = File.dirname(__FILE__)
source 'http://rubygems.org'
# Pinned gems are for changes we must include to work
# and are not merged and released as normal gems
pinned_gems =  {
  'chef-provisioning-hanlon' => {github: 'hh/chef-provisioning-hanlon', ref: 'master'},
  #'chef-provisioning-ssh' => {github: 'hh/chef-provisioning-hanlon', ref: 'master'},
  'hanlon-api' => {github: 'hh/hanlon-api-ruby', ref: 'master'},
  'chef' => {version: '12.16.42'},
  'chef-dk' => {version: '1.0.3'}
}

# Upstream gems should be places here when we need to debug them
# Just git clone to ./site-gems/
pinned_gems.each do |gem_name,config|
  local_path = "#{current_dir}/site-gems/#{gem_name}"
  if ::File.exists? local_path
    gem gem_name, path: local_path
  elsif config[:github]
    gem gem_name, git: "git@github.com:#{config[:github]}.git", ref: config[:ref]
  elsif config[:version]
    gem gem_name, config[:version]
  else
    gem gem_name
  end
end

gem 'pry'
gem 'pry-byebug'
gem 'chef-zero'
gem 'cheffish'
gem 'chef-provisioning-fog'
gem 'chef-provisioning-ssh'
