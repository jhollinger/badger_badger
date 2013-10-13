module BadgerBadger
  # A badge definition
  class BadgeDef
    # The badge identifier
    attr_reader :to_sym

    # Get or set the title
    def title(new_title = nil)
      if new_title
        @title = new_title
        @to_sym = new_title.downcase.sub(/\s+/, '_').to_sym
      end
      @title.to_s
    end

    # Get or set the description
    def description(new_desc = nil)
      @description = new_desc if new_desc
      @description.to_s
    end
    alias_method :desc, :description

    # Get or set the conditions check block
    def conditions(&block)
      @conditions = block if block
      @conditions
    end
    alias_method :check, :conditions

    # Get or set the group(s)
    def group(*groups)
      @groups = groups if groups.any?
      @groups = [] if @groups.nil?
      @groups
    end

    # Test if it should be awarded to target
    def award?(target)
      conditions && !awarded?(target) && conditions.call(target)
    end

    # Call the award callback
    def award!(target)
      BadgerBadger.award.call(target, self)
    end

    # Check if it has already been awarded to target
    def awarded?(target)
      BadgerBadger.list.call(target).include? to_sym
    end
  end
end
