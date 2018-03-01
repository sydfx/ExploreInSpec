# encoding: utf-8
# copyright: 2018, sydfx

# you add controls here
webserver_id = attribute('ec2_instance.webserver', description: 'webserver id')
ami_id = attribute('ec2_instance.webserver.ami', description: 'ami id')
ec2_type = attribute('ec2_instance.webserver.instance_type', description: 'EC2 Type')
vpc_identifier = attribute('vpc.id', description: 'VPC ID')
public_subnet = attribute('subnet.public.id', description: 'Public subnet')
web_security_group = attribute('security_group.web.id', description: 'Security group used for web usage')
ssh_security_group = attribute('security_group.ssh.id', description: 'Security group used for ssh usage')

describe aws_ec2_instance(webserver_id) do
  it { should be_running }
  its('image_id') { should eq (ami_id) }
  its('instance_type') { should eq (ec2_type) }
  its('vpc_id') { should eq (vpc_identifier) }
  its('subnet_id') { should eq (public_subnet) }
  its('security_group_ids') { should include (web_security_group) }
  its('security_group_ids') { should include (ssh_security_group) }
end
