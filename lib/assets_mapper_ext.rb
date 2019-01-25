module AssetsMapper
  def self.check_string(input)
    if input.match('([0-9]+.+|[ \W]*)')
      msg = "Asset name: #{input} violates Swift variable naming rules!!\n" +
      "Please consider to change it"
      raise msg
    else
      input
    end
  end
end