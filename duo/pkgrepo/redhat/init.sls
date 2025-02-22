{% set os = grains['os'] %}
{% set releasever = grains['osmajorrelease'] | int %}

{% if os == "Rocky" %}
{% set os = "CentOS" %}
{% endif %}

{% if releasever > 8 %}
{% set releasever = 8 %}
{% endif %}

duosecurity:
  pkgrepo.managed:
    - humanname: Duo Security Repository
    - baseurl: http://pkg.duosecurity.com/{{ os }}/{{ releasever }}/$basearch
    - gpgcheck: 1
    - gpgkey: https://duo.com/DUO-GPG-PUBLIC-KEY-MAY-2030.asc
    - skip_if_unavailable: True
    - enabled: 1
    - order: 1
