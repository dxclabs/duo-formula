{% set os = grains['os'] %}
{% set releasever = grains['osmajorrelease'] | int %}

{% if os == "Rocky" %}
{% do salt['log.warning']("Detected Rocky Linux, rewriting os to CentOS") %}
{% set os = "CentOS" %}
{% endif %}

{% if releasever >= 8 and os == "CentOS" %}
{% do salt['log.warning']("Rewriting os to CentOSStream for better compatibility") %}
{% set os = "CentOSStream" %}
{% endif %}

duosecurity:
  pkgrepo.managed:
    - humanname: Duo Security Repository
    - baseurl: http://pkg.duosecurity.com/{{ os }}/{{ releasever }}/$basearch
    - gpgcheck: 1
    - gpgkey: https://duo.com/DUO-GPG-PUBLIC-KEY.asc
    - skip_if_unavailable: True
    - enabled: 1
    - order: 1
