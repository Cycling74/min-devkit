/// @file
///	@ingroup 	minexamples
///	@copyright	Copyright 2018 The Min-DevKit Authors. All rights reserved.
///	@license	Use of this source code is governed by the MIT License found in the License.md file.

#include "c74_min.h"
#include <regex>
#ifdef MAC_VERSION
#include <Carbon/Carbon.h>
#endif    // MAC_VERSION

using namespace c74::min;


std::string min_devkit_path() {
#ifdef WIN_VERSION
    char    pathstr[4096];
    HMODULE hm = nullptr;

    if (!GetModuleHandleExA(
            GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS | GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT, (LPCSTR)&min_devkit_path, &hm)) {
        int ret = GetLastError();
        fprintf(stderr, "GetModuleHandle() returned %d\n", ret);
    }
    GetModuleFileNameA(hm, pathstr, sizeof(pathstr));

    // path now is the path to this external's binary, including the binary filename.
    auto filename = strrchr(pathstr, '\\');
    if (filename)
        *filename = 0;
    auto externals = strrchr(pathstr, '\\');
    if (externals)
        *externals = 0;

    path p {pathstr};    // convert to Max path
    return p;
#endif    // WIN_VERSION

#ifdef MAC_VERSION
    CFBundleRef this_bundle = CFBundleGetBundleWithIdentifier(CFSTR("com.cycling74.min-project"));
    CFURLRef    this_url    = CFBundleCopyExecutableURL(this_bundle);
    char        this_path[4096];

    CFURLGetFileSystemRepresentation(this_url, true, reinterpret_cast<UInt8*>(this_path), 4096);

    string this_path_str {this_path};

    CFRelease(this_url);
    // remember: we don't want to release the bundle because Max is still using it!

    // we now have a path like this:
    // /Users/tim/Materials/min-devkit/externals/min.project.mxo/Contents/MacOS/min.project"
    // so we need to chop off 5 slashes from the end

    auto iter = this_path_str.find("/externals/min.project.mxo/Contents/MacOS/min.project");
    this_path_str.erase(iter, strlen("/externals/min.project.mxo/Contents/MacOS/min.project"));
    return this_path_str;
#endif    // MAC_VERSION
}


class project : public object<project> {
public:
    MIN_DESCRIPTION	{ "Get the approximate value of pi." };
    MIN_TAGS		{ "math" };
    MIN_AUTHOR		{ "Cycling '74" };
    MIN_RELATED		{ "sin, cos, atan~, jit.op, gen~" };

    inlet<>  input	{ this, "(bang) get the approximate value of pi" };
    outlet<> output	{ this, "(number) progress in percent" };

