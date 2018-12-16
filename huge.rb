# Instantiating class DrawTool
class DrawTool
  attr_accessor :h, :w

  # Canvas dimentions and canvas body
  def initialize(h, w)
    @width = w
    @height = h
    @canvas = []
  end

  # Method to print body canvas
  def show_canvas
    puts @canvas
  end

  # Method to generate canvas
  # create an array to fill it with - according @width length
  # the height create width_array according @height
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

  # Method to create a horizontal line
  # according the position take the value of @canvas and convert it to integer
  # according to the integer (@width) puts - again
  # according x1 and x2 values starts to insert an x depending on number and drop the last position
  # to conservate the same length from @canvas
  # join the - to makes look identical to @canvas
  # insert the new array into a variable
  # now insert the value on the same position indicate above and drop the last position to onservate the length
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

  # Method to create a vertical line
  # according the position take the value of @canvas and convert it to integer
  # according to the integer (@width) puts - again
  # according y1 and y2 values starts to insert an x depending on number and drop the last position
  # to conservate the same length from @canvas
  # join the - to makes look identical to @canvas
  # insert the new array into a variable
  # now insert the value on the same position indicate above and drop the last position to onservate the length
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

  # Method to looping the vertical line cause the current method create_vertical_line just take one position from @array
  # according with n (height) is goint to repeat the create_vertical_line method
  def looping_vertical_line
    puts 'Cree la linea vertical (Longitud, Posición, Desde):'
    n = gets.chomp.to_i
    y1 = gets.chomp.to_i
    y2 = gets.chomp.to_i
    n.times do
      create_vertical_line((y1 - 1), (y2 - 1))
      y1 += 1
    end
  end

  # Method to draw a square deppendig on coordinates
  # print upper and lower side filled of x
  # ask to user if want to an colored square or an empty one
  # call the respective method deppendig the option
  # iterate the right and left side by squares's h (height)
  def create_square
    puts 'Dimensiones del rectangulo (Posición, Desde, Hasta, Altura):'
    n = gets.chomp.to_i
    x1 = gets.chomp.to_i
    x2 = gets.chomp.to_i
    h = gets.chomp.to_i
    create_horizontal_line((n - 1), (x1 - 1), (x2 - 1))
    create_horizontal_line(n, (x1 - 1), (x2 - 1))
    h -= 2
    puts '¿Desea pintar el cuadro? Si = s / No = n'
    paint = gets.chomp.to_s
    if paint == 's'
      h.times do
        paint_square(n, (x1 - 1), (x2 - 1))
        n += 1
      end
    else
      h.times do
        clear_square(n, (x1 - 1), (x2 - 1))
        n += 1
      end
    end
  end

  # Method based on create_vertical_line, it do practiaclly the same job
  # first print the border, or an initial value with a x
  # then starts one position ahead of x and print a space till x2
  # now print the right border with a x
  # assign the values to mini_canva of type string
  # then insert the string into @canvas according the position n
  # drop the last position to conservate the original @canvas size
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

  # Method based on create_vertical_line too, it do practiaclly the same job
  # first print the border, or an initial value with a x
  # then starts one position ahead of x and print a c till x2
  # now print the right border with a x
  # assign the values to mini_canva of type string
  # then insert the string into @canvas according the position n
  # drop the last position to conservate the original @canvas size
  def paint_square(n, x1, x2)
    internal_square = []
    length = @canvas[n].size.to_i
    length.times do
      internal_square << '-'
    end
    internal_square.insert(x1, 'x')
    internal_square.pop
    while x1 + 1 < x2
      internal_square.insert(x1 + 1, 'c')
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
