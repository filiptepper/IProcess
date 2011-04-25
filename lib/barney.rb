require 'barney/share' 

module Barney 

  VERSION = '0.10.0'
  @proxy  = Barney::Share.new

  class << self

    # Forward message to an instance of {Barney::Share Barney::Share}.
    #
    # @param [String, Symbol, #to_sym] Name       The method name.
    # @param [Object]                  Arguments  A variable amount of arguments. Optional.
    # @param [Proc]                    Block      A block. Optional.
    # @see Barney::Share Barney::Share.
    def method_missing meth, *args, &blk
      if @proxy.respond_to? meth
        @proxy.send meth, *args, &blk
      else
        super
      end
    end

    # Ask superclass or an instance of {Barney::Share Barney::Share} does it respond to _meth_.
    #
    # @param [String, Symbol, #to_sym] Name The method name.
    # @param [Boolean] Scope Pass true to extend scope to include private methods.
    # @return [Boolean] Return true if superclass or instance of {Barney::Share Barney::Share} responds to _meth_.
    def respond_to? meth, with_private = false
      super || @proxy.respond_to?(meth, with_private)
    end

  end

end
