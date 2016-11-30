/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"

using namespace c74::min;
using std::string;
using std::make_unique;
using std::to_string;


/// The mini object executes functions with double input and double output
using mini_function = double(double);


/// The mini_function_wrapper is a class the our object uses internally
/// to represent a single mini_function.
/// This class holds the source code for the mini_function and compiles and
/// executes it when called upon.
class mini_function_wrapper {
public:
	friend class mini;
	
	mini_function_wrapper(symbol fn_name, symbol fn_code, string fn_complete_code)
	: m_name			{ fn_name }
	, m_code			{ fn_code }
	, m_complete_code	{ fn_complete_code }
	{
		m_compiler = c74::max::object_new(c74::max::CLASS_NOBOX, symbol("clang"), m_name);
		object_attr_setlong(m_compiler, symbol("cpp"), 1);
		
		// Configure system paths:
		object_method(m_compiler, symbol("include_standard_headers"));
		
		// Configure include paths:
		// object_method(clang, gensym("include"), gensym("/usr/local/include"));
		
		// Prepend a define:
		// object_method(clang, gensym("define"), gensym("__STDC_LIMIT_MACROS");
		
		// Compile C code:
		atom ret;
		auto maxstr = c74::max::string_new(m_complete_code.c_str());
		
		object_method_obj(m_compiler, symbol("compile"), maxstr, &ret);
		// TODO: ???
		object_free(maxstr);
		
		// Optimize (valid options are O1, O2, O3, default is O2):
		//object_method(clang, gensym("optimize"), gensym("O2"));
		
		// Post contained LLVM IR:
		//object_method(clang, gensym("dump"));
		
		// Get a function pointer:
		atom fun;
		
		object_method_sym(m_compiler, symbol("getfunction"), symbol("func"), &fun);
		
		m_method = reinterpret_cast<mini_function*>(atom_getobj(&fun));
	}
	
	
	~mini_function_wrapper() {
		// object_free(x->c_clang);
		// when freeing... destroying the clang object destroys the entire associated llvm::Module
	}
	
private:
	symbol				m_name;
	symbol				m_code;				// TODO: make string class in the symbol header?
	string				m_complete_code;
	c74::max::t_object*	m_compiler;			// TODO: make instance
	mini_function*		m_method { nullptr };
};


/// An associate array mapping function names to a mini_function_wrapper
using function_map = std::unordered_map<string, std::unique_ptr<mini_function_wrapper>>;


/// A Max class that creates and executes mini_functions
class mini : public object<mini> {
public:

	MIN_DESCRIPTION { "Execute simple c++ expressions." };
	MIN_TAGS		{ "code, expressions" };
	MIN_AUTHOR		{ "Cycling '74" };
	MIN_RELATED		{ "expr, gen~" };

	inlet<>		input  { this, "Input" };
	outlet<>	output { this, "Output" };
	

	argument<anything> name_arg { this, "code",
		"Arguments to the constructor are interpreted as source code for the 'anonymous' method. "
		"If it is a one-liner then the semi-colon is optional. "
		"If there are no args code saved in the editor window will be used for the 'anonymous' method. "
	};

	mini(const atoms& args = {}) {
		string str;
		
		if (!args.empty()) {
			define({ "anonymous", to_string(args) });
			embed = false;
		}
		else {
			auto saved_state { state() };				// 'state()' fetches the dictionary for our object in the patcher
			auto saved_code = saved_state["code"];		// we save our code internally in a custom key named 'code'
			if (!saved_code.empty())
				define({ "anonymous", to_string(saved_code) });
			else
				define({ "anonymous", "y = x * 3.1415;" });
		}
	}
		
	
	message<> define { this, "define", "Define a new method, mapping it to a name.",
		MIN_FUNCTION {
			symbol	name = args[0];
			string	code = args[1];
			string	complete_code;
			
			complete_code = "extern \"C\" double func(double x) {\n";
			complete_code += "double y=0;\n";
			complete_code += code;
			complete_code += ";";				// in case we have a 1-liner with no semi-colon at the end
			complete_code += "return y;}";
			
			auto f = make_unique<mini_function_wrapper>(name, code, complete_code);
			if (f->m_method)
				functions[string(name.c_str())] = move(f);
			else
				cerr << "function '" << name << "' not added to object" << endl;

			return {};
		}
	};
	
	
	message<> number { this, "number", "Execute the 'anonymous' method. The number is passed in as the variable 'x'.",
		MIN_FUNCTION {
			auto f = functions["anonymous"].get();
			auto ret = f->m_method(args[0]);
			output.send(ret);
			return {};
		}
	};
	
	
	message<> anything { this, "anything", "Execute a named method. The first arg is the name of the method. The second arg is passed to the method as the variable 'x'.",
		MIN_FUNCTION {
			auto f = functions[args[0]].get();
			if (f) {
				double ret = f->m_method(args[1]);
				output.send(ret);
			}
			return {};
		}
	};
	
	
	/// Open the editor window.
	message<> dblclick { this, "dblclick", MIN_FUNCTION {
		auto f = functions["anonymous"].get();
		if (f)
			editor.open(f->m_code);
		return {};
	}};
	
	
	/// Save the state of the editor window with the patcher.
	message<> savestate { this, "savestate", MIN_FUNCTION {
		if (embed) {
			auto f = functions["anonymous"].get();
			if (f) {
				dict d { args[0] };
				d["code"] = f->m_code;
			}
		}
		return {};
	}};
	
	
private:
	
	bool			embed { true };	// save contents in the patcher file
	function_map	functions;		// map names to their corresponding mini_function_wrapper
	
	texteditor editor { this, [this](const char* text) {
		atoms as = { "anonymous", text };
		define(as);
	}};
	
};

MIN_EXTERNAL(mini);
