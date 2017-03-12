require "attr_chain/version"

module AttrChain
    def self.included(base)
        base.extend(ClassMethods)
    end

    METHOD_BODY = <<__METHOD_END__
            def %s(value=nil)
                if value
                    @%s = value
                    self
                else
                    @%s
                end
            end
__METHOD_END__

    module ClassMethods
        def attr_chain(*args)
            args.each do |arg|
                self.class_eval( METHOD_BODY % [ arg, arg, arg ] )
            end
        end
    end
end
