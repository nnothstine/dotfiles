plug "andreyorst/kakoune-snippet-collection"
plug "occivink/kakoune-snippets" config %{
    set-option -add global snippets_directories "%opt{plug_install_dir}/kakoune-snippet-collection/snippets"
}

plug "ul/kak-lsp" do %{
    cargo build --release --locked
    cargo install --force --path .
}

# plug "alexherbo2/auto-pairs.kak" config %{
#     map global user s -docstring 'Surround' ': auto-pairs-surround<ret>'
# }

# ease navigation between opened buffers
plug "Delapouite/kakoune-buffers"

# change or print the working directory
plug "Delapouite/kakoune-cd"

# plug "alexherbo2/explore.kak" config %{
#     map global normal <minus> ': explore-files<ret>'
# }

plug "TeddyDD/kakoune-edit-or-dir" config %{
	unalias global e
    alias global e edit-or-dir
    map global normal <minus> ': edit-or-dir<ret>'
}
