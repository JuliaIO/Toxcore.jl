using Toxcore

type JuliaBot
    quit::Bool
    svg_file_bytes::Vector{Uint8}
end

function JuliaBot()
    JuliaBot(false, [])
end

bot = JuliaBot()

function OnToxFileChunkRequest(tox::Ptr{Tox}, friend_number::Uint32, file_number::Uint32, position::Uint64, chunk_length::Csize_t, user_data::Ptr{Void})
    global bot

    chunk_length = max(chunk_length, length(bot.svg_file_bytes)-position)
    data = bot.svg_file_bytes[position+1:position+chunk_length]

    if tox_file_send_chunk(tox, friend_number, file_number, position, data)
        println("File chunk send.")
    else
        println("Failed to send file chunk.") 
    end

    nothing
end

function OnToxFileRecv(tox::Ptr{Tox}, friend_number::Uint32, file_number::Uint32, kind::TOX_FILE_KIND, file_size::Uint64, filename::Ptr{Uint8}, filename_length::Csize_t, user_data::Ptr{Void})
    println("File Recv Callback")

    nothing
end

function OnToxFileRecvChunk(tox::Ptr{Tox}, friend_number::Uint32, file_number::Uint32, position::Uint64, data::Ptr{Uint8}, data_length::Csize_t, user_data::Ptr{Void})
    println("File Recv Chunk Callback")

    nothing
end

function OnToxFileRecvControl(tox::Ptr{Tox}, friend_number::Uint32, file_number::Uint32, control::TOX_FILE_CONTROL, user_data::Ptr{Void})
    if control == TOX_FILE_CONTROL_RESUME
        println("Resumming file transfer.")
    elseif control == TOX_FILE_CONTROL_PAUSE 
        println("File transfer paused.")
    else # TOX_FILE_CONTROL_CANCEL
        println("File transfer cancelled.")
    end

    nothing
end

function OnToxFriendRequest(tox::Ptr{Tox}, public_key::Ptr{Uint8}, message::Ptr{Uint8}, length::Csize_t, user_data::Ptr{Void})
    tox_friend_add_norequest(tox, ToxPublicKey(public_key))
    println("Accepted a friend request.")
    nothing
end

function OnToxFriendMessage(tox::Ptr{Tox}, friend_number::Uint32, typ::TOX_MESSAGE_TYPE, message::Ptr{Uint8}, message_length::Csize_t, user_data::Ptr{Void})
    global bot

    msg = utf8(pointer_to_array(message, message_length))
    println(msg)
   	
    if (msg == "/h")
        tox_friend_send_message(tox, friend_number, utf8("Hi, I'm julia!"))
        tox_friend_send_message(tox, friend_number, utf8("I know these commands:"))
        tox_friend_send_message(tox, friend_number, utf8(" '/h' - some help"))
        tox_friend_send_message(tox, friend_number, utf8(" '/f' - I send you a file"))
        tox_friend_send_message(tox, friend_number, utf8(" '/q' - I quit"))
    elseif (msg == "/q")
        tox_friend_send_message(tox, friend_number, utf8("Ok, I’ll quit!"))
        bot.quit = true
    elseif msg == "/f"
        #tox_friend_send_message(tox, friend_number, utf8("Ok dude, I'll send you a nice file!"))
        
        #if tox_file_send(tox, friend_number, TOX_FILE_KIND_DATA, length(bot.svg_file_bytes), utf8("julia.svg")) == typemax(Uint32)
        #    println("Attempt to send file failed.")
        #end
    else 
        tox_friend_send_message(tox, friend_number, utf8("Thanks for your message, dude!"))
    end

    nothing
end

function main()
    global bot

    info("This is the Julia Tox bot")

    # Load the file that the bot always sends
    julia_svg_file = open(Pkg.dir("Toxcore", "test/julia.svg"), "r") 
    bot.svg_file_bytes = readbytes(julia_svg_file)
    close(julia_svg_file)

    # Try to load the tox settings
    my_tox = 0

    try 
        savefile = open(Pkg.dir("Toxcore", "test", "bot_savedata.binary"), "r")
        savedata = readbytes(savefile)
        close(savefile)

        default_options = tox_options_default()

        options = Tox_Options(default_options.ipv6_enabled,
                            default_options.udp_enabled,
                            default_options.proxy_type,
                            default_options.proxy_host,
                            default_options.proxy_port,
                            default_options.start_port,
                            default_options.end_port,
                            default_options.tcp_port,
                            TOX_SAVEDATA_TYPE_TOX_SAVE,
                            pointer(savedata),
                            length(savedata) )

        my_tox = tox_new(options)

        info("Previous bot instance found. Reusing it!")
    catch e 
        println(e)
        #Create a default Tox
        my_tox = tox_new()

        info("Created new bot instance")
    end

    # register the callbacks 
    tox_callback_file_chunk_request(my_tox, OnToxFileChunkRequest, C_NULL)
    tox_callback_friend_request(my_tox, OnToxFriendRequest, C_NULL)
    tox_callback_friend_message(my_tox, OnToxFriendMessage, C_NULL)
    tox_callback_file_recv(my_tox, OnToxFileRecv, C_NULL)
    tox_callback_file_recv_chunk(my_tox, OnToxFileRecvChunk, C_NULL)
    tox_callback_file_recv_control(my_tox, OnToxFileRecvControl, C_NULL)

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

        if bot.quit
            break
        end
    end

    savedata = tox_get_savedata(my_tox)
    tox_kill(my_tox)

    savefile = open(Pkg.dir("Toxcore", "test", "bot_savedata.binary"), "w")
    write(savefile, savedata)
    close(savefile)

    info("Bot instance saved")
end

main()