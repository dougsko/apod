<<<<<<< HEAD
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'apod'
=======
$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'apod'
require 'spec'
require 'spec/autorun'

Spec::Runner.configure do |config|
  
end
>>>>>>> 7cb01caa087c8e6d3c4c1f81531fa922e27caef2
