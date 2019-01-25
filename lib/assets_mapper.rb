require "assets_mapper/version"

module AssetsMapper
  class AssetsMapper
    def create_assets_map(path_to_write)
      read_assets("Hello.xcassets #{path_to_write}")
    end
    private
    def read_assets(name)
      puts "Read assets with name : #{name}"
    end
  end
end
