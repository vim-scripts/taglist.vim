" File: taglist.vim
" Author: Yegappan Lakshmanan (yegappan AT yahoo DOT com)
" Version: 2.6
" Last Modified: June 9, 2003
"
" Overview
" --------
" The "Tag List" plugin provides an overview of the structure of source code
" files and allows you to efficiently browse through source code files in
" different programming languages. The "Tag List" plugin provides the
" following features:
"
" 1. Opens a vertically/horizontally split Vim window with a list of tags
"    (functions, classes, structures, variables, etc) defined in the current
"    file.
" 2. Groups the tags by their type and displays them in a foldable tree.
" 3. Automatically updates the taglist window as you switch between
"    files/buffers.
" 4. When a tag name is selected from the taglist window, positions the cursor
"    at the definition of the tag in the source file
" 5. Automatically highlights the current tag name.
" 6. Can display the prototype of a tag from the taglist window.
" 7. Displays the scope of a tag.
" 8. Can optionally use the tag prototype instead of the tag name.
" 9. The tag list can be sorted either by name or by line number.
" 10. Supports the following language files: Assembly, ASP, Awk, Beta, C, C++,
"     C#, Cobol, Eiffel, Erlang, Fortran, HTML, Java, Javascript, Lisp, Lua,
"     Make, Pascal, Perl, PHP, Python, Rexx, Ruby, Scheme, Shell, Slang, SML,
"     Sql, TCL, Verilog, Vim and Yacc.
" 11. Runs in all the platforms where the exuberant ctags utility and Vim are
"     supported (this includes MS-Windows and Unix based systems).
" 12. Runs in both console/terminal and GUI versions of Vim.
" 13. The ctags output for a file is cached to speed up displaying the taglist
"     window.
" 14. Works with the winmanager plugin. Using the winmanager plugin, you can
"     use Vim plugins like the file explorer, buffer explorer and the taglist
"     plugin at the same time like an IDE.
" 15. Can be easily extended to support new languages. Support for existing
"     languages can be modified easily.
"
" To see the screenshots of the taglist plugin in different environments,
" visit the following page:
"
"       http://www.geocities.com/yegappan/taglist/screenshots.html
"
" This plugin relies on the exuberant ctags utility to dynamically generate
" the tag listing. You can download the exuberant ctags utility from
"
"               http://ctags.sourceforge.net
"
" The exuberant ctags utility must be installed in your system to use this
" plugin. You should use exuberant ctags version 5.0 and above.  This plugin
" doesn't use or create a tags file and there is no need to create a tags file
" to use this plugin.
"
" This plugin relies on the Vim "filetype" detection mechanism to determine
" the type of the current file. You have to turn on the Vim filetype detection
" by adding the following line to your .vimrc file:
"
"               filetype on
"
" This plugin will not work in 'compatible' mode.  Make sure the 'compatible'
" option is not set. This plugin will not work if you run Vim in the
" restricted mode (using the -Z command-line argument). This plugin also
" assumes that the system() Vim function is supported.
"
" Installation
" ------------
" 1. Copy the taglist.vim plugin to the $HOME/.vim/plugin directory. Refer to
"    ':help add-plugin', ':help add-global-plugin' and ':help runtimepath' for
"    more details about Vim plugins.
" 2. Set the Tlist_Ctags_Cmd variable to point to the location of the
"    exuberant ctags utility (not to the directory).
" 3. If you are running a terminal/console version of Vim and the terminal
"    doesn't support changing the window width then set the Tlist_Inc_Winwidth
"    variable to 0.
" 4. Restart Vim.
" 5. You can use the ":Tlist" command to open/close the taglist window. 
"
" Usage
" -----
" You can open the taglist window by using the ":Tlist" command. Invoking this
" command will toggle (open or close) the taglist window. You can map a key to
" invoke this command. For example, the following command creates a normal
" mode mapping for the <F8> key to open or close the taglist window.
"
"               nnoremap <silent> <F8> :Tlist<CR>
"
" Add the above mapping to your ~/.vimrc file.  You can also open the taglist
" window on startup using the following command line:
"
"               $ vim +Tlist
"
" You can close the taglist window from the taglist window by pressing 'q' or
" using the Vim ":q" command. You can also use any of the Vim window commands
" to close the taglist window. Invoking the ":Tlist" command when the taglist
" window is opened, will close the taglist window. You can also close the
" taglist window by invoking the ":TlistClose" command.
"
" As you switch between source files, the taglist window will be automatically
" updated with the tag listing for the current source file.  The tag names
" will grouped by their type (variable, function, class, etc). For tags with
" scope information (like class members, structures inside structures, etc),
" the scope information will be displayed in square brackets "[]" after the
" tagname.
" 
" The tag names will be  displayed as a foldable tree using the Vim folding
" support. You can collapse the tree using the '-' key or using the Vim zc
" fold command. You can open the tree using the '+' key or using the Vim zo
" fold command. You can open all the fold using the '*' key or using the Vim
" zR fold command You can also use the mouse to open/close the folds.
"
" You can select a tag either by pressing the <Enter> key or by double
" clicking the tag name using the mouse. You can configure the taglist plugin
" by setting the 'Tlist_Use_SingleClick' variable to jump to a tag on a single
" mouse click. You can press the 'o' key to jump to the tag in a new window.
" You can press the 'p' key to jump to the tag but still keep the cursor in
" the taglist window itself.
"
" This plugin will automatically highlight the name of the current tag.  The
" tag name will be highlighted after 'updatetime' milliseconds. The default
" value for this Vim option is 4 seconds.  You can also use the ":TlistSync"
" command to force the highlighting of the current tag. You can map a key to
" invoke this command. For example, the following command creates a normal
" mapping for the <F9> key to highlight the current tag name.
"
"               nnoremap <silent> <F9> :TlistSync<CR>
"
" Add the above mapping to your ~/.vimrc file.
"
" If you place the cursor on a tag name in the "Tag List" window, then the tag
" prototype will be displayed at the Vim status line after 'updatetime'
" milliseconds. The default value for the 'updatetime' Vim option is 4
" seconds. You can also press the space bar to display the prototype of the
" tag under the cursor.
"
" By default, the tag list will be sorted by the order in which the tags
" appear in the file. You can sort the tags either by name or by order by
" pressing the "s" key in the taglist window.
"
" You can press the 'x' key in the taglist window to maximize the taglist
" window width/height. The window will be maximized to the maximum possible
" width/height without closing the other existing windows. You can again press
" 'x' to restore the taglist window to the default width/height.
"
" You can press the '?' key to display help information about using the
" taglist window. If you again press the '?' key, the help information will be
" removed.
"
" The following table lists the description of the keys that you can use
" in the taglist window.
"
"       Key           Description
"
"       <CR>          Jump to the location where the tag under cursor is
"                     defined.
"       o             Jump to the location where the tag under cursor is
"                     defined in a new window.
"       p             Display the tag definition in the file window and
"                     keep the cursor in the taglist window itself.
"       <Space>       Display the prototype of the tag under the cursor.
"       u             Update the tags listed in the taglist window
"       s             Change the sort order of the tags (by name or by order)
"       x             Zoom-in or Zoom-out the taglist window
"       +             Open a fold
"       -             Close a fold
"       *             Open all folds
"       q             Close the taglist window
"       ?             Display help
"
"
" You can use the ":TlistShowPrototype" command to display the prototype of
" a function in the specified line number. For example,
"
"               :TlistShowPrototype 50
"
" If the line number is not supplied, this command will display the prototype
" of the current function.
"
" You can also use the taglist plugin with the winmanager plugin. This will
" allow you to use the file explorer, buffer explorer and the taglist plugin
" at the same time in different windows. To use the taglist plugin with the
" winmanager plugin, set 'TagList' in the 'winManagerWindowLayout' variable.
" For example, to use the file explorer plugin and the taglist plugin at the
" same time, use the following setting:
"
"               let winManagerWindowLayout = 'FileExplorer|TagList'
"
" Configuration
" -------------
" By changing the following variables you can configure the behavior of this
" plugin. Set the following variables in your .vimrc file using the 'let'
" command.
"
" This plugin uses the Tlist_Ctags_Cmd variable to locate the ctags utility.
" By default, this is set to ctags. Set this variable to point to the location
" of the ctags utility in your system. Note that this variable should point to
" the fully qualified exuberant ctags location and NOT to the directory in
" which exuberant ctags is installed.
"
"               let Tlist_Ctags_Cmd = 'd:\tools\ctags.exe'
"               let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
"
" By default, the tag names will be listed in the order in which they are
" defined in the file. You can alphabetically sort the tag names by pressing
" the "s" key in the taglist window. You can also change the default order by
" setting the variable Tlist_Sort_Type to "name" or "order":
"
"               let Tlist_Sort_Type = "name"
"
" Be default, the tag names will be listed in a vertically split window.  If
" you prefer a horizontally split window, then set the
" 'Tlist_Use_Horiz_Window' variable to 1. If you are running MS-Windows
" version of Vim in a MS-DOS command window, then you should use a
" horizontally split window instead of a vertically split window.  Also, if
" you are using an older version of xterm in a Unix system that doesn't
" support changing the xterm window width, you should use a horizontally split
" window.
"
"               let Tlist_Use_Horiz_Window = 1
"
" By default, the vertically split taglist window will appear on the left hand
" side. If you prefer to open the window on the right hand side, you can set
" the Tlist_Use_Right_Window variable to one:
"
"               let Tlist_Use_Right_Window = 1
"
" To automatically open the taglist window, when you start Vim, you can set
" the Tlist_Auto_Open variable to 1. By default, this variable is set to 0 and
" the taglist window will not be opened automatically on Vim startup.
"
"               let Tlist_Auto_Open = 1
"
" By default, only the tag name will be displayed in the taglist window. If
" you like to see tag prototypes instead of names, set the
" Tlist_Display_Prototype variable to 1. By default, this variable is set to 0
" and only tag names will be displayed.
"
"               let Tlist_Display_Prototype = 1
"
" The default width of the vertically split taglist window will be 30.  This
" can be changed by modifying the Tlist_WinWidth variable:
"
"               let Tlist_WinWidth = 20
"
" Note that the value of the 'winwidth' option setting determines the minimum
" width of the current window. If you set the 'Tlist_WinWidth' variable to a
" value less than that of the 'winwidth' option setting, then Vim will use the
" value of the 'winwidth' option.
"
" By default, when the width of the window is less than 100 and a new taglist
" window is opened vertically, then the window width will be increased by the
" value set in the Tlist_WinWidth variable to accommodate the new window.  The
" value of this variable is used only if you are using a vertically split
" taglist window.  If your terminal doesn't support changing the window width
" from Vim (older version of xterm running in a Unix system) or if you see any
" weird problems in the screen due to the change in the window width or if you
" prefer not to adjust the window width then set the 'Tlist_Inc_Winwidth'
" variable to 0.  CAUTION: If you are using the MS-Windows version of Vim in a
" MS-DOS command window then you must set this variable to 0, otherwise the
" system may hang due to a Vim limitation (explained in :help win32-problems)
"
"               let Tlist_Inc_Winwidth = 0
"
" By default, when you double click on the tag name using the left mouse 
" button, the cursor will be positioned at the definition of the tag. You 
" can set the Tlist_Use_SingleClick variable to one to jump to a tag when
" you single click on the tag name using the mouse. By default this variable
" is set to zero.
"
"               let Tlist_Use_SingleClick = 1
"
" Due to a bug in Vim, if you set Tlist_Use_SingleClick to one and try to
" resize the taglist window using the mouse, then Vim will crash. The fix for
" this bug will be available in the next version of Vim. In the meantime,
" instead of resizing the taglist window using the mouse, you can use normal
" Vim window resizing commands to resize the taglist window.
"
" By default, the taglist window will contain text that display the name of
" the file, sort order information and the key to press to get help. Also,
" empty lines will be used to separate different groups of tags. If you
" don't need these information, you can set the Tlist_Compact_Format variable
" to one to get a compact display.
"
"               let Tlist_Compact_Format = 1
"
" If you want to exit Vim if only the taglist window is currently open, then
" set the Tlist_Exit_OnlyWindow variable to one. By default, this variable is
" set to zero and the Vim instance will not be closed if only the taglist
" window is open.
"
"               let Tlist_Exit_OnlyWindow = 1
"
" Extending
" ---------
" You can extend exuberant ctags to add support for new languages. For more
" information, visit the following page
"
"               http://ctags.sourceforge.net/EXTENDING.html
"
" You can extend the taglist plugin to add support for new languages or modify
" the support for an already supported language by setting the following
" variables in the .vimrc file.
"
" To modify the support for an already supported language, you have to set the
" tlist_xxx_settings variable. Replace xxx with the Vim filetype name.  To
" determine the filetype name used by Vim for a file, use the command
"
"               :set filetype
"
" The format of the value set in the tlist_xxx_settings variable is
"
"          <language_name>;flag1:name1;flag2:name2;flag3:name3
"
" The different fields are separated by the ';' character.  The first field
" 'language_name' is the name used by exuberant ctags. This name can be
" different from the file type name used by Vim. For example, for C++, the
" language name used by ctags is 'c++' but the filetype name used by Vim is
" 'cpp'. The remaining fields follow the format "flag:name". The sub-field
" 'flag' is the language specific flag used by exuberant ctags to generate the
" corresponding tags.  For example, for the C language, to list only the
" functions, the 'f' flag should be used. For more information about the flags
" supported by exuberant ctags for a particular language, read the help text
" from the 'ctags --help' comand. The sub-field 'name' specifies the title
" text to use for displaying the tags of a particular type. For example,
" 'name' can be set to 'functions'.
"
" For example, to list only the classes and functions defined in a C++
" language file, add the following lines to your .vimrc file
"
"       let tlist_cpp_settings = 'c++;c:class;f:function'
"
" In the above setting, 'cpp' is the Vim filetype name and 'c++' is the name
" used by the exuberant ctags tool. 'c' and 'f' are the flags passed to
" exuberant ctags to list classes and functions.
"
" For example, to display only functions defined in a C file and to use "My
" Functions" as the title for the function group, use 
"
"       let tlist_c_settings = 'c;f:My Functions'
"
" To add support for a new language, set the tlist_xxx_settings variable
" appropriately as described above.
"
" ****************** Do not modify after this line ************************
if exists('loaded_taglist') || &cp
    finish
