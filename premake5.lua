-- Edit this name
workspace "MyWorkspace"
configurations { "Debug", "Release" }
architecture "x64"

targetdir("build/bin/%{cfg.buildcfg}")
objdir("build/bin-int/%{cfg.buildcfg}")

-- Add include dirs here
includedirs {
  "include",
  "src"
}

filter "system:windows"
links {
}
defines { "WIN32" }

filter "configurations:Debug"
defines { "DEBUG" }
symbols "On"

filter "configurations:Release"
defines { "NDEBUG" }
optimize "On"

-- Edit this name
project "MyProject"
kind "ConsoleApp"
language "C++"
cppdialect "C++20"

filter "action:vs*"
location "build/VS"

filter "action:gmake2"
location "build/Make"

-- Add source code location here
files {
  "include/**.h",
  "src/**.cpp"
}

filter "configurations:Debug"
libdirs {
}
links {
}

filter "configurations:Release"
libdirs {
}
links {
}
