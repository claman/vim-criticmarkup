# vim-criticmarkup

Adds [criticmarkup][] support to vim. Attaches to `pandoc`, `markdown`, `mkd`, `vimwiki`, and `txt` filetypes.

[criticmarkup]: http://criticmarkup.com/

![screenshot](http://i.imgur.com/cdlK1ek.png)

## Basic syntax

criticmarkup can be used to annotate additions, deletions, substitutions, highlights and comments in a text document.

### Additions

    That was a {++very ++}hasty comment.

### Deletions

    It is {--not --}uncommon for people to tell the truth.

### Substitutions

    The {~~bird~>condor~~} flew majestic through the skies.

### Comments

    I believe this is not enough.{>> @editor on what grounds? <<}

### Highlights

    {==Some sources==}{>> Which? <<} mention ὰταραξία as the ancient skeptics goal.

## Handling annotations

vim-criticmarkup creates a command, `:Critic`, that can accept and reject annotations. To accept an edit, simply place the cursor inside the annotation and then execute

    :Critic accept

If you want to reject it, use

    :Critic reject

Currently, neither accept or reject work on highlights or comments.

## TODO

* Expand `accept`s and `reject`s to handle highlights and comments.
* Implement operators and keyboard mappings to create annotations.
