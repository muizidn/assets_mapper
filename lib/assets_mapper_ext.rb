require 'colorize'

module AssetsMapper
  class AssetsMapper
    class << self
    def check_string(input, allow_modification)
      if allow_modification
        remove_spacing(
          add_prefix(
            titleize(
              remove_non_alphanumeric input
            )
          )
        )
      elsif input.match('([0-9]+.+|[ \W]*)')
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

    def remove_non_alphanumeric(input)
      input.downcase.gsub(/[^a-z0-9\s]/, '')
    end

    def titleize(input)
      input.split.each{|x| x.capitalize!}.join('')
    end

    def add_prefix(input)
      "k#{input}"
    end

    def remove_spacing(input)
      input.gsub(' ','')
    end
  end
  end
end