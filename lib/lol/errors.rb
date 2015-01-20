module Lol
  class LolError < StandardError; end
  class ConfigFileMissingError < LolError; end
  class IncorrectConfigFileError < LolError; end
  class InvalidLolPageError < LolError; end
end #Lol
