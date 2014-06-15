#include:
#  - java


#devuser:
#  group.present:
#    - name: developer
#    - gid: 89
#  user.present:
#    - name: developer
#    - uid: 89
#    - gid: 89
#    - require:
#      - group: developer


preinstall:
  cmd.run:
    - name: cd /home/vagrant/app && sudo npm run-script beforedev
    - user: vagrant
    - require:
      - pkg: nodejs

# this is due to pm2 not starting up properly
# https://github.com/capistrano/capistrano/issues/1068
# https://github.com/Unitech/pm2/issues/88
heat pm2 up:
  cmd.run:
    - name: pm2 ping >/dev/null 2>&1
    - user: vagrant
    - cwd: /home/vagrant/app
    - require:
      - cmd: preinstall


startnode:
  cmd.run:
    - name: npm install && npm run-script dev
    - user: vagrant
    - cwd: /home/vagrant/app
    - require:
      - cmd: heat pm2 up


# make something more robust not to restart every minute
# https://github.com/Unitech/pm2/issues/282
cd /home/vagrant/app && pm2 delete pm2.dev.json && pm2 start pm2.dev.json:
  cron.present:
    - user: vagrant
    - minute: '*/1'
    - require:
      - cmd: startnode


#playdownload:
#  cmd.run:
#    - name: wget http://downloads.typesafe.com/play/2.2.1/play-2.2.1.zip
#    - unless: test -d /home/vagrant/play-2.2.1
#    - unless: test -f /home/vagrant/play-2.2.1.zip
#    - cwd: /home/vagrant
#
#
#playunpack:
#  cmd.run:
#    - name: unzip play-2.2.1.zip; mv play-2.2.1 play
#    - unless: test -d /home/vagrant/play
#    - cwd: /home/vagrant
#
#    - watch:
#      - cmd: playdownload



#appdir:
#  file.directory:
#    - name: /home/vagrant/app
#    - user: vagrant
#    - group: vagrant
#    - mode: 755
#    - recurse:
#      - user
#      - group
#      - mode
#    - watch:
#      - cmd: playunpack

