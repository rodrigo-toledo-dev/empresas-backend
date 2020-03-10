require 'rails_helper'

RSpec.describe Company, type: :model do
  before(:context) do
    10.times.each do |t|
      company = Company.create(name: "Company startup #{t}")
      company.startup!
      company = Company.create(name: "Company medium size #{t}")
      company.medium_sized!
      company = Company.create(name: "Company large #{t}")
      company.large!
    end
  end
  describe "company filter by type" do
    context "when company have a valid type" do
      it "returns startups collection" do
        expect(Company.startup).to  have_at_least(5).items
      end

      it "returns exact medium collection" do
        expect(Company.medium_sized).to  have(10).items
      end

      it "returns invalid large collection" do
        expect(Company.large).not_to have(11).items
      end
    end
  end

  describe "company filter by name" do
    before(:all) do
      company = Company.create(name: "Filo")
      company.medium_sized!

      company = Company.create(name: "Filhotes")
      company.startup!

      company = Company.create(name: "Coca-cola")
      company.large!
    end

    context "when company find by name have parameter" do
      it "returns exaclty companies by part of name" do
        expect(Company.by_name("Fil")).to  have(2).items
      end

      it "returns exact one item" do
        expect(Company.by_name("Filhotes")).to  have(1).items
      end

      it "returns empty collection when invalid name is passed" do
        expect(Company.by_name("invalid")).to be_empty
      end

      it "returns all records collection" do
        expect(Company.by_name("o")).to have(33).items
      end
    end
  end


  describe "company filter by name and type" do
    context "when company find by valid name and without type" do
      it "returns exaclty companies by name" do
        expect(Company.by_name("Coca-cola")).to  have(1).items
      end
    end

    context "when company find by valid name and with type" do
      it "returns empty results" do
        expect(Company.startup.by_name("Coca-cola")).to  be_empty
      end
    end

    context "when company find by valid by part of name and with valid type" do
      it "returns positive results" do
        expect(Company.large.by_name("Co")).to  have_at_least(8).items
      end
    end
  end

  
end
