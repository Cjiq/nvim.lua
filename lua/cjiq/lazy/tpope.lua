return {
  "tpope/vim-fugitive",
  "tpope/vim-surround",
  "tpope/vim-repeat",
  {
    "tpope/vim-projectionist",
    config = function()
      vim.g.projectionist_heuristics = {
        ["*"] = {
          ["*.in"] = {
            alternate = { "{}" },
          },
          ["include/*.hpp"] = {
            alternate = "tests/{}.cpp",
            type = "header",
          },
          ["src/*.cpp"] = {
            alternate = { "src/{}.hpp", "src/{}.h", "include/{}.hpp" },
            type = "source",
          },
          ["src/*.h"] = {
            alternate = "src/{}.cpp",
            type = "header",
          },
          ["src/*.hpp"] = {
            alternate = "tests/{}.cpp",
            type = "header",
          },
          ["tests/*.cpp"] = {
            alternate = { "src/{}.cpp", "src/{}.hpp" },
            type = "source",
          },
        },
      }
    end,
  },
}

-- ["src/*.cpp"] = {
--     ["include/{}.h"] = { "alternate": "include/{}.h" }
--   },
--   ["include/*.h"] = {
--     ["src/{}.cpp"] = { "alternate": "src/{}.cpp" }
--   }
