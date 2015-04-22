const base 				= "https://jenkins.libtoxcore.so/"
const lastbuild 		= "lastSuccessfulBuild/artifact/"
const name_unix 		= "libtoxcore.tar.xz"
base_win(wordsize) 		= "view/Libs/job/toxcore_win$(wordsize)_dll/"
name_win(wordsize) 		= "tox_win$(wordsize)_dll.zip"
base_linux(wordsize) 	= "job/libtoxcore-linux-$(wordsize == 32 ? "i686" : "x86_64")/"
const base_macos 		= "job/libtoxcore-osx/"

@windows? begin 
	const liburl = base*base_win(WORD_SIZE)*lastbuild*name_win(WORD_SIZE)
end : @linux? begin
	const liburl = base*base_linux(WORD_SIZE)*lastbuild*name_unix
end : @macos? begin 
	const liburl = base*base_macos*lastbuild*name_unix
end : error("platform not yet supported. File Pull Request or issue at Toxcore.jl")



path = download(liburl)

!(isdir("lib") || isfile("lib")) && mkdir("lib")

lib_archive = Pkg.dir("Toxcore", "deps", "lib", "lib.zip")
mv(path, lib_archive)

@windows? begin 
	const unzip = `7z x -obuilds -y $lib_archive`
end : @unix? begin
	const unzip = `tar xzf $lib_archive -C builds`
end : error("platform not yet supported. File Pull Request or issue at Toxcore.jl")


run(unzip)

!(isdir("bin") || isfile("bin")) && mkdir("bin")
ending = @windows? ".dll" : @linux? ".so" : @macos? ".dylib" : error("platform not support") 

mv(Pkg.dir("Toxcore", "deps", "builds","bin","libtox$ending"), joinpath("bin", "libtoxcore$ending"))
rm("builds", recursive=true)
rm("lib", recursive=true)