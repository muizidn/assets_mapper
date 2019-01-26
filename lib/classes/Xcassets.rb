require 'classes/Enum'
require 'assets_mapper_ext'

module AssetsMapper
  class Xcassets
    def initialize(filepath, respect_folder)
      @filepath = filepath
      @respect_folder = respect_folder
      @enum = nil
      @xcassets_name = ""
    end
  end

  class IgnoreFolderXcassets < Xcassets
    def initialize(filepath)
      super(filepath, false)
      imagesets = Dir.glob("#{@filepath}/**/*.imageset")
        .map{|s| s.split('/')}
        .flat_map{|x| x}
        .select {|x|x.include?'.imageset'}
        .sort

      @xcassets_name = @filepath.match('/*(.*).xcassets').captures[0]
      @enum = Enum.new(@xcassets_name)
      imagesets.each do |i|
        image_name = AssetsMapper.check_string(
          i.match('(.*).imageset').captures[0]
        )
        string = Enum.static_let(image_name, image_name)
        @enum.add_children(string)
      end
      puts @enum.to_s
    end
  end
end