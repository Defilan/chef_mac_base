name 'macbase'
maintainer 'Christopher Maher'
maintainer_email 'defilan@gmail.com'
license 'MIT'
description 'Installs/Configures custom macbase'
long_description 'Installs/Configures macbase'
version '0.1.1'
chef_version '>= 12.1' if respond_to?(:chef_version)
depends 'homebrew'
depends 'build-essential'
depends 'oh_my_zsh'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/macbase/issues'

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/macbase'
