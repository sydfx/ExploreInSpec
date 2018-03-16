# encoding: utf-8
# copyright: 2018, The Authors

title 'REST API call learning'

# Attributes here.

# Plain test here.
describe http('http://www.mtlinfographie.com') do
  its('status') { should cmp 200 }
end


# Controls here.
control 'mtlinfo-01' do
  impact 1.0
  title 'Website validation'
  desc 'Insert some description here'
  ref 'Some reference', url: 'http://link.to.some.documentation.com'
  describe http('http://www.mtlinfographie.com',
    params: {format: 'html'},
    method: 'GET',) do
    its('status') { should cmp 200 }
    its('body') { should include 'GravCMS' }
    its('headers.Content-Type') { should cmp 'text/html; charset=UTF-8' }
  end
end
control 'mtlinfo-02' do
  impact 1.0
  title 'Website parameters validation'
  desc 'Insert some description here'
  ref 'Some reference', url: 'http://link.to.some.documentation.com'
  describe http('http://www.mtlinfographie.com').headers do
  its('Content-Length') { should cmp 36039 }
  its('Content-Type') { should cmp 'text/html; charset=UTF-8' }
 end
end
control 'mtlinfo-03' do
  impact 1.0
  title 'Website parameters validation 02'
  desc 'Insert some description here'
  ref 'Some reference', url: 'http://link.to.some.documentation.com'
  describe http('http://www.mtlinfographie.com') do
    its('http_method') { should cmp 'GET' }
  end
end
# read_timeout: 10,
# open_timeout: 10,
# ssl_verify: 'fuck',
# headers: {'Content-Type' => 'application/json'}