    message<> create_package {this, "create_package", "Create a Min-based package.",
        MIN_FUNCTION {
            if (args.size() < 1) {
                cerr << "Missing required argument -- path to new package" << endl;
                return {};
            }

            try {
                auto devkit_path_str {min_devkit_path()};

                path devkit_source_path {devkit_path_str + "/source"};
                path devkit_helloworld_path {static_cast<string>(devkit_source_path) + "/projects/min.hello-world"};
                path devkit_hellocmake_path {static_cast<string>(devkit_helloworld_path) + "/CMakeLists.txt"};
                path devkit_hellosrc_path {static_cast<string>(devkit_helloworld_path) + "/min.hello-world.cpp"};
                path devkit_hellotest_path {static_cast<string>(devkit_helloworld_path) + "/min.hello-world_test.cpp"};
                path devkit_help_path {devkit_path_str + "/help"};
                path devkit_helpfile {static_cast<string>(devkit_help_path) + "/min.hello-world.maxhelp"};
                path devkit_api_path {static_cast<string>(devkit_source_path) + "/min-api"};
                path devkit_lib_path {static_cast<string>(devkit_source_path) + "/min-lib"};
                path devkit_tests_path {devkit_path_str + "/tests"};

                path package_path {static_cast<string>(args[0]), path::filetype::folder, true};
                path package_build_path {static_cast<string>(package_path) + "/build", path::filetype::folder, true};
                path package_help_path {static_cast<string>(package_path) + "/help", path::filetype::folder, true};
                path package_source_path {static_cast<string>(package_path) + "/source", path::filetype::folder, true};
                path package_projects_path {static_cast<string>(package_source_path) + "/projects", path::filetype::folder, true};
                path package_helloworld_path {
                    static_cast<string>(package_projects_path) + "/" + package_path.name() + ".hello-world", path::filetype::folder, true};

                devkit_hellocmake_path.copy(package_helloworld_path, "CMakeLists.txt");
                devkit_hellosrc_path.copy(package_helloworld_path, package_path.name() + ".hello-world.cpp");
                devkit_hellotest_path.copy(package_helloworld_path, package_path.name() + ".hello-world_test.cpp");
                string test_path_str {static_cast<string>(package_helloworld_path) + "/" + package_path.name() + ".hello-world_test.cpp"};
                string test_content;
                {
                    std::ifstream in {test_path_str};
                    test_content = string {std::istreambuf_iterator<char>(in), std::istreambuf_iterator<char>()};
                    std::regex rex {"min.hello-world"};
                    test_content = std::regex_replace(test_content, rex, package_path.name() + ".hello-world");
                }
                {
                    std::ofstream out {test_path_str};
                    out << test_content;
                }

                devkit_api_path.copy(package_source_path, "min-api");
                devkit_lib_path.copy(package_source_path, "min-lib");
                devkit_tests_path.copy(package_path, "tests");

                devkit_helpfile.copy(package_help_path, package_path.name() + ".hello-world.maxhelp");
                string help_path_str {static_cast<string>(package_help_path) + "/" + package_path.name() + ".hello-world.maxhelp"};
                string help_content;
                {
                    std::ifstream in {help_path_str};
                    help_content = string {std::istreambuf_iterator<char>(in), std::istreambuf_iterator<char>()};
                    std::regex rex {"min.hello-world"};
                    help_content = std::regex_replace(help_content, rex, package_path.name() + ".hello-world");
                }
                {
                    std::ofstream out {help_path_str};
                    out << help_content;
                }

                path devkit_jsonfile {devkit_path_str + "/package-info.json"};
                devkit_jsonfile.copy(package_path, "package-info.json");
                string json_content;
                {
                    std::ifstream in {static_cast<string>(package_path) + "/package-info.json"};
                    json_content = string {std::istreambuf_iterator<char>(in), std::istreambuf_iterator<char>()};
                    std::regex rex {"min-devkit"};
                    json_content = std::regex_replace(json_content, rex, package_path.name());
                }
                {
                    std::ofstream out {static_cast<string>(package_path) + "/package-info.json"};
                    out << json_content;
                }

                path devkit_licensefile {devkit_path_str + "/License.md"};
                devkit_licensefile.copy(package_path, "License.md");

                path devkit_readmefile {devkit_path_str + "/script/ReadMe-Template.md"};
                devkit_readmefile.copy(package_path, "ReadMe.md");
                string readme_content;
                {
                    std::ifstream in {static_cast<string>(package_path) + "/ReadMe.md"};
                    readme_content = string {std::istreambuf_iterator<char>(in), std::istreambuf_iterator<char>()};
                    std::regex rex {"My Package"};
                    readme_content = std::regex_replace(readme_content, rex, package_path.name());
                }
                {
                    std::ofstream out {static_cast<string>(package_path) + "/ReadMe.md"};
                    out << readme_content;
                }

                path devkit_iconfile {devkit_path_str + "/icon.png"};
                devkit_iconfile.copy(package_path, "icon.png");

                path devkit_cmakefile {devkit_path_str + "/CMakeLists.txt"};
                devkit_cmakefile.copy(package_path, "CMakeLists.txt");

                path devkit_ignorefile {devkit_path_str + "/.gitignore"};
                devkit_ignorefile.copy(package_path, ".gitignore");

                std::stringstream open_command;
                #ifdef MAC_VERSION
                    open_command << "open \"" << static_cast<string>(package_path) << "\"";
                #else // WIN_VERSION
				    string      package_path_esc = package_path;
                    std::regex  rex {"\/"};
					string      slash {"\\"};

				    package_path_esc = std::regex_replace(package_path_esc, rex, slash);
				    open_command << "explorer \"" << package_path_esc << "\"";
                    std::system(open_command.str().c_str());
                #endif
            }
            catch (...) {
                cerr << "A problem occurred trying to create the new package" << endl;
            }
            return {};
        }
    };


