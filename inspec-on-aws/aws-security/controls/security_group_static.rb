# encoding: utf-8
# copyright: 2018, sydfx
# Static file

# you add controls here
control 'AWS Security Group' do
  impact 1.0
  title 'AWS Security group configurations'
  desc 'This is a validation of various security groups.'

describe aws_security_group('sg-1982736f') do
  it { should exist }
  # TODO: Add security_group ingress/egress rules (when developed)
 end

 describe aws_security_group('sg-27887951') do
  it { should exist }
  # TODO: Add security_group ingress/egress rules (when developed)
 end

describe aws_security_group('sg-fc9c6d8a') do
  it { should exist }
  # TODO: Add security_group ingress/egress rules (when developed)
 end

end