endif
let loaded_taglist=1

" Location of the exuberant ctags tool
if !exists('Tlist_Ctags_Cmd')
    let Tlist_Ctags_Cmd = 'ctags'
endif

" Tag listing sort type - 'name' or 'order'
if !exists('Tlist_Sort_Type')
    let Tlist_Sort_Type = 'order'
endif

" Tag listing window split (horizontal/vertical) control
if !exists('Tlist_Use_Horiz_Window')
    let Tlist_Use_Horiz_Window = 0
endif

" Open the vertically split taglist window on the left or on the right side.
" This setting is relevant only if Tlist_Use_Horiz_Window is set to zero (i.e.
" only for vertically split windows)
if !exists('Tlist_Use_Right_Window')
    let Tlist_Use_Right_Window = 0
endif

" Increase Vim window width to display vertically split taglist window.  For
" MS-Windows version of Vim running in a MS-DOS window, this must be set to 0
" otherwise the system may hang due to a Vim limitation.
if !exists('Tlist_Inc_Winwidth')
    if (has('win16') || has('win95')) && !has('gui_running')
        let Tlist_Inc_Winwidth = 0
    else
        let Tlist_Inc_Winwidth = 1
    endif
endif

" Vertically split taglist window width setting
if !exists('Tlist_WinWidth')
    let Tlist_WinWidth = 30
endif

" Horizontally split taglist window height setting
if !exists('Tlist_WinHeight')
    let Tlist_WinHeight = 10
endif

" Automatically open the taglist window on Vim startup
if !exists('Tlist_Auto_Open')
    let Tlist_Auto_Open = 0
endif

" Display tag prototypes or tag names in the taglist window
if !exists('Tlist_Display_Prototype')
    let Tlist_Display_Prototype = 0
endif

" Use single left mouse click to jump to a tag. By default this is disabled.
" Only double click using the mouse will be processed.
if !exists('Tlist_Use_SingleClick')
    let Tlist_Use_SingleClick = 0
endif

" Control whether additional help is displayed as part of the taglist or not.
" Also, controls whether empty lines are used to separate the tag tree.
if !exists('Tlist_Compact_Format')
    let Tlist_Compact_Format = 0
endif

" Exit Vim if only the taglist window is currently open. By default, this is
" set to zero.
if !exists('Tlist_Exit_OnlyWindow')
    let Tlist_Exit_OnlyWindow = 0
endif

" assembly language
let s:tlist_def_asm_settings = 'asm;d:define;l:label;m:macro;t:type'

" aspperl language
let s:tlist_def_aspperl_settings = 'asp;f:function;s:sub;v:variable'

" aspvbs language
let s:tlist_def_aspvbs_settings = 'asp;f:function;s:sub;v:variable'

" awk language
let s:tlist_def_awk_settings = 'awk;f:function'

