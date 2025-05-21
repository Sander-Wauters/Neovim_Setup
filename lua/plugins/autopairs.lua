local status, autopairs = pcall(require, "nvim-autopairs")
if not status then
    print("Failed loading autopairs")
end

autopairs.setup()
