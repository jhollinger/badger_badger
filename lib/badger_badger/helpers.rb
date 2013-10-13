module BadgerBadger
  # Helpers for the target class (e.g. User)
  module Helpers
    # Returns true if the target has the badge
    def has_badge?(badge_sym)
      BadgerBadger.list.call(self).include? badge_sym
    end
  end
end
