eval %sh{kak-lsp --kakoune -s $kak_session}

hook global WinSetOption filetype=(rust|python|go|javascript|typescript|c|cpp) %{
    lsp-enable-window
}
