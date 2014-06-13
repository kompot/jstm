pre:
  match: '*'
  sls:
    - common

balancer:
  match: 'G@roles:balancer'
  sls:
    - balancer
  require:
    - pre

dev:
  match: 'G@roles:dev'
  sls:
    - node
    - dev
  require:
    - pre
