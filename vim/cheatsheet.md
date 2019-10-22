# Vim Cheatsheet

## Editing

### Operator/Actions

The action we want to perform in target

```c``` -- Change

```y``` -- Yank(Copy)

```d``` -- Delete

```p``` -- Put (paste) the clipboard after cursor

```=``` -- Format

```>``` -- Add Indent

```<``` -- Remove Indent

```v``` -- Visually select

```zf``` -- Define fold

```g~``` -- Togglecase

```gu``` -- Make Lowercase

```gU``` -- Make Uppercase

### Text Objects/Motion

Text Objects/Motions are used to define target or range in which we want to act. Apart from Objects/Motions mentioned below, we can use vim navigations as well (e.g.: ```h```, ```j```, ```k```, ```l```, etc.)

```w``` -- Word

```s``` -- Sentence

```p``` -- Paragraph

```t``` -- Tag

```gn``` --  Searches forward for the last used search pattern, like with ```n```, and starts Visual mode to select the match.

```gN``` --  Searches backward for the last used search pattern, like with ```N```, and starts Visual mode to select the match.

```%``` -- Code block

```(``` -- Block surrounded by () (same as ```)``` or ```b```)

```{``` -- Block surrounded by {} (same as ```}``` or ```B```)

```[``` -- Block surrounded by [] (same as ```]```)

```<``` -- Block surrounded by <> (same as ```>```)

```'``` -- Surrounded by single quotes

```"``` -- Surrounded by double quotes

``` ` ``` -- Surrounded by backtick

#### Modifiers

Modifiers are used before selection (Text object/Motion)

```i``` -- Inner

```a``` -- Around/a/an

```NUM``` -- Numbers (e.g.: ```1```, ```2```, ```28```)

```t``` -- Till forward (Search forward for character and stops before it)

```T``` -- Till backward (Search backward for character and stops before it)

```f``` -- Till forward (Search forward for character and lands on it)

```F``` -- Till backward (Search backward for character and lands on it)

```/``` -- Find

## Shorthand syntax

```x``` -- Deletes the character under the cursor same as ```dl```

```X``` -- Deletes the character before the cursor same as ```dh```

```s``` -- Substitute text (delete character and switch to insert mode) same as ```ch```

```S``` -- Substitute line and (same as ```cc```)

```~``` -- Switch case of character

```r``` -– Replace single character

```J``` -- Join line below to the current one with one space in between

```gJ``` -- Join line below to the current one without space in between

> Double an operator to apply operation on a whole line

```dd``` -- Deletes a whole line

```cc``` -- Changes a whole line

```yy``` -- Yank (copy) a line (same as ```Y```)

```>>``` -- Indent line

```<<``` -- Remove indent from line

> Capitalize an operator to have it perform a stronger (or alternate) version of its default behavior

```C``` -- Changes from the cursor to the end of a line

```Y``` -- Copies a complete line same as ```yy```

```D``` -- Deletes from the cursor to the end of the line

```P``` -- put (paste) before cursor

```V``` -- Visually select line

> Other useful commands

```.``` -- Repeat last command

```u``` -- Undo

```Ctrl + r``` -- Redo

> Example of performing an action in a target <operator><modifiers><motions>

```ciw``` -- Change inner word

```c2iw``` -- Change two words

```dta``` -- Delete till character 'a'

```ci"``` -- Change inside double quotes

```yit``` -- Change everything inside xml/html tag in cursor

```dat``` -- Delete around xml/html tag in cursor

```da%``` -- Delete around code block

```d2j``` -- Delete 2 line down

## Insert Text

```i``` -- Insert before the cursor

```I``` -- Insert at the beginning of the line

```a``` -- Append after the cursor

```A``` -- Append at the end of the line

```o``` -- Open a new line below the current line

```O``` -- Open a new line above the current line

```Esc``` -- Exit insert mode

## Vim Navigation

```k``` -- Move backward one line or ```nk``` to jump backward 'n' line

```j``` -- Move forward one line or ```nj``` to jump forward 'n' line

```l``` -- Move right side or ```nl``` to jump right 'n' columns