" beta language
let s:tlist_def_beta_settings = 'beta;f:fragment;s:pattern;v:virtual'

" c language
let s:tlist_def_c_settings = 'c;d:macro;g:enum;s:struct;u:union;t:typedef;' .
                           \ 'v:variable;f:function'

" c++ language
let s:tlist_def_cpp_settings = 'c++;v:variable;d:macro;t:typedef;c:class;' .
                             \ 'n:namespace;g:enum;s:struct;u:union;f:function'

" c# language
let s:tlist_def_cs_settings = 'c#;d:macro;t:typedef;n:namespace;c:class;' .
                             \ 'E:event;g:enum;s:struct;i:interface;' .
                             \ 'p:properties;m:method'

" cobol language
let s:tlist_def_cobol_settings = 'cobol;d:data;f:file;g:group;p:paragraph;' .
                               \ 'P:program;s:section'

" eiffel language
let s:tlist_def_eiffel_settings = 'eiffel;c:class;f:feature'

" erlang language
let s:tlist_def_erlang_settings = 'erlang;d:macro;r:record;m:module;f:function'

" fortran language
let s:tlist_def_fortran_settings = 'fortran;p:program;b:block data;' .
                    \ 'c:common;e:entry;i:interface;k:type;l:label;m:module;' .
                    \ 'n:namelist;t:derived;v:variable;f:function;s:subroutine'

" HTML language
let s:tlist_def_html_settings = 'html;a:anchor;f:javascript function'

" java language
let s:tlist_def_java_settings = 'java;p:package;c:class;i:interface;' .
                              \ 'f:field;m:method'

" javascript language
let s:tlist_def_javascript_settings = 'javascript;f:function'

" lisp language
let s:tlist_def_lisp_settings = 'lisp;f:function'

" lua language
let s:tlist_def_lua_settings = 'lua;f:function'

" makefiles
let s:tlist_def_make_settings = 'make;m:macro'

" pascal language
let s:tlist_def_pascal_settings = 'pascal;f:function;p:procedure'

" perl language
let s:tlist_def_perl_settings = 'perl;p:package;s:subroutine'

" php language
let s:tlist_def_php_settings = 'php;c:class;f:function'

" python language
let s:tlist_def_python_settings = 'python;c:class;m:member;f:function'

" rexx language
let s:tlist_def_rexx_settings = 'rexx;s:subroutine'

" ruby language
let s:tlist_def_ruby_settings = 'ruby;c:class;f:method;F:function;' .
                              \ 'm:singleton method'

" scheme language
let s:tlist_def_scheme_settings = 'scheme;s:set;f:function'

" shell language
let s:tlist_def_sh_settings = 'sh;f:function'

" C shell language
let s:tlist_def_csh_settings = 'sh;f:function'

" Z shell language
let s:tlist_def_zsh_settings = 'sh;f:function'

" slang language
let s:tlist_def_slang_settings = 'slang;n:namespace;f:function'

" sml language
let s:tlist_def_sml_settings = 'sml;e:exception;c:functor;s:signature;' .
                             \ 'r:structure;t:type;v:value;f:function'

" sql language
let s:tlist_def_sql_settings = 'sql;c:cursor;F:field;P:package;r:record;' .
            \ 's:subtype;t:table;T:trigger;v:variable;f:function;p:procedure'

" tcl language
let s:tlist_def_tcl_settings = 'tcl;c:class;f:method;p:procedure'

"verilog language
let s:tlist_def_verilog_settings = 'verilog;m:module;P:parameter;r:register;' .
                                 \ 't:task;w:write;p:port;v:variable;f:function'

" vim language
let s:tlist_def_vim_settings = 'vim;a:autocmds;v:variable;f:function'

" yacc language
let s:tlist_def_yacc_settings = 'yacc;l:label'

" Initialize the taglist script local variables for the supported file types
" and tag types
let s:tlist_winsize_chgd = 0
let s:tlist_win_maximized = 0
let s:tlist_part_of_winmanager = 0
" Do not change the name of the taglist title variable. The winmanager plugin
" relies on this name to determine the title for the taglist plugin.
let TagList_title = "__Tag_List__"

function! s:Tlist_Show_Help()
    if g:Tlist_Compact_Format == 1
        " In compact display mode, do not display help
        return
    endif
    if exists("s:tlist_show_help") && s:tlist_show_help == 1
        let s:tlist_show_help = 0
    else
        let s:tlist_show_help = 1
    endif

    call s:Tlist_Open_Window()

    call s:Tlist_Init_Window(b:tlist_bufnum)

    " Update the taglist window
    call s:Tlist_Explore_File(b:tlist_bufnum)
endfunction

" An autocommand is used to refresh the taglist window when entering any
" buffer. We don't want to refresh the taglist window if we are entering the
" file window from one of the taglist functions. The 'Tlist_Skip_Refresh'
" variable is used to skip the refresh of the taglist window
let s:Tlist_Skip_Refresh = 0

function! s:Tlist_Warning_Msg(msg)
    echohl WarningMsg
    echomsg a:msg
    echohl None
endfunction

" Tlist_Skip_Buffer()
" Check whether tag listing is supported for the specified buffer.
function! s:Tlist_Skip_Buffer(bufnum)
    " Skip buffers with 'buftype' set to nofile, nowrite, quickfix or help
    if getbufvar(a:bufnum, '&buftype') != ''
        return 1
    endif

    let ftype = getbufvar(a:bufnum, '&filetype')

    " Skip buffers with filetype not set
    if ftype == ''
        return 1
    endif

    " Skip files which are not supported by exuberant ctags
    " First check whether default settings for this filetype are available.
    " If it is not available, then check whether user specified settings are
    " available. If both are not available, then don't list the tags for this
    " filetype
    let var = 's:tlist_def_' . ftype . '_settings'
    if !exists(var)
        let var = 'g:tlist_' . ftype . '_settings'
        if !exists(var)
            return 1
        endif
    endif

    let filename = fnamemodify(bufname(a:bufnum), '%:p')

    " Skip buffers with no names
    if filename == ''
        return 1
    endif

    " Skip files which are not readable or files which are not yet stored
    " to the disk
    if !filereadable(filename)
        return 1
    endif

    return 0
endfunction

" Tlist_FileType_Init
" Initialize the ctags arguments and tag variable for the specified
" file type
function! s:Tlist_FileType_Init(ftype)
    " If the user didn't specify any settings, then use the default
    " ctags args. Otherwise, use the settings specified by the user
    let var = 'g:tlist_' . a:ftype . '_settings'
    if exists(var)
        " User specified ctags arguments
        let settings = {var} . ';'
    else
        " Default ctags arguments
        let var = 's:tlist_def_' . a:ftype . '_settings'
        if !exists(var)
            " No default settings for this file type. This filetype is
            " not supported
            return 0
        endif
        let settings = s:tlist_def_{a:ftype}_settings . ';'
    endif

    let msg = 'Invalid ctags option setting - ' . settings

    " Extract the file type to pass to ctags. This can be different from the
    " file type detected by Vim
    let pos = stridx(settings, ';')
    if pos == -1
        call s:Tlist_Warning_Msg(msg)
        return 0
    endif
    let ctags_ftype = strpart(settings, 0, pos)
    if ctags_ftype == ''
        call s:Tlist_Warning_Msg(msg)
        return 0
    endif
    " Make sure a valid filetype is supplied. If the user didn't specify a
    " valid filetype, then the ctags option settings may be treated as the
    " filetype
    if ctags_ftype =~ ':'
        call s:Tlist_Warning_Msg(msg)
        return 0
    endif

    " Remove the file type from settings
    let settings = strpart(settings, pos + 1)
    if settings == ''
        call s:Tlist_Warning_Msg(msg)
        return 0
    endif

    " Process all the specified ctags flags. The format is
    " flag1:name1;flag2:name2;flag3:name3
    let ctags_flags = ''
    let cnt = 0
    while settings != ''
        " Extract the flag
        let pos = stridx(settings, ':')
        if pos == -1
            call s:Tlist_Warning_Msg(msg)
            return 0
        endif
        let flag = strpart(settings, 0, pos) 
        if flag == ''
            call s:Tlist_Warning_Msg(msg)
            return 0
        endif
        " Remove the flag from settings
        let settings = strpart(settings, pos + 1)

        " Extract the tag type name
        let pos = stridx(settings, ';')
        if pos == -1
            call s:Tlist_Warning_Msg(msg)
            return 0
        endif
        let name = strpart(settings, 0, pos)
        if name == ''
            call s:Tlist_Warning_Msg(msg)
            return 0
        endif
        let settings = strpart(settings, pos + 1)

        let cnt = cnt + 1

        let s:tlist_{a:ftype}_{cnt}_name = flag
        let s:tlist_{a:ftype}_{cnt}_fullname = name
        let ctags_flags = ctags_flags . flag
    endwhile

    let s:tlist_{a:ftype}_ctags_args = '--language-force=' . ctags_ftype .
                            \ ' --' . ctags_ftype . '-types=' . ctags_flags
    let s:tlist_{a:ftype}_count = cnt
    let s:tlist_{a:ftype}_ctags_flags = ctags_flags

    return 1
