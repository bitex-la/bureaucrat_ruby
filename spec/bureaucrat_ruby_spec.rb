require "spec_helper"

describe BureaucratRuby do
  it "has a version number" do
    expect(BureaucratRuby::VERSION).not_to be nil
  end

  it "validates and explains a cbu" do
    cbu = BureaucratRuby::Cbu.create(id: "foo")
    cbu.errors[:base].should == ['InvalidCbuFormat']

    cbu = BureaucratRuby::Cbu.create(id: "0170035040000002373188")
    cbu.errors.should be_empty
    
    cbu.attributes.should == {
      "id"=>"0170035040000002373188",
      "type"=>"cbus",
      "meta"=>nil,
      "bank"=>"017",
      "branch"=>"0035",
      "bank_name"=>"BBVA Banco Francés S.A.",
      "account"=>"40000002373188"
    }
  end

  it "validates and explains cuit" do
    cuit = BureaucratRuby::Cuit.create(id: "foo")
    cuit.errors[:base].should == ['InvalidCuitFormat']

    cuit = BureaucratRuby::Cuit.create(id: "20319274228")
    cuit.errors.should be_empty
    
    cuit.attributes.should == {
      "id" => "20319274228",
      "type"=>"cuits",
      "meta"=>nil,
      "kind"=>"20",
      "person_id"=>"31927422",
    }
  end
end
