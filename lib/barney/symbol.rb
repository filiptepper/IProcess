require 'delegate'

#
# Earlier versions of Ruby (<1.9) don't implement Symbol#<=>.
# I want to avoid monkey patching Symbol on 1.8, and so: Barney::Symbol.
#
# I hope when 1.8 becomes obsolete I can remove this file because it creates
# one object for every Symbol, although there is a cache so two objects are 
# never created for one Symbol.
#
class Barney::Symbol < Delegator
 
  class << self
    def find var
      cache.find { |item|
        item == var
      }
    end

    def cache 
      @cache = @cache || []
    end

    def clear_cache
      @cache.clear
    end
  end

  def initialize symbol
    @symbol = symbol.to_sym
    super(@symbol)
    Barney::Symbol.cache.push(self)
  end

  def __getobj__
    @symbol
  end

  def __setobj__ obj
    @symbol = obj
  end

  def eql? other
    @symbol.eql?(other.__getobj__)
  end

  def hash
    @symbol.hash
  end

  # < Ruby 1.9 cannot compare Symbols.
  def <=>(other)
    return unless other.kind_of? Barney::Symbol
    to_s <=> other.to_s
  end

end