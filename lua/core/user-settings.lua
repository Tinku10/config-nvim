-- User specific configurations
-- These configurations are only meant for high level usage

local M = {}

M.paths = {
  dsa = "~/Desktop/codes/dsa",
  config = "~/.config/nvim"
}

M.ui = {
  border = "none"
}

M.keymaps = {
  {'n', '<F8>', ":term  g++ -Wall -Wextra -pedantic -std=c++17 -O2 -Wformat=2 -Wfloat-equal -Wconversion -Wcast-qual -Wunused-variable -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -fsanitize=address -fsanitize=undefined -fno-sanitize-recover=all -fstack-protector %; if [ -f a.out  ]; then time ./a.out; rm a.out; fi <CR>"},
  {'n', '<C-c>', ":w <CR> :!cd build && cmake ..<CR> :!cd build && cmake --build .<CR>"},
  {'n', '<C-x>', ":!cd build && ./sample_glfw <Enter>"}
  -- {'n', '<C-c>', ":w <CR> :!g++ -o  %:r % -std=c++17 -Wall -fsanitize=address -fsanitize=undefined -Wshift-overflow -g <CR>"},
  -- {'n', '<C-x>', ":term ./%:t:r <Enter>"}
}

return M
