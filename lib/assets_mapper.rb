require "assets_mapper/version"
require "classes/Xcassets"

module AssetsMapper
  class AssetsMapper
    def initialize(ignore_folder, allow_modification)
      @ignore_folder = ignore_folder
      @allow_modification = allow_modification
    end
    def create_assets_map(path_to_read, path_to_write)
      if @ignore_folder
        xcasset = IgnoreFolderXcassets.new(path_to_read, @allow_modification)
        Xcassets.write(xcasset.enum.to_s, path_to_write)
      else
        puts "No"
      end
    end
    private
    def read_assets(name)
      puts "Read assets with name : #{name}"
    end
  end
end
