# encoding: utf-8
# copyright: 2018, The Authors

title 'REST API call learning'

# Attributes here.

# Plain test here.
describe http('http://google.com') do
  its('status') { should cmp 302 }
end


# Controls here.
control 'google-01' do
  impact 1.0
  title 'Website validation'
  desc 'Insert some description here'
  ref 'Some reference', url: 'http://link.to.some.documentation.com'
  describe http('http://google.com',
    params: {format: 'html'},
    read_timeout: 10,
    open_timeout: 0,
    ssl_verify: 'fuck',
    method: 'GET',
    headers: {'Content-Type' => 'application/json'}) do
    its('status') { should cmp 302 }
    its('headers.Content-Type') { should cmp 'text/html; charset=UTF-8' }
  end
end
