ENV.delete 'HTTP_PROXY' if ENV['HTTP_PROXY']
$:.unshift(File.expand_path('../../../lib',__FILE__))
require 'rubygems' #for ruby193
require 'erb'
require 'rspec'
#require 'psych'
require 'lol'

include Lol

#Lol::Initializer.new(File.expand_path(File.join('.')), 'ndb')
# load config files
# load all pages files
Lol::Initializer.new(File.expand_path('../../../',__FILE__))

RSpec.configure do |c|
  # c.filter_run_excluding slow:true
  # c.run_all_with_everything_filtered = true
  c.treat_symbols_as_metadata_keys_with_true_values = true
  #c.run_all_when_everything_filtered = true


  if $config.tags.nil?
    raise "you have not set tags in config.yml files"
  else
    tags= case $config.tags
        when String
            $config.tags.lazy_to_hash
        when Hash
            $config.tags.hash_to_sym
        else
            raise "config syntax is not suitable"
        end #case
    c.filter_run tags
  end

  #def test_data file
  #  content = ''
  #  file_path = File.expand_path(File.join('.', 'app', 'test_data', "#{file}.yml"))
  #  raise "Can not find #{file}.yml" unless File.exists?(file_path)
  #  File.open(file_path, 'r') do |handle|
  #    content = handle.read
  #  end
  #  Psych.load ERB.new(content).result(binding)
  #end

  c.before(:each) do
    $navi = Lol::Navigator.new $config
  end

  c.after(:each) do
    $navi.close
  end
  c.after(:suite) do
    exit
  end

end

