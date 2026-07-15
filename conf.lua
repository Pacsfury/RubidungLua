function love.conf(t)
    t.identity = "RubidungLua"
    t.version = "11.5"

    t.window.title = "RubidungLua"
    t.window.width = 1280
    t.window.height = 720
    t.window.resizable = false
    t.window.vsync = 1

    t.modules.physics = false
    t.console = true
end
