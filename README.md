| <img alt='rust icon' width='50' src='https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/rust/rust-original.svg' style="display: block;" /> | <h1>TEMPLATE</h1> |
| ------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------- |

<br/>

![main GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/sripwoud/rust-template/pr.yml?branch=main&label=main)
[![Coverage Status](https://coveralls.io/repos/github/sripwoud/rust-template/badge.svg?branch=main)](https://coveralls.io/github/sripwoud/rust-template?branch=main)

| Feature                                        | With                                                                  | Configuration File                       |
| ---------------------------------------------- | --------------------------------------------------------------------- | ---------------------------------------- |
| Continuous Integration                         | [GitHub Workflow](https://docs.github.com/en/actions/using-workflows) | [.github/workflows](./.github/workflows) |
| Formatting                                     | [dprint](https://dprint.dev/)                                         | [.dprint.jsonc](./.biome.json)           |
| Git Hooks                            | [hk](https://hk.jdx.dev/)                                             | [hk.pkl](./hk.pkl)                       |
| Tasks Runner, Environment & Runtime Management | [mise](https://mise.dev/)                                             | [mise.toml](./mise.toml)                 |
| Tests Runner                                   | [nextest](https://nexte.st/)                                          |                                          |

## Develop

I use [`mise`](https://mise.jdx.dev) to manage runtimes, manage environment variables, and run tasks.\
To install it and setup the repository:

```commandline
./setup
```

To run tasks interactively:

```commandline
mise run
```
