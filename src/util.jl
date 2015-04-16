
Base.utf8(ptr::Ptr{Uint8}, bufflength::Integer) = utf8(pointer_to_array(ptr, bufflength))

# TODO
function tox_split_message(message)
	return [message]
end



