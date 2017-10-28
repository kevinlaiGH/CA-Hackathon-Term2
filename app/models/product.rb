class Product < ApplicationRecord

  mount_uploader :photo, ProductPhotoUploader

  validates_numericality_of :price, :only_integer => true, :greater_than_or_equal_to => 1

  has_many :reviews
  has_many :cart_items # just the 'relationships'
  # belongs_to :category


    filterrific(
      default_filter_params: { sorted_by: 'created_at_desc' },
      available_filters: [
        :sorted_by,
        :search_query,
        # :with_country_id,
        :with_created_at_gte
      ]
    )

    scope :search_query, lambda { |query|
      return nil  if query.blank?
      terms = query.downcase.split(/\s+/)
      # replace "*" with "%" for wildcard searches,
      # append '%', remove duplicate '%'s
      terms = terms.map { |e|
        (e.gsub('*', '%') + '%').gsub(/%+/, '%')
      }
      # configure number of OR conditions for provision
      # of interpolation arguments. Adjust this if you
      # change the number of OR conditions.
      num_or_conds = 2
      where(
        terms.map { |term|
          "(LOWER(discription) LIKE ?)"
        }.join(' AND '),
        *terms.map { |e| [e] * num_or_conds }.flatten
      )
    }
    scope :sorted_by, lambda { |sort_option|
      # extract the sort direction from the param value.
      direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
      case sort_option.to_s
      when /^created_at_/
        # Simple sort on the created_at column.
        # Make sure to include the table name to avoid ambiguous column names.
        # Joining on other tables is quite common in Filterrific, and almost
        # every ActiveRecord table has a 'created_at' column.
        order("products.created_at #{ direction }")
      when /^description_/
        # Simple sort on the name colums
        order("LOWER(products.description) #{ direction }")
      # when /^country_name_/
      #   # This sorts by a student's country name, so we need to include
      #   # the country. We can't use JOIN since not all students might have
      #   # a country.
      #   order("LOWER(countries.name) #{ direction }").includes(:country)
      else
        raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
      end
    }

    # This method provides select options for the `sorted_by` filter select input.
    # It is called in the controller as part of `initialize_filterrific`.
    def self.options_for_sorted_by
      [
        ['Name (a-z)', 'name_asc'],
        ['Registration date (newest first)', 'created_at_desc'],
        ['Registration date (oldest first)', 'created_at_asc'],
        ['Country (a-z)', 'country_name_asc']
      ]
    end

    # def self.search(search)
    #   where("price LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
    # end

end
