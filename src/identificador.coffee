bc = module.exports = () ->

bc.calcular = (num) ->
  if num == null  || num > 31 || isNaN(num)
    return null
  todos = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
  return todos.substring(num-1, num)

bc.converter = (dhm) ->
  dd = dhm.substring(0,2)
  mm = dhm.substring(3,5)
  seculo = dhm.substring(7,8)
  yy = dhm.substring(8,10)
  hh = dhm.substring(11,13)
  mi = dhm.substring(14,16)

  if seculo == '1'
    sec = 'Z'
  else
    sec = 'Y'
  ret = sec + yy + bc.calcular(mm) + bc.calcular(dd) + bc.calcular(hh) + mi

  return ret

bc.hoje = () ->
  today = new Date
  dd = bc.esquerdear(today.getDate())
  #getMonth is an integer between 0 and 11, referring 0 to January
  mm = bc.esquerdear(today.getMonth() + 1)
  yyyy = today.getFullYear()
  hh = bc.esquerdear(today.getHours())
  mi = bc.esquerdear(today.getMinutes())
  today = "#{dd}/#{mm}/#{yyyy} #{hh}:#{mi}"
  return bc.converter today

# poderia mostrar o numero e cada caracter correspondentem para deixar estático

bc.esquerdear = (num) ->
  if num < 10
    return '0' + num
  return num

bc.show = (msg) ->
  console.log(msg)


