class Company < ApplicationRecord
  enum company_type: [:startup, :medium_sized, :large]
  scope :by_name, ->(filter){ 
    where("name LIKE ?", "%#{filter.to_s}%")
  }

  scope :filter_by_name_and_type, lambda { |name, type = nil|
    if type.nil?
      by_name(name)
    else
      by_name(name).send(type.to_sym)
    end
  }
  
end
