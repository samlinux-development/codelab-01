<script lang="ts">
import { backend } from '../stores/ic';
import type { Result} from '../declarations/backend/backend.did.d.ts';
import type { Entry} from '../declarations/backend/backend.did.d.ts';

let search:string = '', error:string ='', entry:Entry | null, result:Result;

const handleOnSubmit = async () => {
  try {

    error = '';
    entry = null;

    result = await backend.getWord(search);
    if ('ok' in result) {
      entry = result.ok;
    }
    else {
      error = result.err;
    }
    
    search = '';

  } catch (err) {
      console.error('>> ',err);
  }
};
</script>

<h1>Welcome to CodeLab-01</h1>
<div>
  In this codeLab you will learn how to use the Motoko Result type to handle success and errors cases in a dictionary application. Add new words to the dictionary and search for them.
</div>
<div>
  You can add them by running the following command in terminal.
</div>
<div>
  <code>
    dfx canister call backend addWord '("word", "description")'
  </code>
</div>

<div class="box">
  <form on:submit|preventDefault={handleOnSubmit}>
    <label for="name">Search a word</label>
    <input id="search" alt="Search" type="text" bind:value={search}/>
    <button type="submit">Click Me!</button>
  </form> 
  <div>
    {#if entry}
      <b>{ entry.word }</b>
      <div>{ entry.description}</div>
    {:else }
      <div>{ error }</div>
    {/if}
  </div> 
</div>

<style>
  .box {
    max-width: 500px;
    padding: 1rem;
    margin: 1rem;
    border: 1px solid #e2f4de;
    background: #e2f4de;
  }
  form {
    display: flex;
    flex-direction: column;
  }
  label {
    margin-bottom: 0.5rem;
  }
  input {
    padding: 0.5rem;
    margin-bottom: 0.5rem;
  }
  button {
    padding: 0.5rem;
    margin-bottom: 0.5rem;
  }
  div {
    padding-top: 0.5rem;
  }
  h1 {
    color: #145e87;
  }
  code {
    display: inline-block;
    background: #f1f2f6;
    color: #c32323;
    border-radius: 3px;
    padding: 1rem;
    font-family: 'Fira Code', 'Courier New', Courier, monospace;
    font-size: 1.1rem;
    box-shadow: 0 3px 3px rgba(0, 0, 0, 0.2);
  }
</style>