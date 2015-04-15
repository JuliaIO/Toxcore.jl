function tox_dns3_new(server_public_key)
    ccall((:tox_dns3_new,libtoxcore),Ptr{Void},(Ptr{Uint8},),server_public_key)
end

function tox_dns3_kill(dns3_object)
    ccall((:tox_dns3_kill,libtoxcore),Void,(Ptr{Void},),dns3_object)
end

function tox_generate_dns3_string(dns3_object,string,string_max_len,request_id,name,name_len)
    ccall((:tox_generate_dns3_string,libtoxcore),Cint,(Ptr{Void},Ptr{Uint8},Uint16,Ptr{Uint32},Ptr{Uint8},Uint8),dns3_object,string,string_max_len,request_id,name,name_len)
end

function tox_decrypt_dns3_TXT(dns3_object,tox_id,id_record,id_record_len,request_id)
    ccall((:tox_decrypt_dns3_TXT,libtoxcore),Cint,(Ptr{Void},Ptr{Uint8},Ptr{Uint8},Uint32,Uint32),dns3_object,tox_id,id_record,id_record_len,request_id)
end