nginx:
  pkg:
    - installed
  service:
    - running
    - reload: true
    - enable: true
    - watch:
      - file: /etc/nginx/nginx.conf
      - file: {{ pillar['nginx_vhost_dir'] }}/{{ pillar['project_name'] }}.conf

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://nginx/nginx.conf
    - template: jinja

nginx_log_dir:
  file.directory:
    - name: {{ pillar['nginx_log_dir'] }}
    - user: root
    - group: root
    - mode: 0750

nginx_vhost_dir:
  file.directory:
    - name: {{ pillar['nginx_vhost_dir'] }}
    - user: root
    - group: root
    - mode: 0750

/etc/nginx/ssl:
  file.directory:
    - user: root
    - group: root
    - mode: 0700

{{ pillar['nginx_vhost_dir'] }}/default:
  file.absent:
    - name: {{ pillar['nginx_vhost_dir'] }}/default

{{ pillar['nginx_vhost_dir'] }}/{{ pillar['project_name'] }}.conf:
  file.managed:
    - source: salt://nginx/{{ pillar['project_name'] }}.conf
    - template: jinja
