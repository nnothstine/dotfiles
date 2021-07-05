# github.com/nnothstine/dotfiles

## Setup
`sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply nnothstine`
First pass will fail due to lack of 1password-cli — still looking into a way of getting this before a build.
Make sure to run `eval $(op signin my)` before a deployment.