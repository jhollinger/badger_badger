module BadgerBadger
  # The Badger Badger DSL
  module DSL
    # Define a badge
    def badge(title, &defs)
      badge = BadgeDef.new
      badge.title title
      badge.instance_eval &defs
      BadgerBadger.badges << badge
      badge
    end

    # Load badge definitions, or other configuration, from a file
    def use(defs_path)
      defs = File.read(defs_path)
      class_eval defs
    end

    # Define the callback block for when a badge is awarded
    def award(&callback)
      BadgerBadger.award = callback
    end

    # Define the "list" callback. It should return an array of awarded badge def symbols.
    def list(&callback)
      BadgerBadger.list = callback
    end
  end

  # Used internally to evaluate a file with the DSL
  class Loader
    extend DSL
  end
end
