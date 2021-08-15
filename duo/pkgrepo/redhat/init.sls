{% set os = grains['os'] %}

duosecurity:
  pkgrepo.managed:
    - humanname: Duo Security Repository
    {% if os != "Rocky" -%}
    - baseurl: http://pkg.duosecurity.com/{{ os }}/$releasever/$basearch
    {% else -%}
    - baseurl: http://pkg.duosecurity.com/{{ os }}/CentOS/$basearch
    {% endif -%}
    - gpgcheck: 1
    - gpgkey: https://duo.com/DUO-GPG-PUBLIC-KEY.asc
    - skip_if_unavailable: True
    - enabled: 1
    - order: 1
