include:
  - java


#play.{{ pillar['project_name'] }}:
#  pkg.installed:
#    - sources:
#      - {{ pillar['project_name'] }}: salt://binaries/{{ pillar['project_name'] }}-{{ pillar['project_version'] }}.deb
#    - name: {{ pillar['project_name'] }}
#    - version: {{ pillar['project_version'] }}
#  service:
#    - running
#    - watch:
#      - file: play_config
#      - file: play_startup_script
#    - require:
#      - pkg: play.{{ pillar['project_name'] }}
#
#
#play_startup_script:
#  file.managed:
#    - name: /etc/init.d/play.{{ pillar['project_name'] }}
#    - source: salt://play-app.debian.init.d
#    - template: jinja
#    - user: root
#    - group: root
#    - mode: 750
#    - require:
#      - file: play_config
#
#
#play_config:
#  file.managed:
#    - name: /etc/play.{{ pillar['project_name'] }}.conf
#    - source: salt://play-app.conf
#    - template: jinja
#    - user: root
#    - group: root
#    - mode: 644
