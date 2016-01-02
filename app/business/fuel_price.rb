class FuelPrice

  attr_accessor :distance, :value, :autonomy, :total

  def initialize(distance, value, autonomy)
    @value    = value
    @distance = distance
    @autonomy = autonomy
  end

  def value
    @value = @value.gsub(',', '.').to_f if @value.is_a?(String)    
  end

  def total
    @total = ((@distance.to_f / @autonomy.to_f) * value).round(2)
  end

end