default['yum']['ius-archive-source']['repositoryid'] = 'ius-archive-source'
default['yum']['ius-archive-source']['enabled'] = false
default['yum']['ius-archive-source']['managed'] = false
default['yum']['ius-archive-source']['failovermethod'] = 'priority'
default['yum']['ius-archive-source']['gpgkey'] = 'http://mirror.its.dal.ca/ius/IUS-COMMUNITY-GPG-KEY'
default['yum']['ius-archive-source']['gpgcheck'] = true
case node['platform_version'].to_i
when 5
  default['yum']['ius-archive-source']['description'] = 'IUS Community Packages for Enterprise Linux 5 - $basearch Archive Source'
  default['yum']['ius-archive-source']['mirrorlist'] = 'http://dmirr.iuscommunity.org/mirrorlist/?repo=ius-el5-archive-source&arch=$basearch'
when 6
  default['yum']['ius-archive-source']['description'] = 'IUS Community Packages for Enterprise Linux 6 - $basearch Archive Source'
  default['yum']['ius-archive-source']['mirrorlist'] = 'http://dmirr.iuscommunity.org/mirrorlist/?repo=ius-el6-archive-source&arch=$basearch'
end
