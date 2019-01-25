E = AssetsMapper::Enum 

RSpec.describe E do
  let(:first) { E.new("First") }
  
  it "has name" do
    expect(first.name).to eq("First")
  end

  it "has children" do
    expect(first.children).to eq([])
  end

  it "children has Enum objects" do
    children0 = E.new("Children0")
    children1 = E.new("Children1")
    first.add_children(children0)
    first.add_children(children1)
    expect(first.children).to eq([children0, children1])
  end
  
  let(:s) { E.static_let("name", "Name") }
  let(:s_value) { "static let name = \"Name\"" }
  
  it "Enum.static_let return correct string" do  
    expect(s.include?(s_value)).to eq(true)
  end

  it "children has String objects" do
    first.add_children(s)
    expect(first.children.include?(s_value))
  end

  it "print correct Swift enum" do
    first_v0 = E.static_let("f_v0", "V0")
    first_v1 = E.static_let("f_v1", "V1")

    second = E.new("Second")
    second_v0 = E.static_let("s_v0", "V0")
    second_v1 = E.static_let("s_v1", "V1")
    second_v2 = E.static_let("s_v2", "V2")

    first.add_children(first_v0)
    first.add_children(first_v1)

    second.add_children(second_v0)
    second.add_children(second_v1)
    second.add_children(second_v2)

    first.add_children(second)

    test = %Q(enum First {
    static let f_v0 = "V0"
    static let f_v1 = "V1"
    enum Second {
        static let s_v0 = "V0"
        static let s_v1 = "V1"
        static let s_v2 = "V2"
    }
}
)
    expect(first.to_s).to eq(test)
  end
end