    message<> generate { this, "generate", "Generate IDE projects and then open the specified project only.",
        MIN_FUNCTION {
            try {
                auto   devkit_path_str {min_devkit_path()};
                string project_path_str;

                try {
                    path p {static_cast<string>(args[0])};
                    project_path_str = static_cast<string>(p);
                }
                catch (...) {
                    project_path_str = static_cast<string>(args[0]);
                }

                project_path_str.resize(project_path_str.find_last_of('/'));
                project_path_str.resize(project_path_str.find_last_of('/'));
                project_path_str.resize(project_path_str.find_last_of('/'));

#ifdef MAC_VERSION
                string cmake_path {"/script/cmake-mac/bin/cmake"};
                char   separator {'/'};

                // On the Mac our path starts with the drive, e.g. /Volumes/Macintosh HD
                // which we need to prune because it confuses CMake

                project_path_str.erase(0, project_path_str.find_first_of('/') + 1);
                project_path_str.erase(0, project_path_str.find_first_of('/') + 1);
                project_path_str.erase(0, project_path_str.find_first_of('/'));

#else    // WIN_VERSION
string cmake_path {"/script/cmake-win/bin/cmake.exe"};
char   separator {'\\'};
#endif
                string build_path {"/build"};
                string log_path {"/tmp/min-cmake-log.txt"};

                std::stringstream mkdir_command;
                mkdir_command << "mkdir \"" << project_path_str << separator << "tmp\"";
                std::system(mkdir_command.str().c_str());

                std::stringstream cmake_command;
                cmake_command << "cd \"" << project_path_str << build_path << "\" && \"" << devkit_path_str << cmake_path;
#ifdef MAC_VERSION
                cmake_command << "\" -G Xcode .. > \"" << project_path_str << log_path << "\" 2>&1";
#else    // WIN_VERSION
                cmake_command << "\" -G \"Visual Studio 16 2019\" .. > \"" << project_path_str << log_path << "\" 2>&1";
#endif

                std::cout << cmake_command.str() << std::endl;

                auto result = std::system(cmake_command.str().c_str());
                if (result == 0) {
#ifdef MAC_VERSION
                    if (args.size() > 1) {
                        std::stringstream open_command;
                        open_command << "cd \"" << project_path_str << build_path << "\" && "
                                     << "open \"" << project_path_str << build_path << strrchr(project_path_str.c_str(), '/')
                                     << ".xcodeproj\"";
                        result = std::system(open_command.str().c_str());
                    }
                    else {
                        path              project_path {args};
                        std::stringstream open_command;
                        open_command << "cd \"" << project_path_str << build_path << "\" && "
                                     << "open \"" << project_path_str << build_path << "/source/projects/" << project_path.name()
                                     << separator << project_path.name() << ".xcodeproj\"";
                        result = std::system(open_command.str().c_str());
                    }
#else    // WIN_VERSION
    if (args.size() > 1) {
        std::stringstream vs_sln_path;
        vs_sln_path << "\"" << project_path_str << build_path << strrchr(project_path_str.c_str(), '/') << ".sln\"";
        
        string vs_sln_path_esc = vs_sln_path.str();
		std::regex rex {"\/"};
		string slash {"\\"};
		vs_sln_path_esc = std::regex_replace(vs_sln_path_esc, rex, slash);

		ShellExecute(NULL, "open", vs_sln_path_esc.c_str(), NULL, NULL, SW_SHOWNORMAL);
    }
    else {
        path              project_path {args};
        std::stringstream vs_sln_path;
		vs_sln_path << "\"" << project_path_str << build_path << "/source/projects/" << project_path.name() << separator
                    << project_path.name() << ".sln\"";

        string vs_sln_path_esc = vs_sln_path.str();
		std::regex rex {"\/"};
		string slash {"\\"};
		vs_sln_path_esc = std::regex_replace(vs_sln_path_esc, rex, slash);

		ShellExecute(NULL, "open", vs_sln_path_esc.c_str(), NULL, NULL, SW_SHOWNORMAL);
    }
#endif
                }
                output.send(result);
            }
            catch (...) {
                cerr << "Could not generate project(s) with that specification." << endl;
            }
            return {};
        }
    };


