require 'get_process_mem'

mem = GetProcessMem.new
puts mem.kb

GC.start
before_freed = GC.stat(:total_freed_objects)
before_allocated = GC.stat(:total_allocated_objects)

RETAINED = []
100_000.times do
  RETAINED << "a string"
end

GC.start
after_freed = GC.stat(:total_freed_objects)
after_allocated = GC.stat(:total_allocated_objects)

puts "Objects freed, allocated: #{after_freed - before_freed}, #{after_allocated - before_allocated}"
puts mem.kb
