# BadgerBadger is a DSL for defining and awarding badges.
module BadgerBadger
  class << self
    # An array of all BadgeDef objects
    attr_accessor :badges
    # The award callback proc
    attr_accessor :award
    # The list callback proc
    attr_accessor :list
  end
  @badges = []

  # Check for new badges on target, and run the "award" callback. Optionally pass one or more groups.
  def self.check_for_badges!(target, *groups)
    each(*groups) do |badge|
      badge.award! target if badge.award? target
    end
  end

  # Iterates through each BadgeDev and yields it to a block. Optionally pass one or more groups.
  def self.each(*groups, &block)
    if groups.any?
      groups.map! &:to_sym
      @badges.each { |badge| block.call(badge) if (badge.group && groups).any? }
    else
      @badges.each &block
    end
  end

  # Find a badge by it's symbol name
  def self.find(name)
    @badges.detect { |badge| badge.to_sym == name.to_sym } or raise BadgeNotFoundException
  end

  # Configure BadgerBadger with a block
  def self.config(&block)
    Loader.class_eval { class_eval &block }
  end

  # BadgeDef not found exception
  BadgeNotFoundException = Class.new(StandardError)
end
