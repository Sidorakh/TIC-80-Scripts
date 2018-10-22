 -- Basic keyboard input script for TIC-80. Requires `keyboard.lua`
 dofile('keyoard.lua')
function kb_input_init()
 _kb_input=""
end
function kb_take_input()
for i=1,65 do
	if (keyp(i)) then
		if (i<48) then
				kb_input=kb_input..chr(i)
		elseif(i==48)then
				kb_input=kb_input.." "
		elseif(i==50)then
				kb_input=kb_input.."\n"
		elseif(i==51)then
				kb_input=string.sub(kb_input,1,-2)
		end
	end
end