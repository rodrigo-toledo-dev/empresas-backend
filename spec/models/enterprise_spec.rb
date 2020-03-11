require 'rails_helper'

RSpec.describe Enterprise, type: :model do
  before(:context) do
    10.times.each do |t|
      enterprise = Enterprise.create(name: "Enterprise startup #{t}")
      enterprise.startup!
      enterprise = Enterprise.create(name: "Enterprise medium size #{t}")
      enterprise.medium_sized!
      enterprise = Enterprise.create(name: "Enterprise large #{t}")
      enterprise.large!
    end
  end
  describe "enterprise filter by type" do
    context "when enterprise have a valid type" do
      it "returns startups collection" do
        expect(Enterprise.startup).to  have_at_least(5).items
      end

      it "returns exact medium collection" do
        expect(Enterprise.medium_sized).to  have(10).items
      end

      it "returns invalid large collection" do
        expect(Enterprise.large).not_to have(11).items
      end
    end
  end

  describe "enterprise filter by name" do
    before(:all) do
      enterprise = Enterprise.create(name: "Filo")
      enterprise.medium_sized!

      enterprise = Enterprise.create(name: "Filhotes")
      enterprise.startup!

      enterprise = Enterprise.create(name: "Coca-cola")
      enterprise.large!
    end

    context "when enterprise find by name have parameter" do
      it "returns exaclty enterprises by part of name" do
        expect(Enterprise.by_name("Fil")).to  have(2).items
      end

      it "returns exact one item" do
        expect(Enterprise.by_name("Filhotes")).to  have(1).items
      end

      it "returns empty collection when invalid name is passed" do
        expect(Enterprise.by_name("invalid")).to be_empty
      end

      it "returns all records collection" do
        expect(Enterprise.by_name("a")).to have(21).items
      end
    end
  end


  describe "enterprise filter by name and type" do
    context "when enterprise find by valid name and without type" do
      it "returns exaclty enterprises by name" do
        expect(Enterprise.filter_by_name_and_type("Coca-cola")).to  have(1).items
      end
    end

    context "when enterprise find by valid name and with type" do
      it "returns empty results" do
        expect(Enterprise.filter_by_name_and_type("Coca-cola", "startup")).to  be_empty
      end
    end

    context "when enterprise find by valid by part of name and with valid type" do
      it "returns positive results" do
        expect(Enterprise.filter_by_name_and_type("Enter","large")).to  have_at_least(8).items
      end
    end
  end

  
end
