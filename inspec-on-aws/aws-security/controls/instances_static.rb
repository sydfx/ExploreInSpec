# encoding: utf-8
# copyright: 2018, sydfx

# you add controls here
control 'AWS Instances' do
  impact 0.2
  title 'AWS EC2 WebServer and its DB.'
  desc 'This is to test various EC2 configuration.'

describe aws_ec2_instance(name: 'webserver') do
  it { should be_running }
  its('image_id') { should eq 'ami-97785bed' }
  its('instance_type') { should eq 't1.micro' }
  its('public_ip_address') { should eq '34.201.19.149' }
  its('vpc_id') { should eq 'vpc-f44a918f' }
  its('subnet_id') { should eq 'subnet-492c2a2d' }
  its('security_group_ids') { should include 'sg-fc9c6d8a' }
  its('security_group_ids') { should include 'sg-27887951' }
end

describe aws_ec2_instance('i-091ca44c7bf099391') do
  it { should be_running }
  its('image_id') { should eq 'ami-97785bed' }
  its('instance_type') { should eq 't1.micro' }
  its('public_ip_address') { should_not be }
  its('vpc_id') { should eq 'vpc-f44a918f' }
  its('subnet_id') { should eq 'subnet-ca2026ae' }
  its('security_group_ids') { should include 'sg-1982736f' }
  its('security_group_ids') { should include 'sg-27887951' }
 end
end
