defmodule Ev3.PerceptorDef do

	@units [:msecs, :secs, :mins, :hours]

	defstruct name: nil, senses: nil, retain: nil, span: nil, logic: nil

	def new(name: name,
					senses: senses,
					span: span,
					retain: retain,
					logic: logic) do
		%Ev3.PerceptorDef{name: name,
											senses: senses,
											span: convert_to_msecs(span),
											retain: convert_to_msecs(retain) ,
											logic: logic}
	end

	defp convert_to_msecs(nil), do: nil
	defp convert_to_msecs({count, unit}) do
		case unit do
			:msecs -> count
			:secs -> count * 1000
			:mins -> count * 1000 * 60
			:hours -> count * 1000 * 60 * 60
		end
	end
	
end