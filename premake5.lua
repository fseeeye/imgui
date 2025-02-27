project "ImGui"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "On"
    
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "*.h",
        "*.cpp",
        "backends/imgui_impl_opengl3.*",
        "backends/imgui_impl_opengl3_loader.h",
        "backends/imgui_impl_glfw.*"
    }

    includedirs
    {
        ".",
        "backends",
        "examples/libs/glfw/include"
    }
    
    filter "system:windows"
        systemversion "latest"

    filter "system:linux"
        pic "On"
        systemversion "latest"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "On"