endfunction

" Tlist_Cleanup()
" Cleanup all the taglist window variables.
function! s:Tlist_Cleanup()
    if has('syntax')
        silent! syntax clear TagListTitle
    endif
    match none

    if exists('b:tlist_ftype') && b:tlist_ftype != ''
        let count_var_name = 's:tlist_' . b:tlist_ftype . '_count'
        if exists(count_var_name)
            let old_ftype = b:tlist_ftype
            let i = 1
            while i <= s:tlist_{old_ftype}_count
                let ttype = s:tlist_{old_ftype}_{i}_name
                let j = 1
                let var_name = 'b:tlist_' . old_ftype . '_' . ttype . '_count'
                if exists(var_name)
                    let cnt = b:tlist_{old_ftype}_{ttype}_count
                else
                    let cnt = 0
                endif
                while j <= cnt
                    unlet! b:tlist_{old_ftype}_{ttype}_{j}
                    let j = j + 1
                endwhile
                unlet! b:tlist_{old_ftype}_{ttype}_count
                unlet! b:tlist_{old_ftype}_{ttype}_start
                let i = i + 1
            endwhile
        endif
    endif

    " Clean up all the variables containing the tags output
    if exists('b:tlist_tag_count')
        while b:tlist_tag_count > 0
            unlet! b:tlist_tag_{b:tlist_tag_count}
            let b:tlist_tag_count = b:tlist_tag_count - 1
        endwhile
    endif

    unlet! b:tlist_bufnum
    unlet! b:tlist_bufname
    unlet! b:tlist_ftype
endfunction

" Tlist_Open_Window
" Create a new taglist window. If it is already open, clear it
function! s:Tlist_Open_Window()
    " If used with winmanager don't open windows. Winmanager will handle
    " the window/buffer management
    if s:tlist_part_of_winmanager
        return
    endif

    " Cleanup the taglist window listing, if the window is open
    let winnum = bufwinnr(g:TagList_title)
    if winnum != -1
        " Jump to the existing window
        if winnr() != winnum
            exe winnum . 'wincmd w'
        endif
    else
        " Create a new window. If user prefers a horizontal window, then open
        " a horizontally split window. Otherwise open a vertically split
        " window
        if g:Tlist_Use_Horiz_Window == 1
            " If a single window is used for all files, then open the tag
            " listing window at the very bottom
            let win_dir = 'botright'
            " Horizontal window height
            let win_size = g:Tlist_WinHeight
        else
            " Increase the window size, if needed, to accomodate the new
            " window
            if g:Tlist_Inc_Winwidth == 1 &&
                        \ &columns < (80 + g:Tlist_WinWidth)
                " one extra column is needed to include the vertical split
                let &columns= &columns + (g:Tlist_WinWidth + 1)
                let s:tlist_winsize_chgd = 1
            else
                let s:tlist_winsize_chgd = 0
            endif

            " Open the window at the leftmost place
            if g:Tlist_Use_Right_Window == 1
                let win_dir = 'botright vertical'
            else
                let win_dir = 'topleft vertical'
            endif
            let win_size = g:Tlist_WinWidth
        endif

        " If the tag listing temporary buffer already exists, then reuse it.
        " Otherwise create a new buffer
        let bufnum = bufnr(g:TagList_title)
        if bufnum == -1
            " Create a new buffer
            let wcmd = g:TagList_title
        else
            " Edit the existing buffer
            let wcmd = '+buffer' . bufnum
        endif

        " Create the taglist window
        exe 'silent! ' . win_dir . ' ' . win_size . 'split ' . wcmd
    endif
endfunction

" Tlist_Zoom_Window
" Zoom (maximize/minimize) the taglist window
function! s:Tlist_Zoom_Window()
    if s:tlist_win_maximized == 1
        if g:Tlist_Use_Horiz_Window == 1
            exe 'resize ' . g:Tlist_WinHeight
        else
            exe 'vert resize ' . g:Tlist_WinWidth
        endif
        let s:tlist_win_maximized = 0
    else
        " Set the window size to the maximum possible without closing other
        " windows
        if g:Tlist_Use_Horiz_Window == 1
            resize
        else
            vert resize
        endif
        let s:tlist_win_maximized = 1
    endif
endfunction

