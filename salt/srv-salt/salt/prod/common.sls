vim:
  pkg:
    - installed

nano:
  pkg:
    - removed

mc:
  pkg:
    - installed

salt-minion:
  service.running:
    - watch:
      - file: /etc/salt/minion.d/networkinfo.conf
#      - file: /etc/salt/grains

/etc/salt/minion.d/networkinfo.conf:
  file.managed:
    - source: salt://etc/salt/minion.d/networkinfo.conf

#/etc/salt/grains:
#  file.managed:
#    - source: salt://etc/salt/grains
#    - template: jinja

/etc/hosts:
  file.managed:
    - source: salt://etc/hosts
    - template: jinja
