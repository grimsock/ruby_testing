class Car
  def beep
    p 'Beeeeeep!!!'
  end

  def lock
    raise NotImplementedError
  end

  def unlock
    raise NotImplementedError
  end

  def drive_to(destination)
    raise NotImplementedError
  end

  def fill_tank(amount)
    raise NotImplementedError
  end
end

class BlaCar < Car
  @@manufacturer = 'BlaCar AG'

  attr_reader :model, :color, :mileage

  def initialize(model, engine, color, key)
    @model = model
    @engine = engine
    @color = color
    @code = key.code
    @mileage = 0
    @locked = false
  end

  def lock(key)
    if code == @code
      @locked = true
    else
      p 'invlid key code!'
    end
  end

  def unlock(code)
    if code == @key.code
      @locked = false
    else
      p 'invlid key code!'
    end
  end

  def locked?
    @locked
  end
end

class Engine
  attr_reader :type, :capacity

  AVAILABLE_ENGINES = { petrol: ['1.6', '2.0'], diesel: ['1.8'] }

  def initialize(type, capacity)
    @type = validate_type(type)
    @capacity = validate_capacity(capacity)
  end

  private

  def validate_type(type)
    if AVAILABLE_ENGINES.keys.include? type
      type
    else
      raise "invalid engine type"
    end
  end

  def validate_capacity(capacity)
    if AVAILABLE_ENGINES[type].include? capacity
      capacity
    else
      raise "invalid capacity"
    end
  end
end

class Key
  attr_reader :code

  def initialize(code)
    @code = validate(code)
  end

  private

  def validate(code)
    length = code.to_s.length
    if length < 3 || length > 6
      raise ArgumentError
    else
      code
    end
  end
end
