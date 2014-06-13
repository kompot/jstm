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

startnode:
  cmd.run:
    - name: cd /home/vagrant/app && npm install && npm run-script dev
    - user: vagrant
    - require:
      - cmd: preinstall


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

