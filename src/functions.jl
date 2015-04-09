@cfun Uint32 tox_version_major()
@cfun Uint32 tox_version_minor()
@cfun Uint32 tox_version_patch()

@cfun Bool tox_version_is_compatible(Uint32 major, Uint32 minor, Uint32 patch)
@cfun Void tox_options_default(Ptr{Tox_Options} options)
@cfun Ptr{Tox_Options} tox_options_new(Ptr{TOX_ERR_OPTIONS_NEW} error)
 
@cfun Void tox_options_free(Ptr{Tox_Options} options)

#Creates and initialises a new Tox instance with the options passed. More...
Tox * 	tox_new (Tox_Options *options, uint8_t *data, size_t length, TOX_ERR_NEW *error)
 	
Void 	tox_kill (Tox *tox)
 
size_t 	tox_get_savedata_size (Tox *tox)
 
Void 	tox_get_savedata (Tox *tox, uint8_t *data)
 
Bool 	tox_bootstrap (Tox *tox, char *host, uint16_t port, uint8_t *public_key, TOX_ERR_BOOTSTRAP *error)
 
Bool 	tox_add_tcp_relay (Tox *tox, char *host, uint16_t port, uint8_t *public_key, TOX_ERR_BOOTSTRAP *error)
 
TOX_CONNECTION 	tox_self_get_connection_status (Tox *tox)
 
Void 	tox_callback_self_connection_status (Tox *tox, tox_self_connection_status_cb *function, Void *user_data)
 
Uint32 	tox_iteration_interval (Tox *tox)
 
Void 	tox_iterate (Tox *tox)
 
Void 	tox_self_get_address (Tox *tox, uint8_t *address)
 
Void 	tox_self_set_nospam (Tox *tox, Uint32 nospam)
 
Uint32 	tox_self_get_nospam (Tox *tox)
 
Void 	tox_self_get_public_key (Tox *tox, uint8_t *public_key)
 
Void 	tox_self_get_secret_key (Tox *tox, uint8_t *secret_key)
 
Bool 	tox_self_set_name (Tox *tox, uint8_t *name, size_t length, TOX_ERR_SET_INFO *error)
 
size_t 	tox_self_get_name_size (Tox *tox)
 
Void 	tox_self_get_name (Tox *tox, uint8_t *name)
 
Bool 	tox_self_set_status_message (Tox *tox, uint8_t *status, size_t length, TOX_ERR_SET_INFO *error)
 
size_t 	tox_self_get_status_message_size (Tox *tox)
 
Void 	tox_self_get_status_message (Tox *tox, uint8_t *status)
 
Void 	tox_self_set_status (Tox *tox, TOX_USER_STATUS user_status)
 
TOX_USER_STATUS 	tox_self_get_status (Tox *tox)
 
Uint32 	tox_friend_add (Tox *tox, uint8_t *address, uint8_t *message, size_t length, TOX_ERR_FRIEND_ADD *error)
 
Uint32 	tox_friend_add_norequest (Tox *tox, uint8_t *public_key, TOX_ERR_FRIEND_ADD *error)
 
Bool 	tox_friend_delete (Tox *tox, Uint32 friend_number, TOX_ERR_FRIEND_DELETE *error)
 
Uint32 	tox_friend_by_public_key (Tox *tox, uint8_t *public_key, TOX_ERR_FRIEND_BY_PUBLIC_KEY *error)
 
Bool 	tox_friend_get_public_key (Tox *tox, Uint32 friend_number, uint8_t *public_key, TOX_ERR_FRIEND_GET_PUBLIC_KEY *error)
 
Bool 	tox_friend_exists (Tox *tox, Uint32 friend_number)
 
uint64_t 	tox_friend_get_last_online (Tox *tox, Uint32 friend_number, TOX_ERR_FRIEND_GET_LAST_ONLINE *error)
 
size_t 	tox_self_get_friend_list_size (Tox *tox)
 
