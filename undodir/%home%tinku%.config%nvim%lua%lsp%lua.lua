Vim�UnDo� gT�X���і�ԏ9�4�I$e͕:̆����      lspconfig.sumneko_lua.setup {                             `o	    _�                             ����                                                                                                                                                                                                                                                                                                                                                             `n��    �                   �               5��                                          I      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        `o�    �                Llocal sumneko_binary = sumneko_root_path .. "/bin/macOS/lua-language-server"�                alocal sumneko_root_path = vim.fn.stdpath("cache") .. "/lspconfig/sumneko_lua/lua-language-server"5��               a       d   �      a       d       �               L       O   G      L       O       5�_�                          ����                                                                                                                                                                                                                                                                                                                                                  V        `o�     �                A  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},5��               A       D   �      A       D       5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        `o�     �      	          .  --     require'completion'.on_attach(client)5��               .       +         .       +       5�_�                    	       ����                                                                                                                                                                                                                                                                                                                                                  V        `o�    �      
          2  print("'" .. client.name .. "' server attached")5��               2       5   7      2       5       5�_�                             ����                                                                                                                                                                                                                                                                                                                                                V       `o    �                  }�                    }�                      }�                p        library = {[vim.fn.expand("$VIMRUNTIME/lua")] = true, [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true}�                      workspace = {�                E      diagnostics = {enable = true, globals = {"vim", "use", "lua"}},�                %      runtime = {version = "LuaJIT"},�                    Lua = {�                  settings = {5��                         3                    �                         E                    �               %       (   T      %       (       �               E       H   }      E       H       �                         �                    �               p       s   �      p       s       �                      
   Q             
       �                         \                    �                         e                    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        `o�    �               -lspconfig.sumneko_lua_language_server.setup {5��                         �                     �                     
   �             
       5��