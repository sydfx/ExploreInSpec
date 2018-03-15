# encoding: utf-8
# copyright: 2018, sydfx

title 'Docker learning tests file'
# References to write this test: http://lollyrock.com/articles/inspec-for-docker/

# inspec exec https://github.com/dev-sec/linux-baseline -t docker://someContainerID
# This is to use the DevSec baseline to test a container.

# Controls starts here.
control "PostgreSQL - Docker container" do                     # A unique ID for this control
  impact 1.0                                # The criticality, if this control fails.
  title "PostgreSQL is running? On the right port?"      # A human-readable title
  desc "Verify that the DB run and the port is mapped."         # Describe why this is needed
  tag data: "config data"                   # A tag allows you to associate key information
  tag "security"                            # to the test
  ref "Document A-12", url: 'http://wiki.openrepose.org'      # Additional references
  describe docker_container('some-postgres') do               # The actual test
  it { should exist }
  it { should be_running }
  its('repo') { should eq 'postgres' }
  its('ports') { should eq "0.0.0.0:5432->5432/tcp" }
  its('command') { should eq 'docker-entrypoint.sh postgres' }
 end
end


# # This is a reference
#
# control "docker-01" do
#   impact 1.0
#   title "PostgreSQL is running? On the right port?"
#   desc "Verify that the DB run and the port is mapped."
#   tag data: "database"
#   tag "PostgreSQL - Container configuration"
#   ref "Possible Reference can be Inserted here", url: 'http://videri.atlassian.com/wiki'
#   describe docker_container(container_name) do
#   it { should exist }
#   it { should be_running }
#   its('repo') { should eq (repository) }
#   its('ports') { should eq (mapped_ports) }
#   its('command') { should eq (run_cmd) }
#  end
# end
