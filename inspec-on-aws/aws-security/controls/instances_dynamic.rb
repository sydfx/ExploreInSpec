# encoding: utf-8
# copyright: 2018, sydfx

# List of IDs for the webserver instance.
webserver_id = attribute('ec2_instance.webserver', description: 'EC2 Webserver ID')
ec2_ami_id = attribute('ec2_instance.webserver.ami', description: 'AMI ID')
ec2_type = attribute('ec2_instance.webserver.instance_type', description: 'EC2 Type')
vpc_identifier = attribute('vpc.id', description: 'VPC ID')
public_subnet = attribute('subnet.public.id', description: 'Public subnet')
private_subnet = attribute('subnet.private.id', description: 'Private subnet')
web_security_group = attribute('security_group.web.id', description: 'Security group used for web')
ssh_security_group = attribute('security_group.ssh.id', description: 'Security group used for ssh')
mysql_security_group = attribute('security_group.mysql.id', description: 'Security group used for mysql')
# List of IDs for the database instance.
database_id = attribute('ec2_instance.database', description: 'Database Instance ID')
ec2_db_type = attribute('ec2_instance.database.instance_type', description: 'Database Instance Type')
ec2_db_ami_id = attribute('ec2_instance.database.ami', description: 'Database AMI ID')

describe aws_ec2_instance(webserver_id) do
  it { should be_running }
  its('image_id') { should eq (ec2_ami_id) }
  its('instance_type') { should eq (ec2_type) }
  its('vpc_id') { should eq (vpc_identifier) }
  its('subnet_id') { should eq (public_subnet) }
  its('security_group_ids') { should include (web_security_group) }
  its('security_group_ids') { should include (ssh_security_group) }
end

describe aws_ec2_instance(database_id) do
  it { should be_running }
  its('image_id') { should eq (ec2_db_ami_id) }
  its('instance_type') { should eq (ec2_db_type) }
  its('public_ip_address') { should_not be }
  its('vpc_id') { should eq (vpc_identifier) }
  its('subnet_id') { should eq (private_subnet) }
  its('security_group_ids') { should include (mysql_security_group) }
  its('security_group_ids') { should include (ssh_security_group) }
 end
