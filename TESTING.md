Testing the macconfig cookbook
=====

This cookbook includes both unit tests via [ChefSpec](https://github.com/sethvargo/chefspec) and integration tests via [Test Kitchen](https://github.com/test-kitchen/test-kitchen). Contributions to this cookbook will only be accepted if all tests pass successfully:

```bash
kitchen test
chef exec rspec
```

Setting up the test environment
-----

Install the latest version of [Vagrant](http://www.vagrantup.com/downloads.html) and [VirtualBox](https://www.virtualbox.org/wiki/Downloads) (free) or [VMWare Fusion](http://www.vmware.com/products/fusion) (paid).

The Chef tooling (chefspec/test kitchen/etc) is managed by the [Chef Development Kit](http://chefdk.io) - Version: 2.4.17 as of 12/26/2017

Clone the latest version of the cookbook from the repository.

```bash
git clone git@github.com:Defilan/macconfig.git
cd macconfig
```

Running ChefSpec
-----

ChefSpec unit tests are located in `spec`. Each recipe has a `recipename_spec.rb` file that contains unit tests for that recipe. Your new functionality or bug fix should have corresponding test coverage - if it's a change, make sure it doesn't introduce a regression (existing tests should pass). If it's a change or introduction of new functionality, add new tests as appropriate.

To run ChefSpec for the whole cookbook:

`chef exec rspec`

To run ChefSpec for a specific recipe:

`chef exec rspec spec/unit/recipes/default_spec.rb`

Running Test Kitchen
-----

Test Kitchen test suites are defined in [.kitchen.yml](https://github.com/defilan/macconfig/blob/master/.kitchen.yml). Running `kitchen test` will cause Test Kitchen to spin up each platform VM in turn, running the `macconfig::default` recipe with differing parameters in order to test all possible combinations of platform, install_flavor, and JDK version. If the Chef run completes successfully, corresponding tests in `test/integration` are executed. These must also pass.
