require './huge'

puts 'Ingrese el alto del canvas'
h = gets.chomp.to_i
puts 'Ingrese el ancho del canvas'
w = gets.chomp.to_i
d = DrawTool.new(h, w)
d.create_canvas
d.show_canvas

 puts 'Dibujar linea horizontal (Posición, Desde, Hasta)'
 n = gets.chomp.to_i
 x1 = gets.chomp.to_i
 x2 = gets.chomp.to_i
 d.create_horizontal_line((n - 1), (x1 - 1), (x2 - 1))
 d.show_canvas

 d.looping_vertical_line
 d.show_canvas
 
d.create_square
d.show_canvas
