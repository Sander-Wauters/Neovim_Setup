local status, gitsigns = pcall(require, "gitsigns")
if not status then
    print("Error loading gitsigns")
    return
end

gitsigns.setup()
