Vim�UnDo� Kxr�/:1�8x��~P�[���Y��f~4,�      dvim.api.nvim_buf_set_keymap('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)            3       3   3   3    `��L    _�                             ����                                                                                                                                                                                                                                                                                                                                                             `ō    �                   �               5��                       L                   �      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `p7�     �                 �              5��                                                  �                                                  �                                              5�_�                       *    ����                                                                                                                                                                                                                                                                                                                                                             `p7�     �             5��                          .                      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `p7�     �               Amap('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)5��                          S                     �                        W                    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `p7�     �                 Lmap('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)5��                       	   �              	       5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `p7�    �                #local map = vim.api.nvim_set_keymap5��                          �       $               5�_�      	                 "    ����                                                                                                                                                                                                                                                                                                                                                             `p7�    �                -local mappings = require('settings.mappings')5��        "                 "                     5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                                                  V        `qD�    �                Umappings.map('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)�                Jmappings.map('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)�                -local mappings = require('settings/mappings')5��                                              �                                                �                         )                    �                         q                    5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                                             `t�w     �                  �               �               5��                          �                     �                         �              u      5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                                v       `t��     �                %vim.g.floaterm_keymap_toggle = '<F1>'5��                          �      &               5�_�                       !    ����                                                                                                                                                                                                                                                                                                                                                v       `t��     �               %vim.g.floaterm_keymap_next   = '<F2>'5��       !                  �                     5�_�                       !    ����                                                                                                                                                                                                                                                                                                                                                v       `t��     �               $vim.g.floaterm_keymap_next   = '<2>'5��       !                  �                     5�_�                       !    ����                                                                                                                                                                                                                                                                                                                                                v       `t��     �               #vim.g.floaterm_keymap_next   = '<>'5��       !                  �                     5�_�                       !    ����                                                                                                                                                                                                                                                                                                                                                v       `t��     �               %vim.g.floaterm_keymap_prev   = '<F3>'5��       !                                       5�_�                       !    ����                                                                                                                                                                                                                                                                                                                                                v       `t��     �               $vim.g.floaterm_keymap_prev   = '<3>'5��       !                                       5�_�                       !    ����                                                                                                                                                                                                                                                                                                                                                v       `t��     �               #vim.g.floaterm_keymap_prev   = '<>'5��       !                                       5�_�                       !    ����                                                                                                                                                                                                                                                                                                                                                v       `t��     �               %vim.g.floaterm_keymap_new    = '<F4>'5��       !                  3                     5�_�                       !    ����                                                                                                                                                                                                                                                                                                                                                v       `t��     �               $vim.g.floaterm_keymap_new    = '<4>'5��       !                  3                     5�_�                       !    ����                                                                                                                                                                                                                                                                                                                                                v       `t��     �               #vim.g.floaterm_keymap_new    = '<>'5��       !                  3                     �       "                 4                    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       `t��     �                vim.g.floaterm_shell=O.shell5��                         v                    5�_�      -                      ����                                                                                                                                                                                                                                                                                                                                                             `t��    �                vim.g.floaterm_autoclose=1�                vim.g.floaterm_wintitle=0�                vim.g.floaterm_height=0.8�                vim.g.floaterm_width=0.85��                         �                    �                         �                    �                         �                    �                                             5�_�      .   !       -           ����                                                                                                                                                                                                                                                                                                                                                 v       `��     �               Gutils.map('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)�             5��               	       	   )      	       	       5�_�   -   /           .           ����                                                                                                                                                                                                                                                                                                                                                 v       `��     �               Gutils.map('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)5��               	           )      	               5�_�   .   0           /           ����                                                                                                                                                                                                                                                                                                                                                 v       `��     �               >('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)5��                          )                     �                         *                     �                         )                    �                         +                     �                         *                     �                         )                    �                        -                    �                         .                     �                        -                    �                         /                     �                         .                     �                        -                    �                        1                    �       	                  2                     �                        1                    �       
                  3                     �       	                  2                     �                        1                    �                         4                     �       
                  3                     �       	                  2                     �                        1                    �                         5                     �                         4                     �       
                  3                     �       	                  2                     �                        1                    �                         6                     �                         5                     �                         4                     �       
                  3                     �       	                  2                     �                        1                    �                         7                     �                         6                     �                         5                     �                         4                     �       
                  3                     �       	                  2                     �                        1                    �                         8                     �                         7                     �                         6                     �                         5                     �                         4                     �       
                  3                     �       	                  2                     �                        1                    �                         8                     �                         7                     �                         6                     �                         5                     �                         4                     �       
                  3                     �       	                  2                     �                        1                    �                         D                     �                         C                     �                         B                     �                         A                     �                         @                     �                         ?                     �                         >                     �                         =                     �                         <                     �                         ;                     �                         :                     �                         9                     �                         8                     �                         7                     �                         6                     �                         5                     �                         4                     �       
                  3                     �       	                  2                     �                        1                    5�_�   /   1           0           ����                                                                                                                                                                                                                                                                                                                                                 v       `��    �               Rutils.map('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)�             5��               	          �      	              5�_�   0   2           1          ����                                                                                                                                                                                                                                                                                                                                                v       `��I     �               Yvim.api.nvim_buf_set_keymap('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)5��                         6                     5�_�   1   3           2          ����                                                                                                                                                                                                                                                                                                                                                v       `��I     �               dvim.api.nvim_buf_set_keymap('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)5��                         �                     5�_�   2               3          ����                                                                                                                                                                                                                                                                                                                                                v       `��K    �               cvim.api.nvim_uf_set_keymap('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)5��                         �                     5�_�      "      -   !           ����                                                                                                                                                                                                                                                                                                                                          $       v   $    `��)     �               !vim.g.floaterm_keymap_next   = ''5��                          �                     5�_�   !   #           "           ����                                                                                                                                                                                                                                                                                                                                          $       v   $    `��*     �               +vim.g.floaterm_keymap_next   = '<leader>tj'5��                          �                     �       !                 �                    �       !                 �                    �       !                 �                    �       !                 �                    �       !              	   �             	       �       (                 �                    5�_�   "   $           #           ����                                                                                                                                                                                                                                                                                                                                          $       v   $    `��3     �               !vim.g.floaterm_keymap_prev   = ''5��                                               5�_�   #   %           $           ����                                                                                                                                                                                                                                                                                                                                          $       v   $    `��4     �               +vim.g.floaterm_keymap_prev   = '<leader>tk'5��                                               �       !                                     �       "                                     �       !                                     �       !                                     �       !                                     �       !              	                	       �       (                                     5�_�   $   &           %           ����                                                                                                                                                                                                                                                                                                                                          $       v   $    `��;     �               !vim.g.floaterm_keymap_new    = ''5��                          <                     5�_�   %   '           &           ����                                                                                                                                                                                                                                                                                                                                          $       v   $    `��;     �               +vim.g.floaterm_keymap_new    = '<leader>tn'5��                          <                     �       !                 =                    �       !                 =                    �       !                 =                    �       !                 =                    �       !              	   =             	       �       (                 D                    5�_�   &   (           '          ����                                                                                                                                                                                                                                                                                                                                          $       v   $    `��N   
 �               Futils.map('n', 'A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)5��                         9                     5�_�   '   )           (          ����                                                                                                                                                                                                                                                                                                                                          $       v   $    `��N     �               Eutils.map('n', '-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)5��                         9                     5�_�   (   *           )          ����                                                                                                                                                                                                                                                                                                                                          $       v   $    `��N     �               Dutils.map('n', 'i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)5��                         9                     5�_�   )   +           *          ����                                                                                                                                                                                                                                                                                                                                          $       v   $    `��N     �               Cutils.map('n', '>', '<CMD>lua require("FTerm").toggle()<CR>', opts)5��                         9                     5�_�   *   ,           +          ����                                                                                                                                                                                                                                                                                                                                          $       v   $    `��O     �               Butils.map('n', '', '<CMD>lua require("FTerm").toggle()<CR>', opts)5��                         9                     5�_�   +               ,          ����                                                                                                                                                                                                                                                                                                                                          $       v   $    `��P     �               Kutils.map('n', '<leader>t', '<CMD>lua require("FTerm").toggle()<CR>', opts)5��                         9                     �                        :                    �                        :                    �                        :                    �                        :                    �                        :                    5�_�             !              ����                                                                                                                                                                                                                                                                                                                                                             `�N�     �                 *-- local utils = require('settings/utils')5��                '       *           '       *       5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `�P�     �               J_G.utils.map('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)5��                          ,                     �                         ,                    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `�P�     �               U_G.utils.map('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)5��                          w                     �                         w                    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `�P�     �               -- �               -- _G5��                          ,                     �                         /                     �                        /                    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `�P�     �              5��                          ,                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `�P�     �                �               _G.u5��                          �                     �                          �                     �                         �                    �                        �                    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `�P�     �              5��                          �                     5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             `�P�    �                5��                          �                     5�_�                          ����                                                                                                                                                                                                                                                                                                                                                V       `t��     �              5��                          v                     5�_�                             ����                                                                                                                                                                                                                                                                                                                                                V       `t��     �               vim.g.floaterm_width=0.8   vim.g.floaterm_height=0.85�5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       `o�q    �      	             border =  'double'5��                         �                      5��