" Tlist_Init_Window
" Set the default options for the taglist window
function! s:Tlist_Init_Window(bufnum)
    " Set report option to a huge value to prevent informations messages
    " while deleting the lines
    let old_report = &report
    set report=99999

    " Mark the buffer as modifiable
    setlocal modifiable

    " Delete the contents of the buffer to the black-hole register
    silent! %delete _

    " Mark the buffer as not modifiable
    setlocal nomodifiable

    " Restore the report option
    let &report = old_report

    " Clean up all the old variables used for the last filetype
    call <SID>Tlist_Cleanup()

    let filename = fnamemodify(bufname(a:bufnum), ':p')

    " Set the sort type. First time, use the global setting. After that use
    " the previous setting
    let b:tlist_sort_type = getbufvar(a:bufnum, 'tlist_sort_type')
    if b:tlist_sort_type == ''
        let b:tlist_sort_type = g:Tlist_Sort_Type
    endif

    let b:tlist_tag_count = 0
    let b:tlist_bufnum = a:bufnum
    let b:tlist_bufname = fnamemodify(bufname(a:bufnum), ':p')
    let b:tlist_ftype = getbufvar(a:bufnum, '&filetype')

    " Mark the buffer as modifiable
    setlocal modifiable

    if s:tlist_part_of_winmanager
        " To handle a bug in the winmanager plugin, add a space at the
        " last line
        call setline('$', ' ')
    endif

    if g:Tlist_Compact_Format == 0
        if exists("s:tlist_show_help") && s:tlist_show_help == 1
            call append(0, '" <enter> : Jump to tag definition')
            call append(1, '" o : Jump to tag definition in new window')
            call append(2, '" p : Preview the tag definition')
            call append(3, '" <space> : Display tag prototype')
            call append(4, '" u : Update tag list')
            call append(5, '" s : Select sort field')
            call append(6, '" x : Zoom-out/Zoom-in taglist window')
            call append(7, '" + : Open a fold')
            call append(8, '" - : Close a fold')
            call append(9, '" * : Open all folds')
            call append(10, '" q : Close the taglist window')
            call append(11, '" ? : Remove help text')
            call append(12, '" Sorted by ' . b:tlist_sort_type)
            call append(13, '"= ' . fnamemodify(filename, ':t') . ' (' . 
                                   \ fnamemodify(filename, ':p:h') . ')')
        else
            call append(0, '" Press ? to display help text')
            call append(1, '" Sorted by ' . b:tlist_sort_type)
            call append(2, '"= ' . fnamemodify(filename, ':t') . ' (' . 
                                   \ fnamemodify(filename, ':p:h') . ')')
        endif
    endif

    " Mark the buffer as not modifiable
    setlocal nomodifiable

    " Highlight the comments
    if has('syntax')
        syntax match TagListComment '^" .*'
        syntax match TagListSortBy  '^" Sorted by .*'
        syntax match TagListCurDir  '^"= .*'
        syntax match TagScope  '\s\[.\{-\}\]$'

        " Colors used to highlight the selected tag name
        highlight clear TagName
        if has('gui_running') || &t_Co > 2
            highlight link TagName Search
        else
            highlight TagName term=reverse cterm=reverse
        endif

        " Colors to highlight comments and titles
        highlight clear TagListComment
        highlight link TagListComment Comment
        highlight clear TagListTitle
        highlight link TagListTitle Title
        highlight clear TagListSortBy
        highlight link TagListSortBy String
        highlight clear TagListCurDir
        highlight link TagListCurDir Statement
        highlight clear TagScope
        highlight link TagScope Identifier
    endif

    " Folding related settings
    if has('folding')
        setlocal foldenable
        setlocal foldmethod=manual
        setlocal foldcolumn=2
        setlocal foldtext=v:folddashes.getline(v:foldstart)
    endif

    if !s:tlist_part_of_winmanager
    " Mark buffer as scratch
    silent! setlocal buftype=nofile
    silent! setlocal bufhidden=delete
    silent! setlocal noswapfile
    " Due to a bug in Vim 6.0, the winbufnr() function fails for unlisted
    " buffers. So if the taglist buffer is unlisted, multiple taglist
    " windows will be opened. This bug is fixed in Vim 6.1 and above
    if v:version >= 601
        silent! setlocal nobuflisted
    endif
    endif

    silent! setlocal nowrap

    " If the 'number' option is set in the source window, it will affect the
    " taglist window. So forcefully disable 'number' option for the taglist
    " window
    silent! setlocal nonumber

    " Create buffer local mappings for jumping to the tags and sorting the list
    nnoremap <buffer> <silent> <CR> :call <SID>Tlist_Jump_To_Tag(0)<CR>
    nnoremap <buffer> <silent> o :call <SID>Tlist_Jump_To_Tag(1)<CR>
    nnoremap <buffer> <silent> p :call <SID>Tlist_Jump_To_Tag(2)<CR>
    nnoremap <buffer> <silent> <2-LeftMouse> :call <SID>Tlist_Jump_To_Tag(0)<CR>
    nnoremap <buffer> <silent> s :call <SID>Tlist_Change_Sort()<CR>
    nnoremap <buffer> <silent> + :silent! foldopen<CR>
    nnoremap <buffer> <silent> - :silent! foldclose<CR>
    nnoremap <buffer> <silent> * :silent! %foldopen!<CR>
    nnoremap <buffer> <silent> <kPlus> :silent! foldopen<CR>
    nnoremap <buffer> <silent> <kMinus> :silent! foldclose<CR>
    nnoremap <buffer> <silent> <kMultiply> :silent! %foldopen!<CR>
    nnoremap <buffer> <silent> <Space> :call <SID>Tlist_Show_Tag_Prototype()<CR>
    nnoremap <buffer> <silent> u :call <SID>Tlist_Update_Window()<CR>
    nnoremap <buffer> <silent> x :call <SID>Tlist_Zoom_Window()<CR>
    nnoremap <buffer> <silent> ? :call <SID>Tlist_Show_Help()<CR>
    nnoremap <buffer> <silent> q :close<CR>

    " Insert mode mappings
    inoremap <buffer> <silent> <CR>    <C-o>:call <SID>Tlist_Jump_To_Tag(0)<CR>
    " Windows needs return
    inoremap <buffer> <silent> <Return> <C-o>:call <SID>Tlist_Jump_To_Tag(0)<CR>
    inoremap <buffer> <silent> o        <C-o>:call <SID>Tlist_Jump_To_Tag(1)<CR>
    inoremap <buffer> <silent> p        <C-o>:call <SID>Tlist_Jump_To_Tag(2)<CR>
    inoremap <buffer> <silent> <2-LeftMouse> <C-o>:call 
                                            \ <SID>Tlist_Jump_To_Tag(0)<CR>
    inoremap <buffer> <silent> s        <C-o>:call <SID>Tlist_Change_Sort()<CR>
    inoremap <buffer> <silent> +             <C-o>:silent! foldopen<CR>
    inoremap <buffer> <silent> -             <C-o>:silent! foldclose<CR>
    inoremap <buffer> <silent> *             <C-o>:silent! %foldopen!<CR>
    inoremap <buffer> <silent> <kPlus>       <C-o>:silent! foldopen<CR>
    inoremap <buffer> <silent> <kMinus>      <C-o>:silent! foldclose<CR>
    inoremap <buffer> <silent> <kMultiply>   <C-o>:silent! %foldopen!<CR>
    inoremap <buffer> <silent> <Space>       <C-o>:call 
                                    \ <SID>Tlist_Show_Tag_Prototype()<CR>
    inoremap <buffer> <silent> u    <C-o>:call <SID>Tlist_Update_Window()<CR>
    inoremap <buffer> <silent> ?    <C-o>:call <SID>Tlist_Show_Help()<CR>
    inoremap <buffer> <silent> q    <C-o>:close<CR>
 

    " Map single left mouse click if the user wants this functionality
    if g:Tlist_Use_SingleClick == 1
    nnoremap <silent> <LeftMouse> <LeftMouse>:if bufname("%") =~ "__Tag_List__"
                        \ <bar> call <SID>Tlist_Jump_To_Tag(0) <bar> endif <CR>
    endif

    " Define the autocommand to highlight the current tag
    augroup TagListAutoCmds
        autocmd!
        " Display the tag prototype for the tag under the cursor.
        autocmd CursorHold __Tag_List__ call s:Tlist_Show_Tag_Prototype()
        " Highlight the current tag 
        autocmd CursorHold * silent call <SID>Tlist_Highlight_Tag(bufnr('%'), 
                                        \ line('.'))
        autocmd BufUnload __Tag_List__ call <SID>Tlist_Post_Close_Cleanup()
        autocmd BufEnter __Tag_List__ call <SID>Tlist_Check_Only_Window()
        if !s:tlist_part_of_winmanager
        " Adjust the Vim window width when taglist window is closed
        " Auto refresh the taglisting window
        autocmd BufEnter * call <SID>Tlist_Refresh_Window()
        endif
    augroup end
endfunction

" Tlist_Post_Close_Cleanup()
" Close the taglist window and adjust the Vim window width
function! s:Tlist_Post_Close_Cleanup()
    " Remove the autocommands for the taglist window
    silent! autocmd! TagListAutoCmds

    " Clear all the highlights
    match none

    if has('syntax')
        silent! syntax clear TagListTitle
    endif

    " Remove the left mouse click mapping if it was setup initially
    if g:Tlist_Use_SingleClick == 1
        if hasmapto('<LeftMouse>')
            nunmap <LeftMouse>
        endif
    endif

    if !s:tlist_part_of_winmanager
    if g:Tlist_Use_Horiz_Window || g:Tlist_Inc_Winwidth == 0 ||
                \ s:tlist_winsize_chgd == 0 ||
                \ &columns < (80 + g:Tlist_WinWidth)
        " No need to adjust window width if horizontally split tag listing
        " window or if columns is less than 101 or if the user chose not to
        " adjust the window width
    else
        " Adjust the Vim window width
        let &columns= &columns - (g:Tlist_WinWidth + 1)
    endif
    endif
endfunction

" Tlist_Check_Only_Window
" Check if only the taglist window is opened currently. If the
" Tlist_Exit_OnlyWindow variable is set, then close the taglist window
function! s:Tlist_Check_Only_Window()
    if g:Tlist_Exit_OnlyWindow
        if winbufnr(2) == -1
            " If only the taglist window is currently open, then the buffer
            " number associated with window 2 will be -1.
            quit
        endif
    endif
endfunction

