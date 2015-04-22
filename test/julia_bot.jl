using Toxcore

function OnFriendRequest(tox::Ptr{Tox}, public_key::Ptr{Uint8}, message::Ptr{Uint8}, length::Csize_t, user_data::Ptr{Void})
    tox_friend_add_norequest(tox, ToxPublicKey(public_key))
    println("Accepted a friend request.")
    nothing
end

function OnFriendMessage(tox::Ptr{Tox}, friend_number::Uint32, typ::TOX_MESSAGE_TYPE, message::Ptr{Uint8}, length::Csize_t, user_data::Ptr{Void})
    global julia_bot_quit

    msg = utf8(pointer_to_array(message, length))
    println(msg)
   	
   
    if (msg == "/q")
        tox_friend_send_message(tox, friend_number, utf8("Ok, I’ll quit!"))
        julia_bot_quit = true
    else 
        tox_friend_send_message(tox, friend_number, utf8("Thanks for your message, dude!"))
    end

    nothing
end

julia_bot_quit = false

function main()
    info("This is the Julia Tox bot")

    # Try to load the tox settings
    my_tox = 0

    try 
        savefile = open(Pkg.dir("Toxcore", "test/bot_savedata.binary"), "r")
        savedata = readbytes(savefile)
        close(savefile)

        my_tox = tox_new(tox_options_default(), savedata)

        info("Previous bot instance found. Reusing it!")
    catch e 
        #Create a default Tox
        my_tox = tox_new()

        info("Created new bot instance")
    end

    # register the callbacks 
    tox_callback_friend_request(my_tox, OnFriendRequest, C_NULL)
    tox_callback_friend_message(my_tox, OnFriendMessage, C_NULL)

    # print own address
    info("Here is my address")
    println(convert(ASCIIString, tox_self_get_address(my_tox)))

    # define user details
	tox_self_set_name(my_tox, "Julia")
    tox_self_set_status_message(my_tox, "I am Julia, a high-level, high-performance dynamic programming language for technical computing.") 

    # bootstrap from the node defined above 
    if !tox_bootstrap(my_tox)
        println("Failed to bootstrap.")
        exit()
    end 

    # get the friend list
    friendlist = tox_self_get_friend_list(my_tox)
    info("I have $(length(friendlist)) friend(s)")

    for friend in friendlist
        println(tox_friend_get_name(my_tox, friend))
    end

    while true
        tox_iterate(my_tox)
        sleep(tox_iteration_interval(my_tox)/1000)

        if julia_bot_quit
            break
        end
    end

    savedata = tox_get_savedata(my_tox)
    tox_kill(my_tox)

    savefile = open(Pkg.dir("Toxcore", "test/bot_savedata.binary"), "w")
    write(savefile, savedata)
    close(savefile)

    info("Bot instance saved")
end

main()