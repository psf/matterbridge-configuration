# Matterbridge

This repository holds the configuration of the PSF matterbridge instance

## Configuration

Configuration happens via environment variables and a configuration
template file.

### Environment: Matterbridge

Matterbridge has some configuration of its own, which is mostly
documented upstream. For starters, we'll review the most important
aspects:

* `DEBUG`. Set to "1" to log all message events across bridges.

Matterbridge uses Viper, and so each value in the TOML configuration can
be set by envvar.

Basically, here are the rules:

- Each config envvar is prefixed with `MATTERBRIDGE_`.
- Each nested level of config object is separated by an underscore `_`.
- Any dash in a config key is converted to an underscore `_`.

So for example, with this in your TOML config:

```toml
[slack.my-team]
Token="xoxp-xxxxxxxxxxxxxxxxxxxxxxxxxxx"
```

You could instead set an environment variable for
`MATTERBRIDGE_SLACK_MY_TEAM_TOKEN` and leave that key out of in the
configuration file template.

### Template: Matterbridge

* Edit channel bridge config via [`config/config-template.toml`][config].

<!-- Links -->
   [config]: config/config-template.toml