" Tlist_Explore_File()
" List the tags defined in the specified file in a Vim window
function! s:Tlist_Explore_File(bufnum)
    " Get the filename and file type
    let filename = fnamemodify(bufname(a:bufnum), ':p')
    let ftype = getbufvar(a:bufnum, '&filetype')

    " Check for valid filename and valid filetype
    if filename == '' || !filereadable(filename) || ftype == ''
        return
    endif

    " If the tag types for this filetype are not yet created, then create
    " them now
    let var = 's:tlist_' . ftype . '_count'
    if !exists(var)
        if s:Tlist_FileType_Init(ftype) == 0
            return
        endif
    endif

    " If the cached ctags output exists for the specified buffer, then use it.
    " Otherwise run ctags to get the output
    let valid_cache = getbufvar(a:bufnum, 'tlist_valid_cache')
    if valid_cache != ''
        " Load the cached processed tags output from the buffer local
        " variables
        let b:tlist_tag_count = getbufvar(a:bufnum, 'tlist_tag_count') + 0
        let i = 1
        while i <= b:tlist_tag_count
            let var_name = 'tlist_tag_' . i
            let b:tlist_tag_{i} =  getbufvar(a:bufnum, var_name)
            let i = i + 1
        endwhile

        let i = 1
        while i <= s:tlist_{ftype}_count
            let ttype = s:tlist_{ftype}_{i}_name
            let var_name = 'tlist_' . ttype . '_start'
            let b:tlist_{ftype}_{ttype}_start = 
                        \ getbufvar(a:bufnum, var_name) + 0
            let var_name = 'tlist_' . ttype . '_count'
            let cnt = getbufvar(a:bufnum, var_name) + 0
            let b:tlist_{ftype}_{ttype}_count = cnt
            let var_name = 'tlist_' . ttype
            let l:tlist_{ftype}_{ttype} = getbufvar(a:bufnum, var_name)
            let j = 1
            while j <= cnt
                let var_name = 'tlist_' . ttype . '_' . j
                let b:tlist_{ftype}_{ttype}_{j} = getbufvar(a:bufnum, var_name)
                let j = j + 1
            endwhile
            let i = i + 1
        endwhile
    else
        " Exuberant ctags arguments to generate a tag list
        let ctags_args = ' -f - --format=2 --excmd=pattern --fields=nks '

        " Form the ctags argument depending on the sort type 
        if b:tlist_sort_type == 'name'
            let ctags_args = ctags_args . ' --sort=yes '
        else
            let ctags_args = ctags_args . ' --sort=no '
        endif

        " Add the filetype specific arguments
        let ctags_args = ctags_args . ' ' . s:tlist_{ftype}_ctags_args

        " Ctags command to produce output with regexp for locating the tags
        let ctags_cmd = g:Tlist_Ctags_Cmd . ctags_args
        let ctags_cmd = ctags_cmd . ' "' . filename . '"'

        " In Windows 95, if not using cygwin, disable the 'shellslash'
        " option. Otherwise, this will cause problems when running the
        " ctags command.
        if has("win95") && !has("win32unix")
            let myshellslash = &shellslash
            set noshellslash
        endif

        " Run ctags and get the tag list
        let cmd_output = system(ctags_cmd)

        " Restore the value of the 'shellslash' option.
        if has("win95") && !has("win32unix")
            let &shellslash = myshellslash
        endif

        " Cache the ctags output with a buffer local variable
        call setbufvar(a:bufnum, 'tlist_valid_cache', 'Yes')
        call setbufvar(a:bufnum, 'tlist_sort_type', b:tlist_sort_type)

        " Handle errors
        if v:shell_error && cmd_output != ''
            call s:Tlist_Warning_Msg(cmd_output)
            return
        endif

        " No tags for current file
        if cmd_output == ''
            call s:Tlist_Warning_Msg('No tags found for ' . filename)
            return
        endif

        " Initialize variables for the new filetype
        let i = 1
        while i <= s:tlist_{ftype}_count
            let ttype = s:tlist_{ftype}_{i}_name
            let b:tlist_{ftype}_{ttype}_start = 0
            let b:tlist_{ftype}_{ttype}_count = 0
            let l:tlist_{ftype}_{ttype} = ''
            let i = i + 1
        endwhile

        " Process the ctags output one line at a time. Separate the tag output
        " based on the tag type and store it in the tag type variable
        while cmd_output != ''
            " Extract one line at a time
            let one_line = strpart(cmd_output, 0, stridx(cmd_output, "\n"))
            " Remove the line from the tags output
            let cmd_output = strpart(cmd_output, stridx(cmd_output, "\n") + 1)

            if one_line == ''
                " Line is not in proper tags format
                continue
            endif

            " Extract the tag type
            let ttype = s:Tlist_Extract_Tagtype(one_line)

            if ttype == ''
                " Line is not in proper tags format
                continue
            endif

            " make sure the tag type is supported
            if s:tlist_{ftype}_ctags_flags !~# ttype
                continue
            endif

            " Extract the tag name
            if g:Tlist_Display_Prototype == 0
                let ttxt = '  ' . strpart(one_line, 0, stridx(one_line, "\t"))

                " Add the tag scope, if it is available. Tag scope is the last
                " field after the 'line:<num>\t' field
                let start = strridx(one_line, 'line:')
                let end = strridx(one_line, "\t")
                if end > start
                    let tscope = strpart(one_line, end + 1)
                    let tscope = strpart(tscope, stridx(tscope, ':') + 1)
                    if tscope != ''
                        let ttxt = ttxt . ' [' . tscope . ']'
                    endif
                endif
            else
                let start = stridx(one_line, '/^') + 2
                let end = strridx(one_line, '/;"' . "\t")
                if one_line[end - 1] == '$'
                    let end = end -1
                endif
                let ttxt = strpart(one_line, start, end - start)
            endif

            " Update the count of this tag type
            let cnt = b:tlist_{ftype}_{ttype}_count + 1
            let b:tlist_{ftype}_{ttype}_count = cnt

            " Add this tag to the tag type variable
            let l:tlist_{ftype}_{ttype} = l:tlist_{ftype}_{ttype} . ttxt . "\n"

            " Update the total tag count
            let b:tlist_tag_count = b:tlist_tag_count + 1
            let b:tlist_tag_{b:tlist_tag_count} = cnt . ':' . one_line

            let b:tlist_{ftype}_{ttype}_{cnt} = b:tlist_tag_count
        endwhile

        " Cache the processed tags output using buffer local variables
        call setbufvar(a:bufnum, 'tlist_tag_count', b:tlist_tag_count)
        let i = 1
        while i <= b:tlist_tag_count
            let var_name = 'tlist_tag_' . i
            call setbufvar(a:bufnum, var_name, b:tlist_tag_{i})
            let i = i + 1
        endwhile

        let i = 1
        while i <= s:tlist_{ftype}_count
            let ttype = s:tlist_{ftype}_{i}_name
            let var_name = 'tlist_' . ttype . '_start'
            call setbufvar(a:bufnum, var_name, b:tlist_{ftype}_{ttype}_start)
            let cnt = b:tlist_{ftype}_{ttype}_count
            let var_name = 'tlist_' . ttype . '_count'
            call setbufvar(a:bufnum, var_name, cnt)
            let var_name = 'tlist_' . ttype
            call setbufvar(a:bufnum, var_name, l:tlist_{ftype}_{ttype})
            let j = 1
            while j <= cnt
                let var_name = 'tlist_' . ttype . '_' . j
                call setbufvar(a:bufnum, var_name, b:tlist_{ftype}_{ttype}_{j})
                let j = j + 1
            endwhile
            let i = i + 1
        endwhile
    endif

    " If we are using a hidden taglist window, then no need to update the
    " taglist window
    if exists("g:taglist_hidden")
        return
    endif

    " Set report option to a huge value to prevent informational messages
    " while adding lines to the taglist window
    let old_report = &report
    set report=99999

    " Mark the buffer as modifiable
    setlocal modifiable

    " Add the tag names grouped by tag type to the buffer with a title
    let i = 1
    while i <= s:tlist_{ftype}_count
        let ttype = s:tlist_{ftype}_{i}_name
        " Add the tag type only if there are tags for that type
        if l:tlist_{ftype}_{ttype} != ''
            if g:Tlist_Compact_Format == 0
                let b:tlist_{ftype}_{ttype}_start = line('.') + 1
                silent! put =s:tlist_{ftype}_{i}_fullname
            else
                let b:tlist_{ftype}_{ttype}_start = line('.')
                silent! put! =s:tlist_{ftype}_{i}_fullname
            endif
            silent! put =l:tlist_{ftype}_{ttype}

            " create a fold for this tag type
            if has('folding')
                let fold_start = b:tlist_{ftype}_{ttype}_start
                let fold_end = fold_start + b:tlist_{ftype}_{ttype}_count
                exe fold_start . ',' . fold_end  . 'fold'
            endif

            " Syntax highlight the tag type names
            if has('syntax')
                exe 'syntax match TagListTitle /\%' . 
                            \ b:tlist_{ftype}_{ttype}_start . 'l.*/'
            endif
            " Separate the tag types with a empty line
            normal! G
            if g:Tlist_Compact_Format == 0
                silent! put =''
            endif
        endif
        let i = i + 1
    endwhile

    if s:tlist_part_of_winmanager
        " To handle a bug in the winmanager plugin, add a space at the
        " last line
        call setline('$', ' ')
    endif

    " Mark the buffer as not modifiable
    setlocal nomodifiable

    " Restore the report option
    let &report = old_report

    " Initially open all the folds
    if has('folding')
        silent! %foldopen!
    endif

    " Goto the first line in the buffer
    go

    return
endfunction

" Tlist_Close_Window
" Close the taglist window
function! s:Tlist_Close_Window()
    " Make sure the taglist window exists
    let winnum = bufwinnr(g:TagList_title)
    if winnum != -1
        " Jump to the window if not already there
        if winnr() != winnum
            exe winnum . 'wincmd w'
        endif
        close
    endif
endfunction