```h``` -- Move left side or ```nk``` to jump left 'n' columns

### Words

```e``` -- Jump to the end of a word

```E``` -- Jump to the end of the WORD (any non-whitespace characters)

```b``` -- Jump backward to the beginning of a word

```B``` -- Jump backward to the beginning of WORD (any non-whitespace characters)

```w``` -- Jump forward to beginning of next word

```W``` -- Jump forward to beginning of the next WORD (any non-whitespace characters)

### Line

```0``` -- Jump to the beginning of the line or at first column

```^``` -- Jump to the first non-blank character of the line

```$``` -- Jump to the end of the line

```g_``` -- Jump to the last non-blank character of the line

```fx``` -- Jump to next occurrence of character x

```tx``` -- Jump to before next occurrence of character x

```Fx``` -- Jump to previous occurrence of character x

```Tx``` -- Jump to after previous occurrence of character x

```;``` -- Repeat previous f, t, F or T movement

```,``` -- Repeat previous f, t, F or T movement, backward

### Text

```%``` -- Jump to the matching braces or parenthesis.

```{``` -- Jump backward one paragraph.

```}``` -- Jump forward one paragraph.

```)``` -- Jump forward one sentence.

```(``` -- Jump backward one sentence.

### Document

```n%``` -- Jump to the ```nth``` percentage line of the file

```nG``` -- Jump to the ```nth``` line of the file

```G``` -- Jump to the end of the file

```gg``` -- Jump to the beginning of the file

```g;``` -- Jump backward in change list

```g,``` -- Jump forward in change list

```ctrl-o``` -- Jump backward in jump list

```ctrl-i``` -- Jump forward in jump list

``` `”``` -- Jump to the position where you were in NORMAL MODE while last closing the file

``` `^``` -- Jump to the position where you were in INSERT MODE while last closing the file

### Window

```H``` -- Jump to the top (high) of the screen

```M``` -- Jump to the middle (medium) of the screen

```L``` -- Jump to the bottom (low) of the screen

```zz``` -- Move current line to the center of screen

```zt``` -- Move current line to the top of screen

```zb``` -- Move current line to the end of screen

### Page

```ctrl + f``` -- Move forward one full screen

```ctrl + b``` -- Move backward one full screen

```ctrl + d``` -- Move forward (down) a half screen

```ctrl + u``` -- Move back (up) one half screen

```Ctrl + e``` -- Move viewport up by single line

```Ctrl + y``` -- Move viewport down by single line

### Tabs

```gt``` -- Go to next tab

```gT``` -- Go to previous tab

```ngt``` -- Go to ```nth``` next tab

## Selection (Visual Mode)

```v``` -- Start visual mode

```V``` -- Start line-wise visual mode

```Ctrl + v``` -- Start visual block mode

```o``` -- Move to other end of marked area

```O``` -- Move to other corner of block

```x``` -- Delete marked text (same as ```d```)

```~``` -- Switch case

Use Navigation keys like ```h```, ```j```, ```k```, ```l```, ```w```, etc. to make/change selection

Use operators/actions like ```c```, ```y```, ```d```, ```>```, ```<``` to perform opration/actions in selction

## Working with multiple files

### Buffers

```:e file-name``` -- Edit a file in a new buffer.

```:bn[ext]``` -- Go to the next buffer.

```:bp[rev]``` -- Go to the previous buffer.

```:ls``` -- list all open buffers.

```:bd[elete]``` -- Delete buffer (Makes the buffer invisible, but leaves it in memory).

```:bd[elete] file1 file2``` -- Delete buffers with matching filenames or numbers.

```:bw[ipeout]``` -- Wipeout buffer from memory.

```:bw[ipeout] file1 file2``` -- Wipeout all buffers with matching filenames or numbers.

```%bw[ipeout]``` -- Wipeout all buffer.

```:b[uffer] buffer-number/buffer-name``` -- Open buffer with a buffer number or name.

```:sb[uffer] buffer-number/buffer-name``` -- Open buffer with a buffer number or name in horizontally split window.

```:vert sb[uffer] buffer-number/buffer-name``` -- Open buffer with a buffer number or name in vertically split window.

