Vim Cheatsheet
============================================================

Add/Edit Text
------------------------------------------------------------

```i``` -- Insert before the cursor.

```I``` -- Insert at the beginning of the line.

```a``` -- Append after the cursor.

```A``` -- Append at the end of the line.

```o``` -- Open a new line below the current line.

```O``` -- Open a new line above the current line.

```r``` -- Replace single character.

```s``` -- Substitute text (delete character and switch to insert mode).

```S``` -- Substitute line and (same as ```cc```).

```ciw``` -- Change (replace) entire word.

```cw``` -- Change (replace) to the end of the word.

```cc``` -- Change entire line (same as ```S```).

```C``` -- Change to the end of the line (same as ```c$```).

```J``` -- Join line below to the current one with one space in between.

```gJ``` -- Join line below to the current one without space in between.

```gwip``` -- Reflow paragraph.

```u``` -- Undo.

```Ctrl + r``` -- Redo.

```.``` -- Repeat last command.

```~``` -- Switch case of character

```>>``` -- Indent line right.

```<<``` -- Indent line left.

Vim Navigation
------------------------------------------------------------

```k``` -- Move backward one line or ```nk``` to jump backward 'n' line.

```j``` -- Move forward one line or ```nj``` to jump forward 'n' line.

```l``` -- Move right side or ```nl``` to jump right 'n' columns.

```h``` -- Move left side or ```nk``` to jump left 'n' columns.

```e``` -- Jump to the end of a word.

```E``` -- Jump to the end of the WORD (any non-whitespace characters).

```b``` -- Jump backward to beginning of a word.

```B``` -- Jump backward to beginning of the WORD (any non-whitespace characters).

```w``` -- Jump forward to beginning of a word.

```W``` -- Jump forward to beginning of the WORD (any non-whitespace characters).

```0``` -- Jump to the beginning of the line.

```^``` -- Jump to the first non-blank character of the line.

```$``` -- Jump to the end of the line.

```g_``` -- Jump to the last non blank character of the line.

```%``` -- Jump to the matching braces, or parenthesis.

```{``` -- Jump backward one paragraph.

```}``` -- Jump forward one paragraph.

```)``` -- Jump forward one sentence.

```(``` -- Jump backward one sentence.

```fx``` -- Jump to next occurrence of character x.

```tx``` -- Jump to before next occurrence of character x.

```Fx``` -- Jump to previous occurence of character x.

```Tx``` -- Jump to after previous occurence of character x.

```;``` -- Repeat previous f, t, F or T movement.

```,``` -- Repeat previous f, t, F or T movement, backwards.

```n%``` -- Jump to the nth percentage line of the file.

```nG``` -- Jump to the nth line of the file.

```G``` -- Jump to the end of the file.

```gg``` -- Jump to the start of the file.

``` `”``` -- Jump to the position where you were in NORMAL MODE while last closing the file.

``` `^``` -- Jump to the position where you were in INSERT MODE while last closing the file.

```H``` -- Jump to the top (high) of the screen.

```M``` -- Jump to the middle (medium) of the screen.

```L``` -- Jump to the bottom (low) of the screen.

```ctrl + f``` -- Move forward one full screen.

```ctrl + b``` -- Move backwards one full screen.

```ctrl + d``` -- Move forward (down) a half screen.

```ctrl + u``` -- Move back (up) one half screen.

```Ctrl + e``` -- Move viewport up by single line.

```Ctrl + y``` -- Move viewport down by single line.

```zz``` -- Move current line to the centre of screen.

```zt``` -- Move current line to the top of screen.

```zb``` -- Move current line to the end of screen.

```g;``` -- Jump backward in change list.

```g,``` -- Jump forward in change list.

```ctrl-o``` -- Jump backwork in jump list.

```ctrl-i``` -- Jump forward in jump list.

```gt``` -- Go to next tab.

```gT``` -- Go to previous tab.

Copy/Cut Paste
------------------------------------------------------------
```yy``` -- Yank (copy) a line (same as ```Y```).

```nyy``` -- Yank (copy) n lines ( same as ```nY```).

```yw``` -- Yank word from the cursor position to the start of the next word.

```y$``` -- Yank to end of line.

```p``` -- Put (paste) the clipboard after cursor.

```P``` -- put (paste) before cursor.

```dd``` -- Delete a line.

```ndd``` -- Delete n lines.

```dw``` -- Delete the characters of the word from the cursor position to the start of the next word.

```D``` -- Delete to the end of the line (same as ```d$```).

```x``` -- Cut character.

Selection (Visual Mode)
------------------------------------------------------------
```v``` -- Start visual mode.

```V``` -- Start linewise visual mode.

```Ctrl + v``` -- Start visual block mode.

```o``` -- Move to other end of marked area.

```O``` -- Move to other corner of block.

> Use Navigation keys like ```h```, ```j```, ```k```, ```l```, ```w```, etc. to make/change selection.

```>``` -- Indent right.

```<``` -- Indent left.

```y``` -- Yank (copy) marked text.

```d``` -- Delete marked text (same as ```x```).

```~``` -- Switch case.

