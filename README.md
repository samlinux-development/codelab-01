<p align="left" >
  <img width="240"  src="static/icAcademy.png">
</p>

# CodeLab-01

In this codeLab you will learn how to use the Motoko Result type to handle success and errors cases in a dictionary application. 

### Create a new project folder
```bash
mkdir myapp && cd myapp
```

### terminal 1
```bash
dfx start --clean
```

### terminal 2
```bash
npx degit https://github.com/samlinux-development/codeLab-01.git
```

```bash
npm install
```

```bash
dfx deploy 
```


### Add some words and definitions
Use the following function schema to add some words and definitions to the dictionary in terminal 2.

>dfx canister call backend addWord '("word", "description")'


```bash

dfx canister call backend addWord '("query", "A query is an optimised way to execute operations on a canister where the state changes are not preserved. Queries are synchronous and can be made to any node that hosts the canister. Queries do not require consensus to verify the result.")'
```
```bash
dfx canister call backend addWord '("replica", "The replica is a collection of protocol components that are necessary for a node to participate in a subnet.")'
```

### Call the frontend canister and search your words
```bash
echo http://$(dfx canister id frontend).localhost:4943
```

## Local development

You can serve the frontend in development mode like you normally develop an app using the command. But first, make sure your run **dfx deploy** to create the .env file and all decalarations.

```bash
npm run dev
```

## Deploying to the playground

To test your dApp under the Internet Computer's environment, you can deploy it to the [Motoko Playground](https://m7sm4-2iaaa-aaaab-qabra-cai.raw.ic0.app/).

```bash
dfx deploy --playground
```
