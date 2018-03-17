# encoding: utf-8
# copyright: 2018, The Authors

title 'REST API call learning'

# Attributes here.

# Plain test here.

# describe http('http://www.mtlinfographie.com') do
#   its('status') { should cmp 200 }
# end


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
  title 'Website content validation'
  desc 'Insert some description here'
  ref 'Some reference', url: 'http://link.to.some.documentation.com'
  describe http('http://www.mtlinfographie.com').headers do
  its('Content-Length') { should cmp 36039 }
  its('Content-Type') { should cmp 'text/html; charset=UTF-8' }
 end
end
control 'mtlinfo-03' do
  impact 1.0
  title 'Website http method validation'
  desc 'Insert some description here'
  ref 'Some reference', url: 'http://link.to.some.documentation.com'
  describe http('http://www.mtlinfographie.com') do
    its('http_method') { should cmp 'GET' }
  end
end
control 'mtlinfo-04' do
impact 1.0
title 'JSON configuration validation'
desc 'Insert some description here'
ref 'Some reference', url: 'http://link.to.some.documentation.com'
resp = http('https://s3.ca-central-1.amazonaws.com/inspecsyd/test.json', method: 'GET')
describe 'Country Code' do
  it 'should eq CA' do
    expect(json(content: resp.body)['country_code']).to(eq 'CA')
  end
 end
resp = http('https://s3.ca-central-1.amazonaws.com/inspecsyd/test.json', method: 'GET')
describe 'Encoding' do
  it 'should eq gzip' do
    expect(json(content: resp.body)['encoding']).to(eq 'gzip')
  end
end
resp = http('https://s3.ca-central-1.amazonaws.com/inspecsyd/test.json', method: 'GET')
describe 'IP forwarded' do
  it 'should eq 127.0.0.1' do
    expect(json(content: resp.body)['forwarded']).to(eq '127.0.0.1')
  end
end
resp = http('https://s3.ca-central-1.amazonaws.com/inspecsyd/test.json', method: 'GET')
describe 'Host from the target' do
  it 'should eq some.random.host.com.' do
    expect(json(content: resp.body)['host']).to(eq 'some.random.host.com.')
  end
end
resp = http('https://s3.ca-central-1.amazonaws.com/inspecsyd/test.json', method: 'GET')
describe 'Language returned from the target' do
  it 'should eq en-US,en;q=0.9' do
    expect(json(content: resp.body)['lang']).to(eq 'en-US,en;q=0.9')
  end
 end
end
