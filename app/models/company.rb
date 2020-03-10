class Company < ApplicationRecord
  enum company_type: [:startup, :medium_sized, :large]
  scope :by_type, ->(filter) do
    case filter.to_s
    when "startup"
      startup
    when "medium_size"
      medium_size
    when "large"
      large
    else
      unscoped
    end
  end

  scope :by_name, ->(filter) do
    where("name LIKE ?", "%#{filter.to_s}%")
  end

  def self.filter(name, type)
    self.by_name(name).to_sql
  end
end
