require('flutter-tools').setup {
    -- (uncomment below line for windows only)
    -- flutter_path = "home/flutter/bin/flutter.bat",
    debugger = { -- integrate with nvim dap + install dart code debugger
    enabled = true,
    -- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
    -- see |:help dap.set_exception_breakpoints()| for more info
    exception_breakpoints = {},
    -- Whether to call toString() on objects in debug views like hovers and the
    -- variables list.
    -- Invoking toString() has a performance cost and may introduce side-effects,
    -- although users may expected this functionality. null is treated like false.
    evaluate_to_string_in_debug_views = true,
    -- You can use the `debugger.register_configurations` to register custom runner configuration (for example for different targets or flavor). Plugin automatically registers the default configuration, but you can override it or add new ones.
    -- register_configurations = function(paths)
    --   require("dap").configurations.dart = {
    --     -- your custom configuration
    --   }
    -- end,
  },
  widget_guides = {
    enabled = false,
  },
}
