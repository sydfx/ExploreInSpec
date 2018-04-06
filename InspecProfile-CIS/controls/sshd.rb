# encoding: utf-8
# copyright: 2018, sydfx

# you add controls here
title 'sshd InSpec Compliance'

control 'ssh-01' do
  impact 1.0
  title 'sshd security compliance configuration'
  desc 'sshd configuration should comply with this test to have the best security practices'
  ref 'sshd documentation', url: 'http://www.delafond.org/traducmanfr/man/man5/sshd_config.5.html'
  describe sshd_config do
  its('Protocol') { should cmp 2 }
  its('PubkeyAuthentication') { should eq 'yes' }
  its('PasswordAuthentication') { should eq 'no' }
  its('PermitEmptyPasswords') { should eq 'no' }
  its('PermitRootLogin') { should eq 'no' }
  its('X11Forwarding') { should eq 'no' }
  its('StrictModes') { should eq 'yes' }
  its('LogLevel') { should eq 'INFO' }
 end
end
