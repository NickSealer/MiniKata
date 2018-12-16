# instancing class DrawTool
class DrawTool
  attr_accessor :h, :w

  def initialize(h, w)
    @width = w
    @height = h
    @canvas = []
  end

  def show_canvas
    puts @canvas
  end

  def create_canvas
    width_array = []
    @width.times do
      width_array << '-'
    end
    @height.times do
      height = width_array.join
      @canvas << height.to_s
    end
    end

  def create_horizontal_line(n, x1, x2)
    line_h = []
    length = @canvas[n].size.to_i
    length.times do
      line_h << '-'
    end
    while x1 - 1 <= x2 - 1
      line_h.insert(x1, 'x')
      line_h.pop
      x1 += 1
    end

    mini_canva = line_h.join
    @canvas.insert(n, mini_canva)
    @canvas.pop
  end

  def create_vertical_line(y1, y2)
    line_v = []
    length = @canvas[y1].size.to_i
    length.times do
      line_v << '-'
    end
    line_v.insert(y2, 'x')
    line_v.pop
    mini_canva = line_v.join
    @canvas.insert(y1, mini_canva)
    @canvas.pop
  end

  def looping_vertical_line
    puts 'Cree la linea vertical (Longitud, Posición, Desde)'
    n = gets.chomp.to_i
    y1 = gets.chomp.to_i
    y2 = gets.chomp.to_i
    n.times do
      create_vertical_line((y1 - 1), (y2 - 1))
      y1 += 1
    end
  end

  def create_square
    puts 'Dimensiones del rectangulo (Posición, Desde, Hasta, Altura)'
    n = gets.chomp.to_i
    x1 = gets.chomp.to_i
    x2 = gets.chomp.to_i
    h = gets.chomp.to_i
    create_horizontal_line((n - 1), (x1 - 1), (x2 - 1))
    create_horizontal_line(n, (x1 - 1), (x2 - 1))
    h -= 2
    h.times do
      clear_square(n, (x1 - 1), (x2 - 1))
      n += 1
    end
  end

  def clear_square(n, x1, x2)
    internal_square = []
    length = @canvas[n].size.to_i
    length.times do
      internal_square << '-'
    end
    internal_square.insert(x1, 'x')
    internal_square.pop
    while x1 + 1 < x2
      internal_square.insert(x1 + 1, ' ')
      internal_square.pop
      x1 += 1
    end
    internal_square.insert(x2, 'x')
    internal_square.pop

    mini_canva = internal_square.join
    @canvas.insert(n, mini_canva)
    @canvas.pop
  end
  # end of class
end
