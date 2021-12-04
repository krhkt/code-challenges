
def convert_temp(temperature, input_scale:, output_scale: 'celsius')
  case input_scale
  when 'celsius'
      if output_scale == 'kelvin'
          temperature += 273.15
      elsif output_scale == 'fahrenheit'
          temperature = (temperature * 9.0 / 5.0) + 32
      end
  when 'fahrenheit'
      if output_scale == 'kelvin'
          temperature = ((temperature - 32) * 5.0 / 9.0) + 273.15
      elsif output_scale == 'celsius'
          temperature = (temperature - 32) * 5.0 / 9.0
      end
  when 'kelvin'
      if output_scale == 'celsius'
          temperature -= 273.15
      elsif output_scale == 'fahrenheit'
          temperature = ((temperature - 273.15) * 9.0 / 5.0) + 32
      end
  end
      
  temperature
end

# clever solution not by me
def convert_temp(temperature, input_scale:'celsius', output_scale:'celsius')
  bases = {'celsius' => 0.0, 'fahrenheit' => 32.0, 'kelvin' => 273.15}
  ratios = {'celsius' => 1.00, 'fahrenheit' => 9.0 / 5.0, 'kelvin' => 1.00}
  bases[output_scale] + (temperature.to_f - bases[input_scale]) * (ratios[output_scale] / ratios[input_scale])
end


# test area
puts convert_temp(0, input_scale: 'celsius', output_scale: 'kelvin')
puts convert_temp(0, input_scale: 'celsius', output_scale: 'fahrenheit')
puts convert_temp(0, input_scale: 'fahrenheit', output_scale: 'kelvin')
puts convert_temp(0, input_scale: 'fahrenheit', output_scale: 'celsius')
puts convert_temp(0, input_scale: 'kelvin', output_scale: 'fahrenheit')
puts convert_temp(0, input_scale: 'kelvin', output_scale: 'celsius')