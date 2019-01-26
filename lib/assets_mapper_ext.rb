require 'colorize'

module AssetsMapper
  class AssetsMapper
    def self.check_string(input)
      if input.match('([0-9]+.+|[ \W]*)')
        error_msg = "Asset name: ".red + input.yellow + " violates Swift variable naming rules!!\n".red + \
        "Please consider to change it".red
        suggestion_msg = "If your want to allow #{"asset_mapper".green} to perform modification\n" \
        "You can set option --allow-modification"
        puts error_msg
        puts suggestion_msg
        abort
      else
        input
      end
    end
  end
end