#!/usr/bin/env rspec

require 'spec_helper'

describe 'logstash' do
  it { should contain_class 'logstash' }
end
