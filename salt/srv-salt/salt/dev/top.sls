jstm_dev:
  'roles:balancer':
    - match: grain
    - common
    - balancer
  'roles:dev':
    - match: grain
    - common
    - node
    - dev
