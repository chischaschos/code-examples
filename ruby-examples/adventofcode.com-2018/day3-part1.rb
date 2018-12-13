claims = ARGF.read.split("\n")
sqs = Hash.new { |h, k| h[k] = [] }

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
    end
  end
end

matches = sqs.select { |_, v| v.length > 1 }

puts matches.size
