# nvim.lua with LSP
my neovim config with lua and LSP

## Patched fonts
### Arch
1. Download font
```bash
yay -S ttf-dejavu-nerd
fc-cache -fv
fc-list | grep "Nerd"
```
2. Update i3 and alacritty
*i3*
```
font pango:DejaVuSansM Nerd Font Mono 12, Awesome 10
```

*alacritty.yml*
```
font:
  normal:
    family: DejaVuSansM Nerd Font Mono
```

## License
MIT
