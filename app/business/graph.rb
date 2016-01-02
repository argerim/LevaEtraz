class Graph

  INFINITY = Float::INFINITY

  def initialize(origin, destination, routes)    
    @start   = origin    
    @end     = destination
    @path    = []    
    @routes  =  routes
    dijkstra
  end

  def set_routes
    matrix = @routes.dup.collect { |x| x.take(2) }.flatten.compact.uniq
    @nodes = matrix.dup
    @routes.unshift([matrix.count])
  end

  def cost
    @r[@end]
  end

  def shortest_path
    road(@end)
    @path
  end

  def road(node)
    road(@f[node]) if @f[node] != 0
    @path.push(node)
  end

  def dijkstra
    setup
    min = pos_min = INFINITY

    @nodes.each do |i|
      @r[i] = @road[[@start, i]]
      @f[i] = @start if i != @start && @r[i] < INFINITY
    end

    @s[@start] = 1

    @nodes[0..@nodes.size - 2].each do
      min = INFINITY

      @nodes.each do |i|
        min, pos_min = @r[i], i if @s[i] == 0 && @r[i] < min        
      end

      @s[pos_min] = 1

      @nodes.each do|j|
        alt = @r[pos_min] + @road[[pos_min, j]]
        @r[j], @f[j]  = alt, pos_min if @s[j] == 0 && @r[j] > alt        
      end
    end
  end

  def setup
    n = set_routes.size - 1    
    @road, @r, @s, @f  = {}, {}, {}, {}
    
    @nodes.each do |i|
      @s[i] = @r[i] = @f[i] = 0      
    end

    @nodes.each do |i|
      @nodes.each do |j|
        @road[[i, j]] = i == j ? 0 : INFINITY        
      end
    end

    (1..n).each do |i|
      x, y = @routes[i][0], @routes[i][1]
      @road[[x, y]] = c = @routes[i][2]
    end
  end

end