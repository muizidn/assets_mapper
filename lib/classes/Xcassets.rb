require 'colorize'
require 'classes/Enum'
require 'assets_mapper_ext'

module AssetsMapper
  class Xcassets
    def initialize(filepath, ignore_folder, allow_modification)
      @filepath = filepath
      @ignore_folder = ignore_folder
      @allow_modification
      @xcassets_name = ""
    end

    def self.write(string, file)
      puts "Writing in " + file.yellow
      File.open(file, 'w') { |file| file.write(string) }
    end
  end

  class IgnoreFolderXcassets < Xcassets
    def initialize(filepath, allow_modification)
      super(filepath, false, allow_modification)
      imagesets = Dir.glob("#{@filepath}/**/*.imageset")
        .map{|s| s.split('/')}
        .flat_map{|x| x}
        .select {|x|x.include?'.imageset'}
        .sort

      @xcassets_name = @filepath.match('[\.\/.]*(.*).xcassets').captures[0]
      @enum = Enum.new(@xcassets_name)
      imagesets.each do |i|
        asset_name = i.match('(.*).imageset').captures[0]
        image_name = AssetsMapper.check_string(
          asset_name,
          allow_modification
        )

        string = Enum.static_let(image_name, asset_name)
        @enum.add_children(string)
      end
    end

    def enum
      @enum
    end
  end
end