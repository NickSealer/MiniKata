require './huge'

puts 'Ingrese la dimensiones para crear el canvas'
puts 'Ingrese el alto del canvas:'
h = gets.chomp.to_i
puts 'Ingrese el ancho del canvas:'
w = gets.chomp.to_i
d = DrawTool.new(h, w)
d.create_canvas
d.show_canvas
puts "¿Qué desea dibujar?\n1. Linea Horizontal.\n2. Linea Verical.\n3. Ractangulo."
option = gets.chomp.to_i
case option
when 1
  puts 'Dibujar linea horizontal (Posición, Desde, Hasta):'
  n = gets.chomp.to_i
  x1 = gets.chomp.to_i
  x2 = gets.chomp.to_i
  d.create_horizontal_line((n - 1), (x1 - 1), (x2 - 1))
  d.show_canvas
when 2
  d.looping_vertical_line
  d.show_canvas
when 3
  d.create_square
  d.show_canvas
else
  puts 'No eligió nada, gracias.'
end
