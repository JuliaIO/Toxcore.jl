using Toxcore

const SLEEP_TIME = 50000
const BOOTSTRAP_ADDRESS = "78.225.128.39"
const BOOTSTRAP_PORT = 33445
const BOOTSTRAP_KEY = "7A2306BFBA665E5480AE59B31E116BE9C04DCEFE04D9FE25082316FA34B4DA0C"

const MY_NAME = "ImoutoBot"
const MY_STATUS_MESSAGE = "This is a message!"

global my_tox = 0

function MyFriendRequest(tox::Ptr{Tox}, public_key::Ptr{Uint8}, message::Ptr{Uint8}, length::Csize_t, user_data::Ptr{Void})
    msg = bytestring(message, length)
    println(msg)
    println(bytes2hex(pointer_to_array(public_key, Toxcore.TOX_PUBLIC_KEY_SIZE)))
    Toxcore.tox_friend_add_norequest(my_tox, public_key, C_NULL)
    nothing
end

function MyFriendMessage(tox::Ptr{Tox}, friend_number::Uint32, typ::Toxcore.TOX_MESSAGE_TYPE, messagee::Ptr{Uint8}, length::Csize_t, user_data::Ptr{Void})
    msg = bytestring(messagee, length)
    println(msg)
   nothing
end

const MyFriendRequestCallback = cfunction(MyFriendRequest, Void, (Ptr{Tox}, Ptr{Uint8}, Ptr{Uint8}, Csize_t, Ptr{Void}))
const MyFriendMessageCallback = cfunction(MyFriendMessage, Void, (Ptr{Tox}, Uint32, Toxcore.TOX_MESSAGE_TYPE, Ptr{Uint8}, Csize_t, Ptr{Void}))

function main()
    global my_tox
    bootstrap_pub_key = hex2bytes(BOOTSTRAP_KEY)
    #Create a default Tox */
    my_tox = Toxcore.tox_new(C_NULL, C_NULL, 0, C_NULL)

    #Register the callbacks */
    Toxcore.tox_callback_friend_request(my_tox, MyFriendRequestCallback, C_NULL)
    Toxcore.tox_callback_friend_message(my_tox, MyFriendMessageCallback, C_NULL)
    my_address = zeros(Uint8, Toxcore.TOX_ADDRESS_SIZE)
    Toxcore.tox_self_get_address(my_tox, my_address)
    println(uppercase(bytes2hex(my_address)))
    #Define or load some user details for the sake of it */
    Toxcore.tox_self_set_name(my_tox, MY_NAME, length(MY_NAME), C_NULL) # Sets the username
    Toxcore.tox_self_set_status_message(my_tox, MY_STATUS_MESSAGE, length(MY_STATUS_MESSAGE), C_NULL) # Sets the status message

    # Set the user status to TOX_USER_STATUS_NONE. Other possible values:
    # TOX_USER_STATUS_AWAY and TOX_USER_STATUS_BUSY 
    #tox_self_set_status(my_tox, 0)

    #Bootstrap from the node defined above */
    res = Toxcore.tox_bootstrap(my_tox, BOOTSTRAP_ADDRESS, BOOTSTRAP_PORT, bootstrap_pub_key, C_NULL)
    if !Bool(res)
        println("shiiiiiiiit")
    end 
    while true
        Toxcore.tox_iterate(my_tox); # will call the callback functions defined and registered
        sleep(Toxcore.tox_iteration_interval(my_tox)/1000) # sleep until the next iteration should happen
    end

    Toxcore.tox_kill(my_tox)
    println("success")
end

main()