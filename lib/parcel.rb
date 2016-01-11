class Parcel
  def initialize(length, width, height, weight)
    @length = length
    @width = width
    @height = height
    @weight = weight

    @volume = @length * @width * @height / 1728 # 1728 = 12x12x12
  end

  def volume
    @volume
  end

  def cost_to_ship(speed, distance)
    volume_cost = @volume > 1 ? (@volume - 1) * 25 : 0
    weight_cost = @weight * 6.25
    distance_cost = distance > 800 ? distance - 800 : 0

    case speed
    when 2
      speed_cost = 800
    when 1
      speed_cost = 1500
    else
      speed_cost = 0
    end

    (volume_cost + weight_cost + distance_cost + speed_cost) / 100
  end
end