### window

```:sp[lit] file-name``` -- Open a file in a new buffer and horizontally split window.

```:vsp[lit] file-name``` -- Open a file in a new buffer and vertically split window.

```Ctrl + ws``` -- Split window horizontally.

```Ctrl + wv``` -- Split window vertically.

```Ctrl + ww``` -- Switch windows.

```Ctrl + wh``` -- move cursor to the left window (vertical split).

```Ctrl + wl``` -- move cursor to the right window (vertical split).

```Ctrl + wj``` -- move cursor to the window below (horizontal split).

```Ctrl + wk``` -- move cursor to the window above (horizontal split).

```Ctrl + wq``` -- quit a window

```:q[uit]``` -- Quit window.

```:q[uit]!``` -- Quit window and through away unsaved changes.

```:w[rite]``` -- Write (save) the file.

```:wq``` -- Write (save) and quit.

```:only``` -- Close all window but current.

### Tabs

```:tabnew``` -- Open new Tab.

```:tabnew file``` -- Open file in a new tab.

```Ctrl + wT``` -- Move current split window into its a tab.

```gt``` -- Go to the next tab (same as ```:tabn[ext]```).

```gT``` -- Go to the previous tab (same as or ```:tabp[rev]```).

```:tabfirst``` -- Go to the first tab.

```:tablast``` -- Go to the last tab.

```ngt``` -- Go to tab ```n``` number tab.

```:tabmove n``` -- move current tab to the ```nth``` position (indexed from 0).

```:tabc[lose]``` -- close the current tab and all its windows.

```:tabo[nly]``` -- close all tabs but the current one.

```:wa``` -- write (save) and on all tabs.

```:qa``` -- Quit all tabs.

```:wqa``` -- write (save) and quit on all tabs.

### Ctags

```Ctrl + ]``` -- Jump to definition (same as ```Ctrl + Left MouseClick```)

```Ctrl + t``` -- Jump back from definition (same as ```Ctrl + Right MouseClick```)

```Ctrl + W }``` -- Preview Definition

```g]``` -- See all definitions

```Ctrl + W Ctrl + ]``` -- Open the definition in a horizontal split

> Add these lines in vimrc
>
> map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
>
> map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
>
> ```Ctrl + \``` -- Open the definition in a new tab
>
> ```Alt + ]``` -- Open the definition in vertical split

#### Navigating through multiple definitions

```:tn[ext]``` -- Move to next definition

```:tp[revious]``` -- Move to previous definition

```:ts[elect]``` -- List all definitions

## Search and Replace

```/pattern``` -- Search for pattern.

```?pattern``` -- Search backward for pattern.

```n``` -- Repeat search in the same direction.

```N``` -- Repeat search in opposite direction.

```:%s/old/new/g``` -- Substitute all old with new in window.

```:%s/old/new/gc``` -- Substitute all old with new in window with confirmations.

```:noh[lsearch]``` -- Remove highlighting of search matches.

### Search in multiple files

```:vimgrep /pattern/ {file}``` -- search for pattern in multiple files (e.g.: ```vimgrep /foo/ **/*```).

```:cn[ext]``` -- Navigate to the next match.

```:cp[revious]``` -- Navigate to the previous match.

```:cfirst``` -- Navigate to the first match.

```:clast``` -- Navigate to the last match.

```:copen``` -- Open a window containing the list of matches.

## Quickfix list

```:copen``` -- Open the quick fix window.

```:ccl[ose]``` -- Close quickfix window.

```:cn[ext]``` -- Jump to next.

```:cp[revious]``` -- Jump to previous.

```:cfir[st]``` -- Jump to first.

```:cla[st]``` -- Jump to last.

## Autocomplete

```Ctrl + x Ctrl + n``` -- Autocomplete from just this file

```Ctrl + x Ctrl + f``` -- Autocomplete for file name

```Ctrl + x Ctrl + ]``` -- Autocomplete for tags only

```Ctrl + n``` -- Autocomplete for everything

Use ```Ctrl + n``` and ```Ctrl + p``` to got back and forth in the suggestion list