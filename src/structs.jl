#define 	TOX_DEFINED
 
#define 	TOX_VERSION_MAJOR   0u
 
#define 	TOX_VERSION_MINOR   0u
 
#define 	TOX_VERSION_PATCH   0u
 
#define 	TOX_VERSION_IS_API_COMPATIBLE(MAJOR, MINOR, PATCH)
 
#define 	TOX_VERSION_REQUIRE(MAJOR, MINOR, PATCH)   typedef char tox_required_version[TOX_IS_COMPATIBLE(MAJOR, MINOR, PATCH) ? 1 : -1]
 
#define 	TOX_VERSION_IS_ABI_COMPATIBLE()   tox_version_is_compatible(TOX_VERSION_MAJOR, TOX_VERSION_MINOR, TOX_VERSION_PATCH)
 
const TOX_PUBLIC_KEY_SIZE = 32
const TOX_SECRET_KEY_SIZE = 32
 
#define 	TOX_ADDRESS_SIZE   (TOX_PUBLIC_KEY_SIZE + sizeof(uint32_t) + sizeof(uint16_t))
 
const TOX_MAX_NAME_LENGTH = 128
const TOX_MAX_STATUS_MESSAGE_LENGTH = 1007
const TOX_MAX_FRIEND_REQUEST_LENGTH = 1016
const TOX_MAX_MESSAGE_LENGTH = 1372
const TOX_MAX_CUSTOM_PACKET_SIZE = 1373
const TOX_HASH_LENGTH = 32 #crypto_hash_sha256_BYTES
 
#define 	TOX_FILE_ID_LENGTH   32
 
#define 	TOX_MAX_FILENAME_LENGTH   255


immutable Tox end
typealias TOX_PROXY_TYPE Cint
typealias TOX_MESSAGE_TYPE Cint
typealias TOX_ERR_NEW Cint
export TOX_ERR_NEW
typealias TOX_ERR_SET_INFO Cint
export TOX_ERR_SET_INFO

typealias TOX_USER_STATUS Cint
export TOX_USER_STATUS
typealias TOX_ERR_BOOTSTRAP Cint
export TOX_ERR_BOOTSTRAP

immutable Tox_Options
    #=
     * The type of socket to create.
     *
     * If this is set to false, an IPv4 socket is created, which subsequently
     * only allows IPv4 communication.
     * If it is set to true, an IPv6 socket is created, allowing both IPv4 and
     * IPv6 communication.
     =#
    ipv6_enabled::Bool

    #=
     * Enable the use of UDP communication when available.
     *
     * Setting this to false will force Tox to use TCP only. Communications will
     * need to be relayed through a TCP relay node, potentially slowing them down.
     * Disabling UDP support is necessary when using anonymous proxies or Tor.
     =#
    udp_enabled::Bool

    #=
     * Pass communications through a proxy.
     =#
    proxy_type::TOX_PROXY_TYPE

    #=
     * The IP address or DNS name of the proxy to be used.
     *
     * If used, this must be non-NULL and be a valid DNS name. The name must not
     * exceed 255 characters, and be in a NUL-terminated C string format
     * (255 chars + 1 NUL byte).
     *
     * This member is ignored (it can be NULL) if proxy_enabled is false.
     =#
    proxy_host::Ptr{Cchar}

    #=
     * The port to use to connect to the proxy server.
     *
     * Ports must be in the range (1, 65535). The value is ignored if
     * proxy_enabled is false.
     =#
    proxy_port::Uint16

    #=
     * The start port of the inclusive port range to attempt to use.
     *
     * If both start_port and end_port are 0, the default port range will be
     * used: [33445, 33545].
     *
     * If either start_port or end_port is 0 while the other is non-zero, the
     * non-zero port will be the only port in the range.
     *
     * Having start_port > end_port will yield the same behavior as if start_port
     * and end_port were swapped.
     =#
    start_port::Uint16

    #=
     * The end port of the inclusive port range to attempt to use.
     =#
    end_port::Uint16
    Tox_Options() = new()
end

