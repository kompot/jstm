# install stable RVM http://rvm.io/rvm/install
#rvm:
#  cmd.run:
#    - name: \curl -sSL https://get.rvm.io | bash -s stable --ruby
#    - unless: rvm --version
#
#rmvpostinstall:
#  cmd.run:
#    - name: source /usr/local/rvm/scripts/rvm
#    - require:
#      - cmd: rvm
#
## http://stackoverflow.com/questions/22544754/failed-to-build-gem-native-extension-installing-compass
#rvmrequirements:
#  cmd.run:
#    - name: rvm requirements
#    - require:
#      - cmd: rmvpostinstall
#
## install ruby 2.1.x, compass requires 1.9.3, but rvm says it's not supported
#ruby:
#  cmd.run:
#    - name: rvm install 2.1
#    - unless: rvm list | grep ruby-2.1
#    - require:
#      - cmd: rvmrequirements
#
#ruby21:
#  cmd.run:
#    - name: rvm --default use 2.1
#    - require:
#      - cmd: ruby
#
## install compass prerelease version (it's 1.0.0.alpha.19 right now)
#compass:
#  cmd.run:
#    - name: gem install compass --pre
#    - unless: compass --version
#    - require:
#      - cmd: ruby21



#installrvm:
#  rvm.install
#
#installruby20:
#  rvm.install_ruby: 2.0
#  rvm.set_default: 2.0
