using Toxcore

const SLEEP_TIME = 50000
const BOOTSTRAP_ADDRESS = "23.226.230.47"
const BOOTSTRAP_PORT = 33445
const BOOTSTRAP_KEY = b"A09162D68618E742FFBCA1C2C70385E6679604B2D80EA6E84AD0996A1AC8A074"

const MY_NAME = "ImoutoBot"
const MY_STATUS_MESSAGE = "This is a message!"



function MyFriendRequest(tox::Ptr{Tox}, public_key::Ptr{Uint8}, message::Ptr{Uint8}, length::Csize_t, user_data::Ptr{Void})
   nothing
end

function MyFriendMessage(tox::Ptr{Tox}, friend_number::Uint32, typ::TOX_MESSAGE_TYPE, messagee::Ptr{Uint8}, length::Csize_t, user_data::Ptr{Void})
   nothing
end

const MyFriendRequestCallback = cfunction(MyFriendRequest, Void, (Ptr{Tox}, Ptr{Uint8}, Ptr{Uint8}, Csize_t, Ptr{Void}))
const MyFriendMessageCallback = cfunction(MyFriendMessage, Void, (Ptr{Tox}, Uint32, TOX_MESSAGE_TYPE, Ptr{Uint8}, Csize_t, Ptr{Void}))



function main()
    bootstrap_pub_key = BOOTSTRAP_KEY
    #Create a default Tox */
    my_tox = tox_new(C_NULL, C_NULL, 0, C_NULL)

    #Register the callbacks */
    tox_callback_friend_request(my_tox, MyFriendRequestCallback, C_NULL)
    tox_callback_friend_message(my_tox, MyFriendMessageCallback, C_NULL)

    #Define or load some user details for the sake of it */
    tox_self_set_name(my_tox, MY_NAME, length(MY_NAME), C_NULL) # Sets the username
    tox_self_set_status_message(my_tox, MY_STATUS_MESSAGE, length(MY_STATUS_MESSAGE), C_NULL) # Sets the status message

    # Set the user status to TOX_USER_STATUS_NONE. Other possible values:
    # TOX_USER_STATUS_AWAY and TOX_USER_STATUS_BUSY 
    tox_self_set_status(my_tox, 0)

    #Bootstrap from the node defined above */
    tox_bootstrap(my_tox, BOOTSTRAP_ADDRESS, BOOTSTRAP_PORT, bootstrap_pub_key, C_NULL)
    for i=1:1000
        tox_iterate(my_tox); # will call the callback functions defined and registered
        sleep(tox_iteration_interval(my_tox) * 1000) # sleep until the next iteration should happen
    end

    tox_kill(my_tox)
end

main()