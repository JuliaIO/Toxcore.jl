using Toxcore, Reactive, GLWindow
println("ima load shit")
window = createwindow("toxclient", 10, 10)

const BOOTSTRAP_ADDRESS = "78.225.128.39"
const BOOTSTRAP_PORT    = 33445
const BOOTSTRAP_KEY     = "7A2306BFBA665E5480AE59B31E116BE9C04DCEFE04D9FE25082316FA34B4DA0C"

typealias FriendID Uint32



immutable FriendRequest
    message::UTF8String
    public_key::ToxPublicKey
end

immutable ToxData
    friends::Vector{FriendID}
    friendrequest::Input{Vector{FriendRequest}}
    messages::Dict{FriendID, Input{UTF8String}}
end
ToxData() = ToxData(Uint8[], Input(FriendRequest[]), Dict{FriendID, Signal{UTF8String}}())

const CLIENT_DICT = Dict{Ptr{Tox}, ToxData}()

Base.utf8(ptr::Ptr{Uint8}, bufflength::Integer) = utf8(pointer_to_array(ptr, bufflength))



function init()
    println("ima init shit")
    my_tox = tox_new()

    # register the callbacks 
    tox_callback_friend_request(my_tox, OnFriendRequest, C_NULL)
    tox_callback_friend_message(my_tox, OnFriendMessage, C_NULL)

    # print own address
    address = convert(ASCIIString, tox_self_get_address(my_tox))
    println(address)
    clipboard(address)
    println("key copied to clipboard")

    # define user details
    tox_self_set_name(my_tox, "Julia")
    tox_self_set_status_message(my_tox, "I am Julia, a high-level, high-performance dynamic programming language for technical computing.") 

    # bootstrap from the node defined above 
    if !tox_bootstrap(my_tox, BOOTSTRAP_ADDRESS, BOOTSTRAP_PORT, ToxPublicKey(BOOTSTRAP_KEY))
        println("Failed to bootstrap.")
        exit()
    end 
    println("init done!")

    my_tox
end


function OnFriendRequest(tox::Ptr{Tox}, public_key::Ptr{Uint8}, message::Ptr{Uint8}, len::Csize_t, user_data::Ptr{Void})
    push!(CLIENT_DICT[tox].friendrequest, [FriendRequest(utf8(message, len), ToxPublicKey(public_key))])
    nothing
end
function OnFriendMessage(tox::Ptr{Tox}, friend_number::FriendID, typ::TOX_MESSAGE_TYPE, message::Ptr{Uint8}, len::Csize_t, user_data::Ptr{Void})
    push!(CLIENT_DICT[tox].messages[friend_number], utf8(message, len))
    nothing
end


function main()
    #Create a default Tox
    my_tox = init()
    CLIENT_DICT[my_tox] = ToxData()
    

    iterate_signal = fpswhen(window.inputs[:open], 60)

    lift(CLIENT_DICT[my_tox].friendrequest) do request_list
        isempty(request_list) && return nothing
        current = pop!(request_list) # get current request
        friend = tox_friend_add_norequest(my_tox, current.public_key) #accept as friend
        push!(CLIENT_DICT[my_tox].friends, friend) # add to friends list

        friendmessages = Input(utf8(""))
        CLIENT_DICT[my_tox].messages[friend] = friendmessages# add to friends list
        println(current.message)
        #register message printout
        lift(println, friendmessages)
        nothing
    end


    while window.inputs[:open].value
        yield()
        tox_iterate(my_tox)
        GLFW.PollEvents()
        sleep(tox_iteration_interval(my_tox)/1000)
    end
    tox_kill(my_tox) 
    GLFW.Terminate()
end

main()