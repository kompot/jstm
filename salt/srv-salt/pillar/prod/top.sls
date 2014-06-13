taskmanager_prod:
  '*':
    - saltmine
    - network
    - common
  'roles:balancer':
    - match: grain
    - nginx
