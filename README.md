# Тестовое задание DevOps разработчик

1. [Первичная установка](docs/project_install.md)
1. [Задание](docs/assignment.md)

[Источник](https://github.com/smenateam/assignments/tree/c202bd7d774ec12b038afd37471f4a7a06fbe0f6/devops)

# Инструкция

## Зависимости

### Helm-secrets
```
helm plugin install https://github.com/jkroepke/helm-secrets --version v4.2.1
```

Find latest version on [helm-secrets releases](https://github.com/jkroepke/helm-secrets/releases)

### SOPS

https://github.com/mozilla/sops/releases

```
install -v sops-v3.7.3.linux.amd64 /usr/local/bin/sops

helm secrets template ./chart -f ./values/prod/values.yaml -f ./values/prod/secrets.yaml
helm  template ./chart -f ./values/prod/values.yaml -f secrets://./values/prod/secrets.yaml

sops updatekeys -y

hemlfile