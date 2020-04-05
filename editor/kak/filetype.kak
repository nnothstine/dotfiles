eval %sh{kak-lsp --kakoune -s $kak_session}

hook global WinSetOption filetype=(rust|python|go|javascript|typescript|c|cpp) %{
    lsp-enable-window
}

def shebang-detect -docstring "Does X" %{

}

hook global BufCreate .+ shebang-detect
hook global BufWritePost .+ shebang-detect
