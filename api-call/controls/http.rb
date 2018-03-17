# encoding: utf-8
# copyright: 2018, The Authors

title 'REST API call learning'

# Attributes here.
url = attribute('target.url', description: 'The targeted URL')
status_code = attribute('http.returned.code', description: 'HTTP Response code expected')
headers_content = attribute('headers.content', description: 'Expected content in the headers of the target')
content_lengh = attribute('content.lengh', description: 'Validation of the content lengh')
content_type = attribute('content.type', description: 'Validation of the content type')
# body_content = attribute('body.content', description: 'Expected content in the body of the target')
# Controls here.
control 'http-01' do
  impact 1.0
  title 'Website validation'
  desc 'Insert some description here'
  ref 'Some reference', url: 'http://link.to.some.documentation.com'
  describe http((url),
    params: {format: 'html'},
    method: 'GET',) do
    its('status') { should cmp (status_code) }
    its('headers.Content-Type') { should cmp (headers_content) }
  end
end
control 'mtlinfo-02' do
  impact 1.0
  title 'Website content validation'
  desc 'Insert some description here'
  ref 'Some reference', url: 'http://link.to.some.documentation.com'
  describe http((url)).headers do
  its('Content-Length') { should cmp (content_lengh) }
  its('Content-Type') { should cmp (content_type) }
 end
end
control 'mtlinfo-03' do
  impact 1.0
  title 'Website http method validation'
  desc 'Insert some description here'
  ref 'Some reference', url: 'http://link.to.some.documentation.com'
  describe http((url)) do
    its('http_method') { should cmp 'GET' }
  end
end
