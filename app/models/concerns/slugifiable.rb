module Slugifiable

    def self.included base
        base.send :include, InstanceMethods
        base.extend ClassMethods
    end

    module InstanceMethods
      def slug
        self.name.gsub(" ", "-").downcase
      end
    end
  
    module ClassMethods
      def find_by_slug(slug)
        checked_slug = slug.gsub(" ", "-").downcase
        self.all.find{ |instance| instance.slug == checked_slug }
      end
    end
  end