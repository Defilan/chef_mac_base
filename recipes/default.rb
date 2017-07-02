#
# Cookbook:: macbase
# Recipe:: default
#
# Copyright:: 2017, Christopher Maher, MIT.

#Create standard directories
%W(
  /Users/#{node['macbase']['user']}/stuffy
  /Users/#{node['macbase']['user']}/stuffy/code
  /Users/#{node['macbase']['user']}/stuffy/chefwork
  /Users/#{node['macbase']['user']}/stuffy/playground
).each do |dirs|
  directory dirs do
    recursive true
  end
end

#Configure sudoers file for homebrew use
directory '/etc/sudoers.d' do
  owner 'root'
  group 'wheel'
  mode '0755'
  action :create
end

template '/etc/sudoers.d/homebrew_chef' do
  owner 'root'
  group 'wheel'
  mode '0644'
  source 'sudoers.d/homebrew_chef.erb'
  action :create_if_missing
  variables(hostname: node['hostname'],
            user: node['macbase']['user'])
end

#Install Cask and Brew packages
include_recipe 'build-essential'
include_recipe 'homebrew'
include_recipe 'homebrew::cask'

%w(
  virtualbox
  virtualbox-extension-pack
  visual-studio-code
  vagrant
  iterm2
  chefdk
  hab
  evernote
  royal-tsx
  microsoft-office
  bettertouchtool
).each do |installer|
  homebrew_cask installer
end

%w(
  docker
  vault
  jfrog-cli-go
  zsh
  zsh-syntax-highlighting
  zsh-autosuggestions
  python3
).each do |installer|
  package installer
end

