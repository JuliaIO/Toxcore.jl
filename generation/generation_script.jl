################################################################################
# Script to generate julia code from the tox header files.                     #
# However these files need to be modified a little to get our final result.    #
################################################################################

using Clang.wrap_c

tox_headers = ["tox.h", "tox_old.h", "toxav.h", "toxdns.h"]

function header_wrapped(top_header, cursor_header)
      for tox_header in tox_headers
            if contains(cursor_header, tox_header)
                  return true
            end
      end

      return false
end

function cursor_wrapped(cursorname, cursor)
      return true
end

function header_outputfile(header_name)
      return "$(header_name).jl"
end

context = wrap_c.init(
            headers                 = ["cheader/tox.h", "cheader/toxav.h", "cheader/toxdns.h"],
            index                   = None,
            output_file             = "output.jl",
            common_file             = "common.jl",
            output_dir              = Pkg.dir("Toxcore", "generation", "cheader"),
            clang_args              = ["-pedantic", "-v"],
            clang_includes          = ["/usr/lib/gcc/x86_64-linux-gnu/4.8/include/"], # this is a hack to find the standard c libraries with the clang that is shipped with llvm and julia
            clang_diagnostics       = true,
            header_wrapped          = header_wrapped,
            header_library          = x->"libtoxcore",
            header_outputfile       = header_outputfile,
            cursor_wrapped          = cursor_wrapped,
            rewriter                = x -> x
        )

context.options.wrap_structs = false
run(context)