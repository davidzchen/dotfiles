# Importing gnome-terminal profile

Instructions based on those provided
[here](https://gist.github.com/reavon/0bbe99150810baa5623e5f601aa93afc)

To list profiles:

```sh
dconf dump /org/gnome/terminal/legacy/profiles:/
```

The output should be as follows:

```
dzc@cathexis ❯❯❯ dconf dump /org/gnome/terminal/legacy/profiles:/                           ~
[:2104b498-797d-4d04-9a85-e7c29a6b8934]
visible-name='default'

[/]
list=['2104b498-797d-4d04-9a85-e7c29a6b8934']
default='2104b498-797d-4d04-9a85-e7c29a6b8934'
```

On elementaryOS, if the above output does not appear, then open Preferences,
remove the unnamed profile, and create a new profile, in this case, called
`default`, though once the profile is imported, it will override the name
as well as other settings.

Using the UUID of the default profile, import `citylights-profile.dconf` as
follows:

```sh
dconf load /org/gnome/terminal/legacy/profiles:/:2104b498-797d-4d04-9a85-e7c29a6b8934/ < .share/gnome-terminal/citylights-profile.dconf
```

This command should instantly apply the profile and color scheme to any open
terminal windows.
