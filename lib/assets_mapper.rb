require "assets_mapper/version"
require "classes/Xcassets"

module AssetsMapper
  class AssetsMapper
    def create_assets_map(path_to_read, path_to_write, ignore_folder)
      if ignore_folder
        xcasset = IgnoreFolderXcassets.new(path_to_read)
        puts xcasset.to_s        
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
