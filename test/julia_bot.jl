using Toxcore

const BOOTSTRAP_ADDRESS = "78.225.128.39"
const BOOTSTRAP_PORT = 33445
const BOOTSTRAP_KEY = "7A2306BFBA665E5480AE59B31E116BE9C04DCEFE04D9FE25082316FA34B4DA0C"

function OnFriendRequest(tox::Ptr{Tox}, public_key::Ptr{Uint8}, message::Ptr{Uint8}, length::Csize_t, user_data::Ptr{Void})
    tox_friend_add_norequest(tox, ToxPublicKey(public_key))
    println("Accepted a friend request.")
    nothing
end

function OnFriendMessage(tox::Ptr{Tox}, friend_number::Uint32, typ::TOX_MESSAGE_TYPE, message::Ptr{Uint8}, length::Csize_t, user_data::Ptr{Void})
    msg = utf8(pointer_to_array(message, length))
    println(msg)
   	

   	tox_friend_send_message(tox, friend_number, utf8("danke für die nachricht, ne!"))
    nothing
end

function main()
    #Create a default Tox
    my_tox = tox_new()

    # register the callbacks 
    tox_callback_friend_request(my_tox, OnFriendRequest, C_NULL)
    tox_callback_friend_message(my_tox, OnFriendMessage, C_NULL)

    # print own address
    println(convert(ASCIIString, tox_self_get_address(my_tox)))

    # define user details
	tox_self_set_name(my_tox, "Julia")
    tox_self_set_status_message(my_tox, "I am Julia, a high-level, high-performance dynamic programming language for technical computing.") 

    # bootstrap from the node defined above 
    if !tox_bootstrap(my_tox, BOOTSTRAP_ADDRESS, BOOTSTRAP_PORT, ToxPublicKey(BOOTSTRAP_KEY))
        println("Failed to bootstrap.")
        exit()
    end 

    while true
        tox_iterate(my_tox)
        sleep(tox_iteration_interval(my_tox)/1000)
    end

    tox_kill(my_tox)
end

main()