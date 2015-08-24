#!/usr/bin/env rspec

require 'spec_helper'

describe 'logstash' do
  let (:facts) { {
<<<<<<< HEAD
      :osfamily => 'RedHat'
=======
      :osfamily => 'RedHat', :kernel => 'Linux', :operatingsystem => 'RedHat'
>>>>>>> abd591ded39bb820b0d5bbc79e7ceac875dab2cb
  } }

  it { should contain_class 'logstash' }
end
