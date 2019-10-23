# Autogenerated wrapper script for Dbus_jll for arm-linux-musleabihf
export libdbus

using Expat_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libdbus`
const libdbus_splitpath = ["lib", "libdbus-1.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libdbus_path = ""

# libdbus-specific global declaration
# This will be filled out by __init__()
libdbus_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libdbus = "libdbus-1.so.3"


"""
Open all libraries
"""
function __init__()
    global prefix = abspath(joinpath(@__DIR__, ".."))

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    append!.(Ref(PATH_list), (Expat_jll.PATH_list,))
    append!.(Ref(LIBPATH_list), (Expat_jll.LIBPATH_list,))

    global libdbus_path = abspath(joinpath(artifact"Dbus", libdbus_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libdbus_handle = dlopen(libdbus_path)
    push!(LIBPATH_list, dirname(libdbus_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

