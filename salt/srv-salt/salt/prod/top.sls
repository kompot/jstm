jstm_prod:
  'roles:balancer':
    - match: grain
    - common
    - balancer
  'roles:dev':
    - match: grain
    - common
    - node
    - compass
    - dev
