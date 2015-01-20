require 'yaml'
require 'lol/errors'
require 'ostruct'

module Lol
  class Config
    attr_reader :content

    def initialize filepath
      @fp ||= filepath if valid?(filepath)
      File.open(@fp) {|handle| @hash_content = YAML.load(handle)}
      @content = OpenStruct.new(@hash_content)
    end

    def valid?(filepath)
      raise ConfigFileMissingError unless File.exists?(filepath)
      true
    end

  end
end #Lol
