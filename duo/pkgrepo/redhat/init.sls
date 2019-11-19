{% set os = grains['os'] %}

duosecurity:
  pkgrepo.managed:
    - humanname: Duo Security Repository
    - baseurl: http://pkg.duosecurity.com/{{ os }}/$releasever/$basearch
    - gpgcheck: 1
    - gpgkey: https://duo.com/DUO-GPG-PUBLIC-KEY.asc
    - skip_if_unavailable: True
    - enabled: 1
    - order: 1
