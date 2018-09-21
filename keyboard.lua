 -- Maps all keyboard keys to work with the key and keyp functions in TIC-80
function kb_init()
	keymap_chr={"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","0","1","2","3","4","5","6","7","8","9","-","=","[","]","\\",";","'","`",",",".","/","SPACE","TAB","ENTER","BACKSPACE","DELETE","INSERT","PAGEUP","PAGEDOWN","HOME","END","UP","DOWN","LEFT","RIGHT","CAPSLOCK","CONTROL","SHIFT","ALT"}
	keymap_ord={}
	for k,v in pairs(keymap_chr) do
		keymap_ord[v]=k
	end
end
-- This is a comment
-- Another comment!
function ord(c) 
	return keymap_ord[c]
end
function chr(o)
	return keymap_chr[o]
end