Void 	tox_self_get_friend_list (Tox *tox, Uint32 *list)
 
size_t 	tox_friend_get_name_size (Tox *tox, Uint32 friend_number, TOX_ERR_FRIEND_QUERY *error)
 
Bool 	tox_friend_get_name (Tox *tox, Uint32 friend_number, uint8_t *name, TOX_ERR_FRIEND_QUERY *error)
 
Void 	tox_callback_friend_name (Tox *tox, tox_friend_name_cb *function, Void *user_data)
 
size_t 	tox_friend_get_status_message_size (Tox *tox, Uint32 friend_number, TOX_ERR_FRIEND_QUERY *error)
 
Bool 	tox_friend_get_status_message (Tox *tox, Uint32 friend_number, uint8_t *message, TOX_ERR_FRIEND_QUERY *error)
 
Void 	tox_callback_friend_status_message (Tox *tox, tox_friend_status_message_cb *function, Void *user_data)
 
TOX_USER_STATUS 	tox_friend_get_status (Tox *tox, Uint32 friend_number, TOX_ERR_FRIEND_QUERY *error)
 
Void 	tox_callback_friend_status (Tox *tox, tox_friend_status_cb *function, Void *user_data)
 
TOX_CONNECTION 	tox_friend_get_connection_status (Tox *tox, Uint32 friend_number, TOX_ERR_FRIEND_QUERY *error)
 
Void 	tox_callback_friend_connection_status (Tox *tox, tox_friend_connection_status_cb *function, Void *user_data)
 
Bool 	tox_friend_get_typing (Tox *tox, Uint32 friend_number, TOX_ERR_FRIEND_QUERY *error)
 
Void 	tox_callback_friend_typing (Tox *tox, tox_friend_typing_cb *function, Void *user_data)
 
Bool 	tox_self_set_typing (Tox *tox, Uint32 friend_number, Bool is_typing, TOX_ERR_SET_TYPING *error)
 
Uint32 	tox_friend_send_message (Tox *tox, Uint32 friend_number, TOX_MESSAGE_TYPE type, uint8_t *message, size_t length, TOX_ERR_FRIEND_SEND_MESSAGE *error)
 
Void 	tox_callback_friend_read_receipt (Tox *tox, tox_friend_read_receipt_cb *function, Void *user_data)
 
Void 	tox_callback_friend_request (Tox *tox, tox_friend_request_cb *function, Void *user_data)
 
Void 	tox_callback_friend_message (Tox *tox, tox_friend_message_cb *function, Void *user_data)
 
Bool 	tox_hash (uint8_t *hash, uint8_t *data, size_t length)
 
Bool 	tox_file_control (Tox *tox, Uint32 friend_number, Uint32 file_number, TOX_FILE_CONTROL control, TOX_ERR_FILE_CONTROL *error)
 
Void 	tox_callback_file_recv_control (Tox *tox, tox_file_recv_control_cb *function, Void *user_data)
 
Bool 	tox_file_seek (Tox *tox, Uint32 friend_number, Uint32 file_number, uint64_t position, TOX_ERR_FILE_SEEK *error)
 
Bool 	tox_file_get_file_id (Tox *tox, Uint32 friend_number, Uint32 file_number, uint8_t *file_id, TOX_ERR_FILE_GET *error)
 
Uint32 	tox_file_send (Tox *tox, Uint32 friend_number, Uint32 kind, uint64_t file_size, uint8_t *file_id, uint8_t *filename, size_t filename_length, TOX_ERR_FILE_SEND *error)
 
Bool 	tox_file_send_chunk (Tox *tox, Uint32 friend_number, Uint32 file_number, uint64_t position, uint8_t *data, size_t length, TOX_ERR_FILE_SEND_CHUNK *error)
 
Void 	tox_callback_file_chunk_request (Tox *tox, tox_file_chunk_request_cb *function, Void *user_data)
 
