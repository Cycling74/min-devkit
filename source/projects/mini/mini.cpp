/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"

using namespace c74::min;
using std::string;

using minifun_method = double(double);	// TODO: make it use atoms for N in and N out



// TODO: comment how this whole thing works!
class minifun {
public:
	friend class mini;
	
	minifun(symbol fn_name, symbol fn_code, string fn_complete_code)
	: name(fn_name)
	, code(fn_code)
	, complete_code(fn_complete_code)
	{
		compiler = c74::max::object_new(c74::max::CLASS_NOBOX, c74::max::gensym("clang"), (c74::max::t_symbol*)name);
		object_attr_setlong(compiler, c74::max::gensym("cpp"), 1);
		
		// Configure system paths:
		object_method(compiler, c74::max::gensym("include_standard_headers"));
		
		// Configure include paths:
		// object_method(clang, gensym("include"), gensym("/usr/local/include"));
		
		// Prepend a define:
		// object_method(clang, gensym("define"), gensym("__STDC_LIMIT_MACROS");
		
		// Compile C code:
		atom ret;
		auto maxstr = c74::max::string_new(complete_code.c_str());
		
		object_method_obj(compiler, c74::max::gensym("compile"), (c74::max::t_object*)maxstr, &ret);
		// TODO: ???
		object_free(maxstr);
		
		// Optimize (valid options are O1, O2, O3, default is O2):
		//object_method(clang, gensym("optimize"), gensym("O2"));
		
		// Post contained LLVM IR:
		//object_method(clang, gensym("dump"));
		
		// Get a function pointer:
		atom fun;
		
		object_method_sym(compiler, c74::max::gensym("getfunction"), c74::max::gensym("func"), &fun);
		
		method = (minifun_method*)atom_getobj(&fun);
	}
	
	
	~minifun() {
		// object_free(x->c_clang);
		// when freeing... destroying the clang object destroys the entire associated llvm::Module
	}
	
private:
	symbol				name;
	symbol				code;				// TODO: make string class in the symbol header?
	string				complete_code;
	//	c74::max::t_string*	complete_code;
	c74::max::t_object*	compiler;			// TODO: make instance
	minifun_method*		method = nullptr;
};



class mini : public object {
public:
	
	inlet		input	= { this, "Input" };
	outlet		output	= { this, "Output" };
	

	mini(atoms args) {
		std::string str;
		
		if (args.empty())
			str = "y = 3.1415;";
		else
			str = atoms_to_string(args);
		
		define({ "anonymous", str });
	}
	
	
	~mini() {}
	
	
	METHOD (number) {
		auto f = functions["anonymous"];
		auto ret = f->method(args[0]);
		output.send(ret);
	}
	END
	
	
	// TODO: Save state!
	
	
	METHOD (define) {
		symbol		name = args[0];
		symbol		code = args[1];
		std::string	complete_code;
		
		complete_code = "extern \"C\" double func(double x) {\n";
		complete_code += "double y=0;\n";
		complete_code += code;
		complete_code += ";";				// in case we have a 1-liner with no semi-colon at the end
		complete_code += "return y;}";
		
		auto f = new minifun(name, code, complete_code);
		// TODO: above should be unique pointer -- can we use C++14?
		// TODO: leaking this memory if successful!
		if (f->method)
			functions.store(name, f);
		else {
			object_error(this->maxobj, "function '%s' not added to object", (const char*)name);
			delete f;
		}
	}
	END
	
	
	METHOD (anything) {
		auto f = functions[args[0]];
		if (f) {
			double ret = f->method(args[1]);
			output.send(ret);
		}
	}
	END
	
	
	METHOD (dblclick) {
		auto f = functions["anonymous"];
		if (f)
			editor.open(f->code);
	}
	END
	
	
private:

	// TODO: below should be a unique pointer!
	map<minifun*>	functions;

	texteditor	editor	= { this, [this](const char* text) {
		atoms as = { "anonymous", text };
		define(as);
	}};
	
};


MIN_EXTERNAL(mini, "mini");
