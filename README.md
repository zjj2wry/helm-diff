# helm-diff

## Install

```
helm plugin install https://github.com/zjj2wry/helm-diff
```

## Example
#### Get different version release values.yaml and diff its
```
helm diff values REALEASE 1 2
```

#### Get different version release manifest.yaml and diff its
```
helm diff manifest REALEASE 1 2
```

## Uninstall
```
helm plugin remove diff
```