" Tlist_Toggle_Window()
" Open or close a taglist window
function! s:Tlist_Toggle_Window(bufnum)
    let curline = line('.')

    " If taglist window is open then close it.
    let winnum = bufwinnr(g:TagList_title)
    if winnum != -1
        if winnr() == winnum
            " Already in the taglist window. Close it and return
            close
        else
            " Goto the taglist window, close it and then come back to the
            " original window
            let curbufnr = bufnr('%')
            exe winnum . 'wincmd w'
            close
            " Need to jump back to the original window only if we are not
            " already in that window
            let winnum = bufwinnr(curbufnr)
            if winnr() != winnum
                exe winnum . 'wincmd w'
            endif
        endif
        return
    endif

    let s:tlist_part_of_winmanager = 0

    " Open the taglist window
    call s:Tlist_Open_Window()

    " Initialize the taglist window
    call s:Tlist_Init_Window(a:bufnum)

    " List the tags defined in a file
    call s:Tlist_Explore_File(a:bufnum)

    " Highlight the current tag
    call s:Tlist_Highlight_Tag(a:bufnum, curline)

    " Go back to the original window
    let s:Tlist_Skip_Refresh = 1
    wincmd p
    let s:Tlist_Skip_Refresh = 0
endfunction

" Tlist_Extract_Tagtype
" Extract the tag type from the tag text
function! s:Tlist_Extract_Tagtype(tag_txt)
    " The tag type is after the tag prototype field. The prototype field
    " ends with the /;"\t string. We add 4 at the end to skip the characters
    " in this special string..
    let start = strridx(a:tag_txt, '/;"' . "\t") + 4
    let end = strridx(a:tag_txt, 'line:') - 1
    let ttype = strpart(a:tag_txt, start, end - start)

    return ttype
endfunction

" Tlist_Extract_Tag_Prototype
" Extract the tag protoype from the tag text
function! s:Tlist_Extract_Tag_Prototype(tag_txt)
    let start = stridx(a:tag_txt, '/^') + 2
    let end = strridx(a:tag_txt, '/;"' . "\t")
    if a:tag_txt[end - 1] == '$'
        let end = end -1
    endif
    let tag_pat = strpart(a:tag_txt, start, end - start)

    " Remove all the leading space characters
    let tag_pat = matchstr(tag_pat, '^\s*\zs.*')

    return tag_pat
endfunction

" Tlist_Refresh_Window()
" Refresh the taglist window
function! s:Tlist_Refresh_Window()
    " We are entering the buffer from one of the taglist functions. So no need
    " to refresh the taglist window again
    if s:Tlist_Skip_Refresh == 1
        return
    endif

    " If the buffer doesn't support tag listing, skip it
    if s:Tlist_Skip_Buffer(bufnr('%'))
        return
    endif

    let filename = expand('%:p')

    let curline = line('.')

    " Make sure the taglist window is open. Otherwise, no need to refresh
    let winnum = bufwinnr(g:TagList_title)
    if winnum == -1
        return
    endif

    let bno = bufnr(g:TagList_title)

    let cur_bufnr = bufnr('%')

    " If the tag listing for the current window is already present, no need to
    " refresh it
    if getbufvar(bno, 'tlist_bufnum') == cur_bufnr && 
                \ getbufvar(bno, 'tlist_bufname') == filename
        return
    endif

    " Save the current window number
    let cur_winnr = winnr()

    call s:Tlist_Open_Window()

    call s:Tlist_Init_Window(cur_bufnr)

    " Update the taglist window
    call s:Tlist_Explore_File(cur_bufnr)

    " Highlight the current tag
    call s:Tlist_Highlight_Tag(cur_bufnr, curline)

    " Refresh the taglist window
    redraw

    if !s:tlist_part_of_winmanager
    " Jump back to the original window
    exe cur_winnr . 'wincmd w'
    endif
endfunction

" Tlist_Change_Sort()
" Change the sort order of the tag listing
function! s:Tlist_Change_Sort()
    if !exists('b:tlist_bufnum') || !exists('b:tlist_ftype')
        return
    endif

    let sort_type = getbufvar(b:tlist_bufnum, 'tlist_sort_type')

    " Toggle the sort order from 'name' to 'order' and vice versa
    if sort_type == 'name'
        call setbufvar(b:tlist_bufnum, 'tlist_sort_type', 'order')
    else
        call setbufvar(b:tlist_bufnum, 'tlist_sort_type', 'name')
    endif

    " Save the current line for later restoration
    let curline = '\V\^' . getline('.') . '\$'

    " Clear out the cached taglist information
    call setbufvar(b:tlist_bufnum, 'tlist_valid_cache', '')

    call s:Tlist_Open_Window()

    call s:Tlist_Init_Window(b:tlist_bufnum)

    call s:Tlist_Explore_File(b:tlist_bufnum)

    " Go back to the tag line before the list is sorted
    call search(curline, 'w')
endfunction

" Tlist_Update_Window()
" Update the window by regenerating the tag list
function! s:Tlist_Update_Window()
    if !exists('b:tlist_bufnum') || !exists('b:tlist_ftype')
        return
    endif

    " Save the current line for later restoration
    let curline = '\V\^' . getline('.') . '\$'

    " Clear out the cached taglist information
    call setbufvar(b:tlist_bufnum, 'tlist_valid_cache', '')

    call s:Tlist_Open_Window()

    call s:Tlist_Init_Window(b:tlist_bufnum)

    " Update the taglist window
    call s:Tlist_Explore_File(b:tlist_bufnum)

    " Go back to the tag line before the list is sorted
    call search(curline, 'w')
endfunction

" Tlist_Get_Tag_Linenr()
" Return the tag line for the current line
function! s:Tlist_Get_Tag_Linenr()
    if !exists('b:tlist_ftype')
        return 0
    endif

    let lnum = line('.')
    let ftype = b:tlist_ftype

    " Determine to which tag type the current line number belongs to using the
    " tag type start line number and the number of tags in a tag type
    let i = 1
    while i <= s:tlist_{ftype}_count
        let ttype = s:tlist_{ftype}_{i}_name
        let end = b:tlist_{ftype}_{ttype}_start + b:tlist_{ftype}_{ttype}_count
        if lnum >= b:tlist_{ftype}_{ttype}_start && lnum <= end
            break
        endif
        let i = i + 1
    endwhile

    " Current line doesn't belong to any of the displayed tag types
    if i > s:tlist_{ftype}_count
        return 0
    endif

    " Compute the offset into the displayed tags for the tag type
    let offset = lnum - b:tlist_{ftype}_{ttype}_start
    if offset == 0
        return 0
    endif

    " Get the corresponding tag line and return it
    return b:tlist_{ftype}_{ttype}_{offset}
endfunction

function! s:Tlist_Highlight_Tagline()
    " Clear previously selected name
    match none

    " Highlight the current selected name
    if g:Tlist_Display_Prototype == 0
        exe 'match TagName /\%' . line('.') . 'l\s\+\zs.*/'
    else
        exe 'match TagName /\%' . line('.') . 'l.*/'
    endif
endfunction

" Tlist_Jump_To_Tag()
" Jump to the location of the current tag
" win_ctrl == 0 - Reuse the existing file window
" win_ctrl == 1 - Open a new window
" win_ctrl == 2 - Preview the tag
function! s:Tlist_Jump_To_Tag(win_ctrl)
    " Do not process comment lines and empty lines
    let curline = getline('.')
    if curline == '' || curline[0] == '"'
        return
    endif

    " If inside a fold, then don't try to jump to the tag
    if foldclosed('.') != -1
        return
    endif

    " Get the tag output for the current tag
    let lnum = s:Tlist_Get_Tag_Linenr()
    if lnum == 0
        return
    endif

    let mtxt = b:tlist_tag_{lnum}
    let start = stridx(mtxt, '/^') + 2
    let end = strridx(mtxt, '/;"' . "\t")
    if mtxt[end - 1] == '$'
        let end = end - 1
    endif
    let tagpat = '\V\^' . strpart(mtxt, start, end - start) .
                                        \ (mtxt[end] == '$' ? '\$' : '')

    " Highlight the tagline
    call s:Tlist_Highlight_Tagline()

    let s:Tlist_Skip_Refresh = 1

    if s:tlist_part_of_winmanager
        call WinManagerFileEdit(bufname(b:tlist_bufnum), a:win_ctrl)
    else
    " Goto the window containing the file.  If the window is not there, open a
    " new window
    let winnum = bufwinnr(b:tlist_bufnum)
    if winnum == -1
        if g:Tlist_Use_Horiz_Window == 1
            exe 'leftabove split #' . b:tlist_bufnum
            " Go to the taglist window to change the window size to the user
            " configured value
            wincmd p
            exe 'resize ' . g:Tlist_WinHeight
            " Go back to the file window
            wincmd p
        else
            " Open the file in a window and skip refreshing the taglist window
            exe 'rightbelow vertical split #' . b:tlist_bufnum
            " Go to the taglist window to change the window size to the user
            " configured value
            wincmd p
            exe 'vertical resize ' . g:Tlist_WinWidth
            " Go back to the file window
            wincmd p
        endif
    else
        exe winnum . 'wincmd w'

        " If the user asked to jump to the tag in a new window, then split the
        " existing window into two.
        if a:win_ctrl == 1
            split
        endif
    endif
    endif

    " Jump to the tag
    silent call search(tagpat, 'w')

    " Bring the line to the middle of the window
    normal! z.

    " If the line is inside a fold, open the fold
    if has('folding')
        if foldlevel('.') != 0
            normal zo
        endif
    endif

    " If the user selects to preview the tag then jump back to the
    " taglist window
    if a:win_ctrl == 2
        " Go back to the taglist window
        let winnum = bufwinnr(g:TagList_title)
        exe winnum . 'wincmd w'
    endif

    let s:Tlist_Skip_Refresh = 0
