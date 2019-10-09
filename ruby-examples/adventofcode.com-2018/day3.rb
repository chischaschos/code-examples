claims = ARGF.read.split("\n")
sqs = Hash.new { |h, k| h[k] = [] }
ids = {}

claims.each do |c|
  id, _, edges, area = c.split
  sx, dy = edges.split(',')
  y = dy.chop.to_i
  sw, sh = area.split('x')
  x = sx.to_i
  w = sw.to_i
  h = sh.to_i

  (x...x + w).each do |xc|
    (y...y + h).each do |xy|
      sqs["#{xc},#{xy}"] << id
      ids[id] = true
    end
  end
end

t_sqs = 0

sqs.each do |_, ids_per_pos|
  if ids_per_pos.length > 1
    t_sqs += 1
    ids_per_pos.each { |id| ids[id] = false }
  end
end

puts t_sqs
puts ids.find { |_, v| v }.first
