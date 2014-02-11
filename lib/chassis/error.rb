module Chassis
  class << self
    def error(super_class_or_message = StandardError)
      if super_class_or_message.is_a? Class
        Class.new super_class_or_message do
          define_method :initialize do |*args|
            message = yield *args
            super message
          end
        end
      else
        Class.new StandardError do
          define_method :initialize do |*args|
            super super_class_or_message
          end
        end
      end
    end
  end
end
