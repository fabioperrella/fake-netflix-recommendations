unless Rails.env.production?
  require 'tracer'
  Tracer.add_filter do  |event, file, line, id, binding, klass, *rest|
    file =~ /netflix/
  end
end