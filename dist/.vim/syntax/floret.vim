

syntax match yamlAnchor '\v\&\S+'
syntax match yamlAlias '\v\*\S+'

syntax match yamlTag '\v!!\S*'
syntax match yamlLine '\v^\s*-?\s*\S+:?' contains=yamlKey,floretID,yamlDelim
syntax match yamlKey '\v\i+' contained 
syntax match yamlDelim '[:,-]' contained
syntax region floretID start='\v\[' end=']' contained

highlight default link yamlAnchor Function
highlight default link yamlAlias Function
highlight default link yamlTag Tag
highlight default link yamlKey Identifier
highlight default link yamlDelim Delimiter
highlight default link floretID Label



syntax region Comment start='\v^\s*\#' end='$'

