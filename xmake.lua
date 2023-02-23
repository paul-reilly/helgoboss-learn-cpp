set_project("helgoboss-midi")
set_version("0.1.0")
add_rules("mode.debug", "mode.release", "mode.asan", "mode.tsan", "mode.ubsan")
set_languages("c++17")

package("gsl-custom")         -- quickly adjust different include dirs between xmake
   set_base("microsoft-gsl")  -- package and result of cmake find_path() call
   add_includedirs("include/")
package_end()

add_requires("gsl-custom", { alias = "gsl" })
add_requires("boost", { configs = { algorithm = true }})
add_requires("nlohmann_json")

target("helgoboss-learn")
    set_kind("static")
    add_files("src/*.cpp")
    add_includedirs("external/RxCpp/Rx/v2/src",
        "external/WDL/WDL/",
        "external/helgoboss-midi-cpp/include")
    add_includedirs("include", { public = true })

    add_packages("gsl", "boost", "nlohmann_json")