Void 	tox_callback_file_recv (Tox *tox, tox_file_recv_cb *function, Void *user_data)
 
Void 	tox_callback_file_recv_chunk (Tox *tox, tox_file_recv_chunk_cb *function, Void *user_data)
 
Bool 	tox_friend_send_lossy_packet (Tox *tox, Uint32 friend_number, uint8_t *data, size_t length, TOX_ERR_FRIEND_CUSTOM_PACKET *error)
 
Void 	tox_callback_friend_lossy_packet (Tox *tox, tox_friend_lossy_packet_cb *function, Void *user_data)
 
Bool 	tox_friend_send_lossless_packet (Tox *tox, Uint32 friend_number, uint8_t *data, size_t length, TOX_ERR_FRIEND_CUSTOM_PACKET *error)
 
Void 	tox_callback_friend_lossless_packet (Tox *tox, tox_friend_lossless_packet_cb *function, Void *user_data)
 
Void 	tox_self_get_dht_id (Tox *tox, uint8_t *dht_id)
 
uint16_t 	tox_self_get_udp_port (Tox *tox, TOX_ERR_GET_PORT *error)
 
uint16_t 	tox_self_get_tcp_port (Tox *tox, TOX_ERR_GET_PORT *error)
 
Void 	tox_callback_group_invite (Tox *tox, Void(*function)(Tox *tox, int32_t, uint8_t, uint8_t *, uint16_t, Void *), Void *userdata)
 
Void 	tox_callback_group_message (Tox *tox, Void(*function)(Tox *tox, Cint, Cint, uint8_t *, uint16_t, Void *), Void *userdata)
 
Void 	tox_callback_group_action (Tox *tox, Void(*function)(Tox *tox, Cint, Cint, uint8_t *, uint16_t, Void *), Void *userdata)
 
Void 	tox_callback_group_title (Tox *tox, Void(*function)(Tox *tox, Cint, Cint, uint8_t *, uint8_t, Void *), Void *userdata)
 
Void 	tox_callback_group_namelist_change (Tox *tox, Void(*function)(Tox *tox, Cint, Cint, uint8_t, Void *), Void *userdata)
 
Cint 	tox_add_groupchat (Tox *tox)
 
Cint 	tox_del_groupchat (Tox *tox, Cint groupnumber)
 
Cint 	tox_group_peername (Tox *tox, Cint groupnumber, Cint peernumber, uint8_t *name)
 
Cint 	tox_group_peer_pubkey (Tox *tox, Cint groupnumber, Cint peernumber, uint8_t *public_key)
 
Cint 	tox_invite_friend (Tox *tox, int32_t friendnumber, Cint groupnumber)
 
Cint 	tox_join_groupchat (Tox *tox, int32_t friendnumber, uint8_t *data, uint16_t length)
 
Cint 	tox_group_message_send (Tox *tox, Cint groupnumber, uint8_t *message, uint16_t length)
 
Cint 	tox_group_action_send (Tox *tox, Cint groupnumber, uint8_t *action, uint16_t length)
 
Cint 	tox_group_set_title (Tox *tox, Cint groupnumber, uint8_t *title, uint8_t length)
 
Cint 	tox_group_get_title (Tox *tox, Cint groupnumber, uint8_t *title, Uint32 max_length)
 
Cuint 	tox_group_peernumber_is_ours (Tox *tox, Cint groupnumber, Cint peernumber)
 
Cint 	tox_group_number_peers (Tox *tox, Cint groupnumber)
 
Cint 	tox_group_get_names (Tox *tox, Cint groupnumber, uint8_t names[][TOX_MAX_NAME_LENGTH], uint16_t lengths[], uint16_t length)
 
Uint32 	tox_count_chatlist (Tox *tox)
 
Uint32 	tox_get_chatlist (Tox *tox, int32_t *out_list, Uint32 list_size)
 
Cint 	tox_group_get_type (Tox *tox, Cint groupnumber)