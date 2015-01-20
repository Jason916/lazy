require 'lol/errors'
module Lol
  class Navigator

    def initialize config
      @config = config.clone
      defined_browser?   #是否设置浏览器
      @browser = start_browser  #启动浏览器
      raise "can not start browser, maybe you need to download the driver for #{@config.browser}" if @browser.nil?
      define_goto_methods  #动态生成goto_xx_page方法
    end

    def defined_browser?
      if !@config.respond_to?(:browser) || @config.browser.nil?
        raise IncorrectConfigFileError, 'you should define browser in your config file'
      end #if
    end

    def start_browser
      br=Watir::Browser.new @config.browser.to_sym
      br.window.maximize
      br
    end

    def save_screenshot path
      @browser.screenshot.save path
      true
    end

    def define_goto_methods
      p Module.constants.grep(/Page$/) if $DEBUG
      Module.constants.grep(/Page$/).each do |page_klass|
        if lol_page?(page_klass)
          # define_method is private,so using send
          self.class.send :define_method, "goto_#{page_klass.to_s.underscore}" do
          page = Module.const_get(page_klass).new(@browser)
          page.goto  #return string
          page
        end #define_method
          puts "defined goto_#{page_klass.to_s.underscore}" if $DEBUG
        end #if
      end #each
    end

    def valid_page_klass? klass
      # skip Lol::Page
      return false if klass.eql?(:Page)
      Module.const_get(klass) < Lol::Page
    end
    alias_method :lol_page?, :valid_page_klass?

    def method_missing(m, *args, &blk)
      if @browser.respond_to? m
        @browser.send(m, *args, &blk)
      else
        super
      end #if
    end

  end

end #Lol
