# dotfiles

## tips

### Re-generating tmuxline

```vim
:TmuxlineSnapshot ~/.dots/<color-scheme>/tmux/<colors-scheme>
```

### antigen parseargs

If you see the following errors on zsh startup:

```
-antigen-parse-args:78: command not found: #
```

It may be that `lib/zsh/antigen.zsh` is too old.
