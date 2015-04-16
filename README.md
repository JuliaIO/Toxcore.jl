# Toxcore

[![Build Status](https://travis-ci.org/SimonDanisch/Toxcore.jl.svg?branch=master)](https://travis-ci.org/SimonDanisch/Toxcore.jl)

Attempt to make Toxcore accessible in Julia. Toxcore, ToxAv and ToxDNS have been wrapped.

## Wrapping method
C-enums have been wrapped as global consts like this.
```
typealias TOX_USER_STATUS Uint32
const TOX_USER_STATUS_NONE = @compat (UInt32)(0)
const TOX_USER_STATUS_AWAY = @compat (UInt32)(1)
const TOX_USER_STATUS_BUSY = @compat (UInt32)(2)
```
They are being exported. Functions have been wrapped like this:
```
function tox_self_set_status(tox,user_status)
    ccall((:tox_self_set_status,libtoxcore),Void,(Ptr{Tox},TOX_USER_STATUS),tox,user_status)
end
```
They are NOT being exported. Instead they can be found within Toxcore.CInterface. The idea is to easily identify C-calls in the code.

```
Toxcore.CInterface.tox_self_set_status_message(tox, message, length(message), C_NULL)
```
Tox_Options has been wrapped like this.
```
immutable Tox_Options
    ipv6_enabled::Bool
    udp_enabled::Bool
    proxy_type::TOX_PROXY_TYPE
    proxy_host::Ptr{Cchar}
    proxy_port::Uint16
    start_port::Uint16
    end_port::Uint16
end
```
## API
Appart from the basic wrapping the attempt is to create a Julia-style Toxcore API. This is independent from the concrete wrapping implementation used. The idea is to keep function names for a first Toxcore-close API, but to overcome any C-specific limitations. This includes altering return values and arguments.

1. Replace (..., const uint8_t * pointer_to_some_array, size_t array_length, ...) by (..., data::Fitting_type, ...) 
2. => Don't need to expose some functions - like tox_friend_get_name_size
2. Messages etc. are UTF8String
3. Have some new types: ToxPublicKey, ToxAddress (do we really want this & more to come?)

Unfortunately this requires some work and we are not so far yet. How it is intended to work and anything that works can be seen from the super-awesome [chat-bot example](https://github.com/JuliaIO/Toxcore.jl/blob/master/test/julia_bot.jl).

However here is how far we are for Toxcore (av&dns nothing done yet)

### DONE
```
tox_options_default() returns default Tox_Options struct

Tox *   tox_new()

Tox * 	tox_new(options::Tox_Options, savedata::Vector{Uint8})

void 	tox_kill (Tox *tox)

tox_get_savedata (tox::Ptr{Tox})	returns an array of Unit8

tox_bootstrap(tox::Ptr{Tox}, host::ASCIIString, port, public_key::ToxPublicKey)

uint32_t 	tox_iteration_interval (tox::Ptr{Tox})

void 	tox_iterate (tox::Ptr{Tox})

tox_self_get_friend_list(tox::Ptr{Tox}) - returns an array with the friend list

tox_friend_get_name(tox::Ptr{Tox}, friend_number::Integer) 	returns "" if the friend does not exist. utf8 encoding expected
```

### TODO 
```
TOX_CONNECTION 	tox_self_get_connection_status (const Tox *tox)
 
void 	tox_callback_self_connection_status (Tox *tox, tox_self_connection_status_cb *function, void *user_data)
 
void 	tox_self_get_address (const Tox *tox, uint8_t *address)
 
void 	tox_self_set_nospam (Tox *tox, uint32_t nospam)
 
uint32_t 	tox_self_get_nospam (const Tox *tox)
 
void 	tox_self_get_public_key (const Tox *tox, uint8_t *public_key)
 
void 	tox_self_get_secret_key (const Tox *tox, uint8_t *secret_key)
 
bool 	tox_self_set_name (Tox *tox, const uint8_t *name, size_t length, TOX_ERR_SET_INFO *error)
 
size_t 	tox_self_get_name_size (const Tox *tox)
 
void 	tox_self_get_name (const Tox *tox, uint8_t *name)
 
bool 	tox_self_set_status_message (Tox *tox, const uint8_t *status, size_t length, TOX_ERR_SET_INFO *error)
 
size_t 	tox_self_get_status_message_size (const Tox *tox)
 
void 	tox_self_get_status_message (const Tox *tox, uint8_t *status)
 
void 	tox_self_set_status (Tox *tox, TOX_USER_STATUS user_status)
 
TOX_USER_STATUS 	tox_self_get_status (const Tox *tox)





 
uint32_t 	tox_friend_add (Tox *tox, const uint8_t *address, const uint8_t *message, size_t length, TOX_ERR_FRIEND_ADD *error)
 
uint32_t 	tox_friend_add_norequest (Tox *tox, const uint8_t *public_key, TOX_ERR_FRIEND_ADD *error)
 
bool 	tox_friend_delete (Tox *tox, uint32_t friend_number, TOX_ERR_FRIEND_DELETE *error)
 
uint32_t 	tox_friend_by_public_key (const Tox *tox, const uint8_t *public_key, TOX_ERR_FRIEND_BY_PUBLIC_KEY *error)
 
bool 	tox_friend_get_public_key (const Tox *tox, uint32_t friend_number, uint8_t *public_key, TOX_ERR_FRIEND_GET_PUBLIC_KEY *error)
 
bool 	tox_friend_exists (const Tox *tox, uint32_t friend_number)
 
uint64_t 	tox_friend_get_last_online (const Tox *tox, uint32_t friend_number, TOX_ERR_FRIEND_GET_LAST_ONLINE *error)
 

 void 	tox_callback_friend_name (Tox *tox, tox_friend_name_cb *function, void *user_data)
 
size_t 	tox_friend_get_status_message_size (const Tox *tox, uint32_t friend_number, TOX_ERR_FRIEND_QUERY *error)
 
bool 	tox_friend_get_status_message (const Tox *tox, uint32_t friend_number, uint8_t *message, TOX_ERR_FRIEND_QUERY *error)
 
void 	tox_callback_friend_status_message (Tox *tox, tox_friend_status_message_cb *function, void *user_data)
 
TOX_USER_STATUS 	tox_friend_get_status (const Tox *tox, uint32_t friend_number, TOX_ERR_FRIEND_QUERY *error)
 
void 	tox_callback_friend_status (Tox *tox, tox_friend_status_cb *function, void *user_data)
 
TOX_CONNECTION 	tox_friend_get_connection_status (const Tox *tox, uint32_t friend_number, TOX_ERR_FRIEND_QUERY *error)
 
void 	tox_callback_friend_connection_status (Tox *tox, tox_friend_connection_status_cb *function, void *user_data)
 
bool 	tox_friend_get_typing (const Tox *tox, uint32_t friend_number, TOX_ERR_FRIEND_QUERY *error)
 
void 	tox_callback_friend_typing (Tox *tox, tox_friend_typing_cb *function, void *user_data)
 
bool 	tox_self_set_typing (Tox *tox, uint32_t friend_number, bool is_typing, TOX_ERR_SET_TYPING *error)
 
uint32_t 	tox_friend_send_message (Tox *tox, uint32_t friend_number, TOX_MESSAGE_TYPE type, const uint8_t *message, size_t length, TOX_ERR_FRIEND_SEND_MESSAGE *error)
 
void 	tox_callback_friend_read_receipt (Tox *tox, tox_friend_read_receipt_cb *function, void *user_data)
 
void 	tox_callback_friend_request (Tox *tox, tox_friend_request_cb *function, void *user_data)
 
void 	tox_callback_friend_message (Tox *tox, tox_friend_message_cb *function, void *user_data)
 
bool 	tox_hash (uint8_t *hash, const uint8_t *data, size_t length)
 




bool 	tox_file_control (Tox *tox, uint32_t friend_number, uint32_t file_number, TOX_FILE_CONTROL control, TOX_ERR_FILE_CONTROL *error)
 
void 	tox_callback_file_recv_control (Tox *tox, tox_file_recv_control_cb *function, void *user_data)
 
bool 	tox_file_seek (Tox *tox, uint32_t friend_number, uint32_t file_number, uint64_t position, TOX_ERR_FILE_SEEK *error)
 
bool 	tox_file_get_file_id (const Tox *tox, uint32_t friend_number, uint32_t file_number, uint8_t *file_id, TOX_ERR_FILE_GET *error)
 
uint32_t 	tox_file_send (Tox *tox, uint32_t friend_number, uint32_t kind, uint64_t file_size, const uint8_t *file_id, const uint8_t *filename, size_t filename_length, TOX_ERR_FILE_SEND *error)
 
bool 	tox_file_send_chunk (Tox *tox, uint32_t friend_number, uint32_t file_number, uint64_t position, const uint8_t *data, size_t length, TOX_ERR_FILE_SEND_CHUNK *error)
 
void 	tox_callback_file_chunk_request (Tox *tox, tox_file_chunk_request_cb *function, void *user_data)
 
void 	tox_callback_file_recv (Tox *tox, tox_file_recv_cb *function, void *user_data)
 
void 	tox_callback_file_recv_chunk (Tox *tox, tox_file_recv_chunk_cb *function, void *user_data)
 




bool 	tox_friend_send_lossy_packet (Tox *tox, uint32_t friend_number, const uint8_t *data, size_t length, TOX_ERR_FRIEND_CUSTOM_PACKET *error)
 
void 	tox_callback_friend_lossy_packet (Tox *tox, tox_friend_lossy_packet_cb *function, void *user_data)
 
bool 	tox_friend_send_lossless_packet (Tox *tox, uint32_t friend_number, const uint8_t *data, size_t length, TOX_ERR_FRIEND_CUSTOM_PACKET *error)
 
void 	tox_callback_friend_lossless_packet (Tox *tox, tox_friend_lossless_packet_cb *function, void *user_data)


 
void 	tox_self_get_dht_id (const Tox *tox, uint8_t *dht_id)
 
uint16_t 	tox_self_get_udp_port (const Tox *tox, TOX_ERR_GET_PORT *error)
 
uint16_t 	tox_self_get_tcp_port (const Tox *tox, TOX_ERR_GET_PORT *error)


 
void 	tox_callback_group_invite (Tox *tox, void(*function)(Tox *tox, int32_t, uint8_t, const uint8_t *, uint16_t, void *), void *userdata)
 
void 	tox_callback_group_message (Tox *tox, void(*function)(Tox *tox, int, int, const uint8_t *, uint16_t, void *), void *userdata)
 
void 	tox_callback_group_action (Tox *tox, void(*function)(Tox *tox, int, int, const uint8_t *, uint16_t, void *), void *userdata)
 
void 	tox_callback_group_title (Tox *tox, void(*function)(Tox *tox, int, int, const uint8_t *, uint8_t, void *), void *userdata)
 
void 	tox_callback_group_namelist_change (Tox *tox, void(*function)(Tox *tox, int, int, uint8_t, void *), void *userdata)
 
int 	tox_add_groupchat (Tox *tox)
 
int 	tox_del_groupchat (Tox *tox, int groupnumber)
 
int 	tox_group_peername (const Tox *tox, int groupnumber, int peernumber, uint8_t *name)
 
int 	tox_group_peer_pubkey (const Tox *tox, int groupnumber, int peernumber, uint8_t *public_key)
 
int 	tox_invite_friend (Tox *tox, int32_t friendnumber, int groupnumber)
 
int 	tox_join_groupchat (Tox *tox, int32_t friendnumber, const uint8_t *data, uint16_t length)
 
int 	tox_group_message_send (Tox *tox, int groupnumber, const uint8_t *message, uint16_t length)
 
int 	tox_group_action_send (Tox *tox, int groupnumber, const uint8_t *action, uint16_t length)
 
int 	tox_group_set_title (Tox *tox, int groupnumber, const uint8_t *title, uint8_t length)
 
int 	tox_group_get_title (Tox *tox, int groupnumber, uint8_t *title, uint32_t max_length)
 
unsigned int 	tox_group_peernumber_is_ours (const Tox *tox, int groupnumber, int peernumber)
 
int 	tox_group_number_peers (const Tox *tox, int groupnumber)
 
int 	tox_group_get_names (const Tox *tox, int groupnumber, uint8_t names[][TOX_MAX_NAME_LENGTH], uint16_t lengths[], uint16_t length)
 
uint32_t 	tox_count_chatlist (const Tox *tox)
 
uint32_t 	tox_get_chatlist (const Tox *tox, int32_t *out_list, uint32_t list_size)
 
int 	tox_group_get_type (const Tox *tox, int groupnumber)
```


## Not now
```
 bool 	tox_version_is_compatible (uint32_t major, uint32_t minor, uint32_t patch)

 bool 	tox_add_tcp_relay (Tox *tox, const char *host, uint16_t port, const uint8_t *public_key, TOX_ERR_BOOTSTRAP *error)
```

## Nothing to do 
```
tox_version_major

tox_version_minor

tox_version_patch
```


## Not needed
```
tox_options_new

tox_options_free

tox_get_savedata_size

tox_self_get_friend_list_size

tox_friend_get_name_size
```
