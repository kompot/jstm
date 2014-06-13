jstm_dev:
  '*':
    - saltmine
    - network
    - common
  'roles:balancer':
    - match: grain
    - nginx
