# My NixOS flake config

## Sops setup

1. Create age key

```
mkdir -p ~/.config/sops/age
age-keygen -o ~/.config/sops/age/keys.txt
```

2. Put in `.sops.yaml`

```
creation_rules:
  - path_regex: secrets/.*\.yaml$
    age: age1_public_key
```

3. Create secrets with sops

```
sops secrets/password.yaml
```

4. Then check sops declaration config in ./nixos/environment.nix

That is all. Keep the key for yourself
