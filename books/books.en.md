# Getting Started with Salla Raed

This guide helps you set up the Raed starter theme to learn Salla theme development. File names, commands, and technical identifiers retain their original spelling.

## 1. Understanding Raed

**Raed** is Salla’s official starter theme. **Twilight** is Salla’s theme engine, and **Twig** is the template language used by Raed.

As a Magento developer, start by studying the storefront presentation layer: layouts, page templates, components, JavaScript, styling, and merchant configuration. Store data and services come from the Salla platform. Theme previews use a Salla demo store.

References:

- [Official Raed repository and README](https://github.com/SallaApp/theme-raed)
- [Salla theme development guide](https://docs.salla.dev/421878m0)

## 2. Workspace at the time of writing

Checks recorded on October 11, 2026:

| Item | Observed result |
| --- | --- |
| Workspace | `/workspace/themes` |
| Target folder | `/workspace/themes/nura-raed`, empty |
| Node.js | `24.21.0` |
| npm | `11.19.0` |
| Salla CLI | `3.2.62` |
| Git | `2.43.0` |
| pnpm | Not found on PATH |

The inspected upstream Raed `package.json` reports version `1.358.0`, requires pnpm through `preinstall`, and specifies Node `^22.18.0 || >=24.11.0`. This environment’s Node version satisfies that range. Check the version again in your local repository after downloading the theme.

Reference: [Official Raed package.json](https://github.com/SallaApp/theme-raed/blob/master/package.json).

## 3. Prepare your accounts and demo store

You need:

1. A [Salla Partners account](https://salla.partners).
2. A [GitHub account](https://github.com).
3. GitHub connected to Salla Partners through Salla’s authorization process.
4. A demo store for testing the theme.

References:

- [Creating and importing themes through Salla Partners](https://docs.salla.dev/421877m0)
- [Theme setup and demo preview](https://docs.salla.dev/421879m0)

## 4. Create a repository from the Raed template

This workflow gives you local source code from your own repository connected to Salla Partners.

1. Open [SallaApp/theme-raed](https://github.com/SallaApp/theme-raed).
2. Select **Use this template → Create a new repository**.
3. Create a repository named `nura-raed` in your GitHub account.
4. Sign in to Salla Partners and open **My Themes**.
5. Connect GitHub if it is not already connected.
6. Select **Import Theme** and choose your `nura-raed` repository.
7. Complete the theme information requested by the portal.

This step is complete when your repository contains the Raed source and your theme appears in Salla Partners.

References:

- [Create Theme: using the Raed template and importing](https://docs.salla.dev/422775m0)
- [Importing an existing theme through the portal](https://docs.salla.dev/421877m0)

## 5. Clone into the local folder

Open the container terminal. Replace `USERNAME` with your GitHub username:

```bash
cd /workspace/themes/nura-raed
git clone https://github.com/USERNAME/nura-raed.git .
```

The `.` places the source directly in the current folder. This command uses the empty folder you already created. If the folder contains files, inspect them first; do not delete files to force cloning.

For a private repository, complete GitHub authentication using the Git authentication mechanism available in your environment.

Check the result:

```bash
pwd
ls -la
cat package.json
```

This step is complete when `README.md`, `package.json`, `twilight.json`, and the `src` directory are present in the theme root.

Reference: [Development workflow: cloning the theme repository locally](https://docs.salla.dev/421878m0).

## 6. Install dependencies

The inspected upstream Raed uses pnpm. If pnpm is unavailable:

```bash
npm install -g pnpm
pnpm --version
```

Then, from the theme root:

```bash
cd /workspace/themes/nura-raed
pnpm install
```

Salla’s general guide mentions `npm install`, but the inspected upstream Raed has the script `preinstall: npx only-allow pnpm`. Follow your local repository’s `package.json`, lockfile, and instructions. If your checkout specifies a package manager version, use that version.

This step is complete when dependency installation succeeds without errors. If it fails, record the error message and your Node and pnpm versions before attempting a fix.

References:

- [Raed dependencies, package manager, and Node requirements](https://github.com/SallaApp/theme-raed/blob/master/package.json)
- [Raed pnpm lockfile](https://github.com/SallaApp/theme-raed/blob/master/pnpm-lock.yaml)

## 7. Sign in and start preview

Salla CLI is already installed in the inspected environment. From the theme root:

```bash
salla login
salla theme preview --with-editor
```

Complete login in your browser and select a demo store when prompted. The `--with-editor` option opens preview with the theme configuration editor.

Preview watches file changes and updates the displayed page. Follow the URL and instructions printed by the CLI. In a dev container, open the link in your host browser as instructed by the CLI; do not assume preview always uses port `3000` or `5173`.

To see the options supported by your CLI version:

```bash
salla theme preview --help
```

To stop preview, press `Ctrl+C` in the terminal running it.

This step is complete when the demo store displays your theme and you can open the theme editor. Preview needs internet connectivity and account/demo store access; a successful local build alone does not prove that preview works.

Reference: [Official Theme Preview guide](https://docs.salla.dev/422776m0).

## 8. Check the production build

The inspected upstream uses the `production` script:

```bash
pnpm run production
```

It runs `webpack --mode production`. Other available scripts are `development`, `watch`, and the `prod` alias. Inspect your local `package.json` before using them; do not assume `build` or `dev` scripts exist.

A production build does not publish the theme. This step is complete when the command exits successfully without errors. You still need to inspect the storefront through preview.

Reference: [Raed build scripts](https://github.com/SallaApp/theme-raed/blob/master/package.json).

## 9. Alternative: create a theme through the CLI

In addition to the GitHub template and portal import workflow, Salla supports theme creation through the CLI:

```bash
cd /workspace/themes
salla login
salla theme create --type twig --name nura-raed
```

The `--type twig` and `--name` options are available in the inspected Salla CLI `3.2.62`. Follow the prompts, including GitHub authorization and theme details. Because the `nura-raed` folder already exists, the template and cloning workflow in steps 4–5 is easier to control in this workspace. Do not use both workflows to create the same theme.

Check your CLI version’s options with:

```bash
salla theme create --help
```

References:

- [Create Theme through Salla CLI](https://docs.salla.dev/422775m0)
- [Authentication and theme commands overview](https://docs.salla.dev/422774m0)

## 10. Start reading the code after setup

Read in this order, checking that each path exists in your checkout:

| File or directory | What to learn |
| --- | --- |
| `README.md` | Starter instructions and workflow |
| `package.json` | Dependencies, Node version requirements, and scripts |
| `twilight.json` | Metadata, features, settings, and merchant components |
| `webpack.config.js` | Asset processing and watcher integration |
| `src/views/layouts/master.twig` | Shared layout and page blocks |
| `src/views/pages/index.twig` | Homepage entry point |
| `src/views/components/home/` | Components used on the homepage |
| `src/assets/` | JavaScript, styling, and images |
| `src/locales/` | Translated text |

References:

- [Directory structure in the Raed README](https://github.com/SallaApp/theme-raed#directory-structure)
- [Theme configuration through twilight.json and the portal](https://docs.salla.dev/421879m0)
- [Salla homepage rendering and component contracts](https://docs.salla.dev/422558m0)
- [Raed master layout](https://github.com/SallaApp/theme-raed/blob/master/src/views/layouts/master.twig)

**Your first step:** create the `nura-raed` repository from the official template, connect it to Salla Partners, and clone it locally. Once the source is available, the “Learning Raed Basics” specification can be based on the code you actually use.

This is a getting started guide, not a report of completed installation or a milestone specification. Cloning, dependency installation, login, preview, and build had not been run when the original guide was written.
