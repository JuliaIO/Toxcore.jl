################################################################################
# Script to generate julia code from the tox header files.                     #
# However these files need to be modified a little to get our final result.    #
################################################################################

using Clang.wrap_c

tox_headers = ["tox.h", "tox_old.h", "toxav.h", "toxdns.h"]

function header_wrapped(top_header, cursor_header)
      return cursor_header in tox_headers
end

function cursor_wrapped(cursorname, cursor)
      return true
end

function header_outputfile(header_name)
      return "$(header_name).jl"
end

context = wrap_c.init(
            headers                 = ["tox.h", "toxav.h", "toxdns.h"],
            index                   = None,
            output_file             = "output.jl",
            common_file             = "common.jl",
            output_dir              = "",
            clang_args              = ASCIIString[],
            clang_includes          = ASCIIString[],
            clang_diagnostics       = true,
            header_wrapped          = header_wrapped,
            header_library          = x->"libtoxcore",
            header_outputfile       = header_outputfile,
            cursor_wrapped          = cursor_wrapped,
            rewriter          = x -> x
        )

context.options.wrap_structs = false
run(context)