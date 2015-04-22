using Toxcore
using Base.Test

# test if we can bootstrap
tox = tox_new()

info("Trying to bootstrap")
@test tox_bootstrap(tox)

tox_kill(tox)
