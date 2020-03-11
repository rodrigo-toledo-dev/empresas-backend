class Enterprise < ApplicationRecord
  enum enterprise_types: [:startup, :medium_sized, :large]
  scope :by_name, ->(name){ 
    where("name LIKE ?", "%#{name.to_s}%")
  }

  scope :filter_by_name_and_type, lambda { |name, enterprise_type = nil|
    if enterprise_type.nil?
      by_name(name)
    else
      by_name(name).send(enterprise_type.to_sym)
    end
  }
end