    message<> create_object { this, "create_object", "Add a new object to a package.",
        MIN_FUNCTION {
            auto        devkit_path_str {min_devkit_path()};
            auto        package_path_str {static_cast<string>(args[0])};
            const char* package_name {strrchr(&package_path_str[0], '/') + 1};
            auto        object_name {static_cast<string>(args[1])};

            if (object_name.find(package_name) == std::string::npos) {
                object_name.insert(0, ".");
                object_name.insert(0, package_name);
            }

            string object_user_name {object_name};

            if (object_name[object_name.size() - 1] == '~') {
                object_name.resize(object_name.size() - 1);
                object_name += "_tilde";
            }

            string object_identifier {std::regex_replace(object_name, std::regex {"\\."}, "_")};

            path devkit_source_path {devkit_path_str + "/source"};
            path devkit_helloworld_path {static_cast<string>(devkit_source_path) + "/projects/min.hello-world"};
            path devkit_hellocmake_path {static_cast<string>(devkit_helloworld_path) + "/CMakeLists.txt"};
            path devkit_hellosrc_path {static_cast<string>(devkit_helloworld_path) + "/min.hello-world.cpp"};
            path devkit_hellotest_path {static_cast<string>(devkit_helloworld_path) + "/min.hello-world_test.cpp"};
            path devkit_help_path {devkit_path_str + "/help"};
            path devkit_helpfile {static_cast<string>(devkit_help_path) + "/min.hello-world.maxhelp"};

            path package_help_path {package_path_str + "/help"};
            path package_source_path {package_path_str + "/source"};
            path package_projects_path {static_cast<string>(package_source_path) + "/projects"};
            path package_helloworld_path {static_cast<string>(package_projects_path) + "/" + object_name, path::filetype::folder, true};

            devkit_hellocmake_path.copy(package_helloworld_path, "CMakeLists.txt");

            devkit_hellosrc_path.copy(package_helloworld_path, object_name + ".cpp");
            string src_path_str {static_cast<string>(package_helloworld_path) + "/" + object_name + ".cpp"};
            string src_content;
            {
                std::ifstream in {src_path_str};
                src_content = string {std::istreambuf_iterator<char>(in), std::istreambuf_iterator<char>()};
                src_content = std::regex_replace(src_content, std::regex {"hello_world"}, object_identifier);
            }
            {
                std::ofstream out {src_path_str};
                out << src_content;
            }

            devkit_hellotest_path.copy(package_helloworld_path, object_name + "_test.cpp");
            string test_path_str {static_cast<string>(package_helloworld_path) + "/" + object_name + "_test.cpp"};
            string test_content;
            {
                std::ifstream in {test_path_str};
                test_content = string {std::istreambuf_iterator<char>(in), std::istreambuf_iterator<char>()};
                test_content = std::regex_replace(test_content, std::regex {"min.hello-world"}, object_name);
                test_content = std::regex_replace(test_content, std::regex {"hello_world"}, object_identifier);
            }
            {
                std::ofstream out {test_path_str};
                out << test_content;
            }

            devkit_helpfile.copy(package_help_path, object_user_name + ".maxhelp");
            string help_path_str {static_cast<string>(package_help_path) + "/" + object_user_name + ".maxhelp"};
            string help_content;
            {
                std::ifstream in {help_path_str};
                help_content = string {std::istreambuf_iterator<char>(in), std::istreambuf_iterator<char>()};
                help_content = std::regex_replace(help_content, std::regex {"min.hello-world"}, object_user_name);
            }
            {
                std::ofstream out {help_path_str};
                out << help_content;
            }

            generate( {{static_cast<string>(package_helloworld_path)}});
            return {};
        }
    };


    message<> anything { this, "anything", "Generate IDE projects for the package whose name is passed.",
        MIN_FUNCTION {
            path   project_path {static_cast<string>(args[0])};
            string project_path_str = static_cast<string>(project_path);
            project_path_str += "/source/project/placeholder";
            return generate( {project_path_str, 1});
        }
    };

};

MIN_EXTERNAL(project);
