# # encoding: utf-8
# # copyright: 2018, sydfx
# # Dynamic file
#
# # You can write test objects variables here
# # vpc_identifier = attribute('vpc.id', description: 'VPC resource ID')
# pubsubnet = attribute('subnet.public.id', description: 'Public subnet resource ID')
# privsubnet = attribute('subnet.private.id', description: 'Private subnet resource ID')
# vpc_identifier = attribute('vpc.id', description: 'VPC resource ID')
#
# # you add controls here
# control 'AWS Network - VPC' do
#   impact 1.0
#   title 'AWS VPC basic configurations.'
#   desc 'This to test the various VPCs configurations.'
#
# describe aws_vpc(vpc_identifier) do
#   its('state') { should eq 'available' }
#   its('cidr_block') { should eq '10.0.0.0/16' }
#  end
# end
#
# control 'AWS Network - Subnet' do
#   impact 1.0
#   title 'AWS Subnet validation.'
#   desc 'This is to test the various Subnets configurations.'
#
# describe aws_subnet(pubsubnet) do
#   it { should exist }
#   its('vpc_id') { should eq 'vpc-f44a918f' }
#   its('cidr_block') { should cmp '10.0.1.0/24' }
#   its('availability_zone') { should eq 'us-east-1a' }
# end
#
# describe aws_subnet(privsubnet) do
#   it { should exist }
#   its('vpc_id') { should eq 'vpc-f44a918f' }
#   its('cidr_block') { should cmp '10.0.100.0/24' }
#   its('availability_zone') { should eq 'us-east-1a' }
#   end
# end
