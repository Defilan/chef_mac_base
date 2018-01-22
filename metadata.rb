name 'macbase'
maintainer 'Christopher Maher'
maintainer_email 'defilan@gmail.com'
license 'MIT'
description 'Installs/Configures custom macbase'
long_description 'Installs/Configures macbase'
version '0.1.5'
chef_version '>= 12.1' if respond_to?(:chef_version)
depends 'homebrew'
depends 'build-essential'

supports 'macos'

issues_url 'https://github.com/defilan/macconfig/issues'
source_url 'https://github.com/defilan/macconfig'
