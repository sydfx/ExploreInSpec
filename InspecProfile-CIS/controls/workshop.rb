# encoding: utf-8
# copyright: 2018, sydfx

# you add controls here
title 'Workshop InSpec Compliance'
# Reference to write this test --> http://www.anniehedgie.com/inspec-basics-2

# you add controls here

# SSH supports two different and incompatible protocols: SSH1 and SSH2.
# SSH1 was the original protocol and was subject to security issues.
# SSH2 is more advanced and secure.
# How would I test this?
control 'ssh-01' do
  impact 1.0
  title 'Ensure that the SSH Agent is running.'
  desc 'The description is not needed here, read the title'
  describe service 'ssh-agent' do
    it { should be_running }
  end
end

control 'ssh-02' do
  impact 1.0
  title 'SSH Version 2'
  desc <<-EOF
    SSH supports two different protocol versions. The original version, SSHv1,
was subject to a number of security issues. Please use SSHv2 instead to avoid
these.
EOF
  describe sshd_config do
  its('Protocol') { should cmp 2 }
 end
end
