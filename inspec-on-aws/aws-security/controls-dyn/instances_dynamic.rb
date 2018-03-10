# encoding: utf-8
# copyright: 2018, sydfx
# Dynamic file based on a attributes file - ../files/attributes.yml

# List of objects variables for a webserver instance.
webserver_id = attribute('ec2_instance.webserver', description: 'EC2 webserver instance ID')
ec2_ami_id = attribute('ec2_instance.webserver.ami', description: 'AMI ID')
ec2_type = attribute('ec2_instance.webserver.instance_type', description: 'EC2 Type')
vpc_identifier = attribute('vpc.id', description: 'VPC resource ID')
pubsubnet = attribute('subnet.public.id', description: 'Public subnet resource ID')
privsubnet = attribute('subnet.private.id', description: 'Private subnet resource ID')
websec = attribute('security_group.web.id', description: 'Security group ID used for web')
sshsec = attribute('security_group.ssh.id', description: 'Security group ID used for ssh')
sqlsec = attribute('security_group.mysql.id', description: 'Security group ID used for mysql')
# List of objects variables for a database instance.
database_id = attribute('ec2_instance.database', description: 'Database Instance ID')
ec2_db_type = attribute('ec2_instance.database.instance_type', description: 'Database Instance Type')
ec2_db_ami_id = attribute('ec2_instance.database.ami', description: 'Database AMI ID')

describe aws_ec2_instance(webserver_id) do
  it { should be_running }
  its('image_id') { should eq (ec2_ami_id) }
  its('instance_type') { should eq (ec2_type) }
  its('vpc_id') { should eq (vpc_identifier) }
  its('subnet_id') { should eq (pubsubnet) }
  its('security_group_ids') { should include (websec) }
  its('security_group_ids') { should include (sshsec) }
end

describe aws_ec2_instance(database_id) do
  it { should be_running }
  its('image_id') { should eq (ec2_db_ami_id) }
  its('instance_type') { should eq (ec2_db_type) }
  its('public_ip_address') { should_not be }
  its('vpc_id') { should eq (vpc_identifier) }
  its('subnet_id') { should eq (privsubnet) }
  its('security_group_ids') { should include (sqlsec) }
  its('security_group_ids') { should include (sshsec) }
 end