endfunction

" Tlist_Show_Tag_Prototype()
" Display the prototype of the tag under the cursor
function! s:Tlist_Show_Tag_Prototype()
    " If we have already display prototype in the tag window, no need to
    " display it in the status line
    if g:Tlist_Display_Prototype == 1
        return
    endif

    " Clear the previously displayed line
    echo

    " Do not process comment lines and empty lines
    let curline = getline('.')
    if curline == '' || curline[0] == '"'
        return
    endif

    " If inside a fold, then don't display the prototype
    if foldclosed('.') != -1
        return
    endif

    " Get the tag output line for the current tag
    let lnum = s:Tlist_Get_Tag_Linenr()
    if lnum == 0
        return
    endif

    let mtxt = b:tlist_tag_{lnum}

    " Get the tag search pattern and display it
    echo s:Tlist_Extract_Tag_Prototype(mtxt)
endfunction

" Tlist_Locate_Tag_Text
" Locate the tag text given the line number in the source window
function! s:Tlist_Locate_Tag_Text(sort_type, linenum)
    let left = 1
    let right = b:tlist_tag_count

    if a:sort_type == 'order'
        " Tag list sorted by order, do a binary search comparing the line
        " numbers

        " If the current line is the less than the first tag, then no need to
        " search
        let txt = b:tlist_tag_1
        let start = strridx(txt, 'line:') + strlen('line:')
        let end = strridx(txt, "\t")
        if end < start
            let first_lnum = strpart(txt, start) + 0
        else
            let first_lnum = strpart(txt, start, end - start) + 0
        endif

        if a:linenum < first_lnum
            return ""
        endif

        while left < right
            let middle = (right + left + 1) / 2
            let txt = b:tlist_tag_{middle}

            let start = strridx(txt, 'line:') + strlen('line:')
            let end = strridx(txt, "\t")
            if end < start
                let middle_lnum = strpart(txt, start) + 0
            else
                let middle_lnum = strpart(txt, start, end - start) + 0
            endif

            if middle_lnum == a:linenum
                let left = middle
                break
            endif

            if middle_lnum > a:linenum
                let right = middle - 1
            else
                let left = middle
            endif
        endwhile
    else
        " sorted by name, brute force method (Dave Eggum)
        let closest_lnum = 0
        let final_left = 0
        while left < right
            let txt = b:tlist_tag_{left}

            let start = strridx(txt, 'line:') + strlen('line:')
            let end = strridx(txt, "\t")
            if end < start
                let lnum = strpart(txt, start) + 0
            else
                let lnum = strpart(txt, start, end - start) + 0
            endif

            if lnum < a:linenum && lnum > closest_lnum
                let closest_lnum = lnum
                let final_left = left
            elseif lnum == a:linenum
                let closest_lnum = lnum
                break
            else
                let left = left + 1
            endif
        endwhile
        if closest_lnum == 0
            return ""
        endif
        if left == right
            let left = final_left
        endif
    endif

    return b:tlist_tag_{left}
endfunction

" Tlist_Highlight_Tag()
" Do a binary search in the array of tag names and pick a tag entry that
" contains the current line and highlight it.  The idea behind this function
" is taken from the ctags.vim script (by Alexey Marinichev) available at the
" Vim online website.
function! s:Tlist_Highlight_Tag(bufnum, curline)
    let filename = fnamemodify(bufname(a:bufnum), ':p')
    if filename == ''
        return
    endif

    " Make sure the taglist window is present
    let winnum = bufwinnr(g:TagList_title)
    if winnum == -1
        return
    endif

    let bno = bufnr(g:TagList_title)

    " Make sure we have the tag listing for the current file
    if getbufvar(bno, 'tlist_bufnum') != a:bufnum
        return
    endif

    " If there are no tags for this file, then no need to proceed further
    if getbufvar(bno, 'tlist_tag_count') == 0
        return
    endif

    " If part of winmanager then disable winmanager autocommands
    if s:tlist_part_of_winmanager
        call WinManagerSuspendAUs()
    endif

    " Save the original window number
    let org_winnr = winnr()

    if org_winnr == winnum
        let in_taglist_window = 1
    else
        let in_taglist_window = 0
    endif

    " Go to the taglist window
    if !in_taglist_window
        exe winnum . 'wincmd w'
    endif

    " Clear previously selected name
    match none

    let tag_txt = s:Tlist_Locate_Tag_Text(getbufvar(bno, 'tlist_sort_type'),
                                          \ a:curline)
    if tag_txt == ""
        if !in_taglist_window
            let s:Tlist_Skip_Refresh = 1
            exe org_winnr . 'wincmd w'
            let s:Tlist_Skip_Refresh = 0
        endif
        if s:tlist_part_of_winmanager
            call WinManagerResumeAUs()
        endif
        return
    endif

    " Extract the tag type
    let ttype = s:Tlist_Extract_Tagtype(tag_txt)

    " Extract the tag offset
    let offset = strpart(tag_txt, 0, stridx(tag_txt, ':')) + 0

    " Compute the line number
    let lnum = b:tlist_{b:tlist_ftype}_{ttype}_start + offset

    " Goto the line containing the tag
    exe lnum

    " Open the fold
    if has('folding')
        silent! .foldopen
    endif

    " Call winline() to make sure the target line is visible in the taglist
    " window. This is a side effect of calling winline(). Don't know of a
    " better way to achieve this.
    call winline()

    " Highlight the tag name
    call s:Tlist_Highlight_Tagline()

    " Go back to the original window
    if !in_taglist_window
        let s:Tlist_Skip_Refresh = 1
        exe org_winnr . 'wincmd w'
        let s:Tlist_Skip_Refresh = 0
    endif

    if s:tlist_part_of_winmanager
        call WinManagerResumeAUs()
    endif

    return
endfunction

" Tlist_Get_Tag_Prototype_By_Line
function! s:Tlist_Get_Tag_Prototype_By_Line(linenum)
    " Make sure the current file has a name
    let filename = fnamemodify(bufname("%"), ':p')
    if filename == ''
        return ""
    endif

    let linenr = a:linenum
    if linenr == ""
        " Default is the current line
        let linenr = line('.')
    endif

    " If there are no tags for this file, then no need to proceed further
    if !exists("b:tlist_tag_count") || b:tlist_tag_count == 0
        return ""
    endif

    " Get the tag text using the line number
    let tag_txt = s:Tlist_Locate_Tag_Text(b:tlist_sort_type, linenr)
    if tag_txt == ""
        return ""
    endif

    " Extract the tag search pattern and return it
    return s:Tlist_Extract_Tag_Prototype(tag_txt)
endfunction

" Define tag listing autocommand to automatically open the taglist window on
" Vim startup
if g:Tlist_Auto_Open
    autocmd VimEnter * nested Tlist
endif

" Define the user commands to manage the taglist window
command! -nargs=0 Tlist call s:Tlist_Toggle_Window(bufnr('%'))
command! -nargs=0 TlistClose call s:Tlist_Close_Window()
command! -nargs=0 TlistSync call s:Tlist_Highlight_Tag(bufnr('%'), line('.'))
command! -nargs=? TlistShowPrototype echo s:Tlist_Get_Tag_Prototype_By_Line(<q-args>)

" Winmanager integration

" Initialization required for integration with winmanager
function! TagList_Start()
    let s:tlist_part_of_winmanager = 1

    if bufname('%') != '__Tag_List__'
        return
    endif

    let bufnum = WinManagerGetLastEditedFile()

    " If the tags for the buffer is already listed, then no need to do
    " anything
    if exists('b:tlist_bufnum') && bufnum == b:tlist_bufnum
        return
    endif

    call s:Tlist_Init_Window(bufnum)

    " Open the taglist window
    call s:Tlist_Explore_File(bufnum)
endfunction

function! TagList_IsValid()
    return 0
endfunction

function! TagList_WrapUp()
    return 0
endfunction
