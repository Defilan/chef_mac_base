#
# Cookbook:: macbase
# Recipe:: default
#
# Copyright:: 2018, Christopher Maher, MIT.

# Create standard directories
%W(
  /Users/#{node['macbase']['user']}/stuffy
  /Users/#{node['macbase']['user']}/stuffy/code
  /Users/#{node['macbase']['user']}/stuffy/chefwork
  /Users/#{node['macbase']['user']}/stuffy/playground
).each do |dirs|
  directory dirs do
    recursive true
    owner node['macbase']['user']
  end
end

# Configure sudoers file for homebrew use
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

# Install Cask and Brew packages
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
  1password
  firefox
  postman
  slack
  spotify
  vmware-horizon-client
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
  rust
  golang
  exercism
).each do |installer|
  package installer
end

# Styles and preferences

git 'get dracula iterm2' do
  destination "/Users/#{node['macbase']['user']}/stuffy/code"
  repository 'https://github.com/dracula/iterm.git'
  action :sync
end

# Install Oh-My-Zsh!

user node['macbase']['user'] do
  action :modify
  shell '/bin/zsh'
end

git "/Users/#{node['macbase']['user']}/.oh-my-zsh" do
  repository 'https://github.com/robbyrussell/oh-my-zsh.git'
  user node['macbase']['user']
  reference 'master'
  action :sync
end

template "/Users/#{node['macbase']['user']}/.zshrc" do
  source 'default/zshrc.erb'
  variables(
    user: node['macbase']['user']
  )
end
