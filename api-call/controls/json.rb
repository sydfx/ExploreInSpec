# encoding: utf-8
# copyright: 2018, The Authors

title 'REST API call learning'

# Attributes here.
url = attribute('target.url', description: 'The targeted URL')
country = attribute('country.code', description: 'The expected country')
encoding = attribute('encoding', description: 'The expected encoding')
ip_forwarded = attribute('ip.forwarded', description: 'The expected forwarded IP')
hostname = attribute('target.host', description: 'The expected hostname')
encoded_language = attribute('encoded.language', description: 'The expected encoded language')
# Controls here.
control 'json-01' do
impact 1.0
title 'JSON configuration validation'
desc 'Insert some description here'
ref 'Some reference', url: 'http://link.to.some.documentation.com'
resp = http(url, method: 'GET').body
describe json(content: resp) do
  its('country_code') { should eq (country) }
end
resp = http(url, method: 'GET').body
describe json(content: resp) do
  its('encoding') { should eq (encoding) }
end
resp = http(url, method: 'GET').body
describe json(content: resp) do
  its('forwarded') { should eq (ip_forwarded) }
end
resp = http(url, method: 'GET').body
describe json(content: resp) do
  its('host') { should eq (hostname) }
end
resp = http(url, method: 'GET').body
describe json(content: resp) do
  its('lang') { should eq (encoded_language) }
 end
end
