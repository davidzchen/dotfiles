# Color schemes files

## Pantheon Terminal

Save Pantheon Terminal dconf settings:

```sh
dconf dump /io/elementary/terminal/settings > dconf-settings.ini
```

Restore settings:

```sh
dconf load /io/elementary/terminal/settings < dconf-settings.ini
```
