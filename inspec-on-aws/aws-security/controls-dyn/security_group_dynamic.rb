# # encoding: utf-8
# # copyright: 2018, sydfx
# # Dynamic file
#
# # You can write test objects variables here
# web_security_group = attribute('security_group.web.id', description: 'Security group ID used for web')
# ssh_security_group = attribute('security_group.ssh.id', description: 'Security group ID used for ssh')
# mysql_security_group = attribute('security_group.mysql.id', description: 'Security group ID used for mysql')
#
# # Ingress rules for security group will be writen here when developed;
#
# # Egress rules for security group will be writen here when developed;
#
# # You can write controls here.
# control 'AWS Security Group' do
#   impact 1.0
#   title 'AWS Security group configurations'
#   desc 'This is a validation of various security groups.'
#
# describe aws_security_group(mysql_security_group) do
#   it { should exist }
#   # TODO: Add security_group ingress/egress rules (when developed)
#  end
#
#  describe aws_security_group(ssh_security_group) do
#   it { should exist }
#   # TODO: Add security_group ingress/egress rules (when developed)
#  end
#
# describe aws_security_group(web_security_group) do
#   it { should exist }
#   # TODO: Add security_group ingress/egress rules (when developed)
#  end
#
# end
