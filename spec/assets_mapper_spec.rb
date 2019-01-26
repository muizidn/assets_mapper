RSpec.describe AssetsMapper do
  it "has a version number" do
    expect(AssetsMapper::VERSION).not_to be nil
  end

  it "must violate Swift variable naming rules" do
    strings = [ 
      "123-y&-",
      "2yx&",
      "yx &" 
    ]
    strings.each do |s|
      expect { AssetsMapper::AssetsMapper.check_string(s, false) }.to raise_error SystemExit
    end
  end
end
