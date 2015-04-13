macro toxfun(returntype, expr)
    funcname     = first(expr.args)
    funcname_sym = Expr(:quote, funcname)
    arguments    = expr.args[2:end]

    arg_names    = map(arg->arg.args[1], arguments)
    arg_types    = map(arg->arg.args[2], arguments)
    arg_types    = Expr(:tuple, arg_types...)

    esc(quote
        function $funcname($(arg_names...))
            ccall($(Libdl.dlsym(libtoxcore, funcname)), $returntype, $arg_types, $(arg_names...))
        end
    end)
end

@toxfun Ptr{Tox} tox_new(options::Ptr{Tox_Options}, data::Ptr{Uint8}, length::Csize_t, error::Ptr{TOX_ERR_NEW})
@toxfun Void     tox_callback_friend_request(tox::Ptr{Tox}, tox_friend_request_cb::Ptr{Void}, user_data::Ptr{Void})
@toxfun Void     tox_callback_friend_message(tox::Ptr{Tox}, tox_friend_message_cb::Ptr{Void}, user_data::Ptr{Void})

@toxfun Bool     tox_self_set_name(tox::Ptr{Tox}, name::Ptr{Uint8}, length::Csize_t, error::Ref{TOX_ERR_SET_INFO})
@toxfun Bool     tox_self_set_status_message(tox::Ptr{Tox}, status::Ptr{Uint8}, length::Csize_t, error::Ref{TOX_ERR_SET_INFO})
@toxfun Void     tox_self_set_status(tox::Ptr{Tox}, user_status::TOX_USER_STATUS)
@toxfun Bool     tox_bootstrap(tox::Ptr{Tox}, host::Ptr{Cchar}, port::Uint16, public_key::Ptr{Uint8}, error::Ref{TOX_ERR_BOOTSTRAP})
@toxfun Void     tox_iterate(tox::Ptr{Tox})
@toxfun Uint32   tox_iteration_interval(tox::Ptr{Tox})
@toxfun Void     tox_kill(tox::Ptr{Tox})

@toxfun Void    tox_self_get_address(tox::Ptr{Tox}, address::Ptr{Uint8})
export tox_self_get_address

@toxfun Uint32  tox_friend_add_norequest(tox::Ptr{Tox}, public_key::Ptr{Uint8}, error::Ref{TOX_ERR_FRIEND_ADD})
export tox_friend_add_norequest