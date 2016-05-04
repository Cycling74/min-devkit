
#include "c74_min.h"

using namespace c74::min;


using mini_function_method = double(double);


class mini_function {
public:
	friend class mini;
	
	mini_function(){}
	
private:
	c74::max::t_object*		f_clang;	// when freeing... destroying the clang object destroys the entire associated llvm::Module
	symbol					f_name;
	c74::max::t_string*		f_source;
	c74::max::t_string*		f_complete_source;
	mini_function_method*	f_method;
};


class mini : public object {
public:
	
	inlet	input				= { this, "Input" };
	outlet	output				= { this, "Output" };
	
	mini(atoms args) {
		c_functions = c74::max::hashtab_new(0);
		c74::max::hashtab_flags(c_functions, c74::max::OBJ_FLAG_MEMORY);
		
		auto str = atoms_to_string(args);
		atoms as = {c74::max::gensym("mymain"), c74::max::gensym(str.c_str())};
		define(as);
	}
	
	
	~mini() {
		object_free(c_functions);
		//	object_free(x->c_clang);
	}
	
	
	
	
	METHOD (number) {
		mini_function* f = nullptr;
		
		auto err = hashtab_lookup(c_functions, c74::max::gensym("mymain"), (c74::max::t_object**)&f);
		if (err) {
			c74::max::object_error((c74::max::t_object*)this->maxobj, "no function defined foe mymain");
			return;
		}
		
		double ret = f->f_method(args[0]);
		
		output.send(ret);
	}
	END
	
	
	//void code_define(t_code *x, t_symbol *name, t_symbol *code)
	METHOD (define) {
		symbol		name = args[0];
		symbol		code = args[1];
		auto		f = (mini_function*)c74::max::sysmem_newptr(sizeof(mini_function));
		std::string	sourcecode;
		
		//sourcecode = "double func(double in, double in1, double in2) {\n";
		sourcecode = "extern \"C\" double func(double x) {\n";
		sourcecode += "double y=0;\n";
		sourcecode += code;
		if (!strrchr(code, ';'))	// if there is no semi-colon then we probably have a 1-liner and can add it for them
			sourcecode += ";";
		sourcecode += "return y;}";
		
		c74::max::cpost("\n");
		c74::max::cpost(sourcecode.c_str());
		c74::max::cpost("\n");
		
		f->f_name = name;
		f->f_source = c74::max::string_new(code);
		f->f_complete_source = c74::max::string_new(sourcecode.c_str());
		f->f_method = nullptr;
		f->f_clang = c74::max::object_new(c74::max::CLASS_NOBOX, c74::max::gensym("clang"), (c74::max::t_symbol*)name);
		object_attr_setlong(f->f_clang, c74::max::gensym("cpp"), 1);
		
		// Configure system paths:
		object_method(f->f_clang, c74::max::gensym("include_standard_headers"));
		
		// Configure include paths:
		// object_method(clang, gensym("include"), gensym("/usr/local/include"));
		
		// Prepend a define:
		// object_method(clang, gensym("define"), gensym("__STDC_LIMIT_MACROS");
		
		// Compile C code:
		atom ret;
		object_method_obj(f->f_clang, c74::max::gensym("compile"), (c74::max::t_object*)f->f_complete_source, &ret);
		
		// Optimize (valid options are O1, O2, O3, default is O2):
		//object_method(clang, gensym("optimize"), gensym("O2"));
		
		// Post contained LLVM IR:
		//object_method(clang, gensym("dump"));
		
		// Get a function pointer:
		atom fun;
		
		object_method_sym(f->f_clang, c74::max::gensym("getfunction"), c74::max::gensym("func"), &fun);
		
		f->f_method = (mini_function_method*)atom_getobj(&fun);
		if (f->f_method)
			hashtab_store(c_functions, name, (c74::max::t_object*)f);
		else {
			object_error(this->maxobj, "function '%s' not added to object", (const char*)name);
			object_free(f->f_clang);
			c74::max::sysmem_freeptr(f);
		}
	}
	END
	
	
	METHOD (anything) {
		mini_function* f = nullptr;
		
		auto err = c74::max::hashtab_lookup(c_functions, args[0], (c74::max::t_object**)&f);
		if (err) {
			object_error((c74::max::t_object*)this->maxobj, "no function defined with the named '%s'", std::string(args[0]).c_str());
			return;
		}
		
		//double ret = f->f_method(atom_getfloat(argv), atom_getfloat(argv+1), atom_getfloat(argv+2));
		double ret = f->f_method(args[1]);
		
		output.send(ret);
	}
	END
	
	
	METHOD (dblclick) {
		if (!c_editor) {
			c_editor = c74::max::object_new(c74::max::CLASS_NOBOX, c74::max::gensym("jed"), this->maxobj, 0);
			object_attr_setsym(c_editor, c74::max::gensym("title"), c74::max::gensym("Code Editor"));
			object_attr_setchar(c_editor, c74::max::gensym("scratch"), 1);
			
			mini_function* f = nullptr;
			auto err = hashtab_lookup(c_functions, c74::max::gensym("mymain"), (c74::max::t_object**)&f);
			if (err) {
				atoms as = {atom(c74::max::gensym("mymain")), atom(c74::max::gensym("y = 3.1415"))};
				define(as);
				err = c74::max::hashtab_lookup(c_functions, c74::max::gensym("mymain"), (c74::max::t_object**)&f);
				if (err) {
					c74::max::cpost("code: kablooey\n");
					return;
				}
			}
			
			object_method_direct(void, (c74::max::t_object* , const char*, c74::max::t_symbol*),
								 c_editor, c74::max::gensym("settext"), string_getptr(f->f_source), c74::max::gensym("utf-8"));
		}
		else
			c74::max::object_attr_setchar(c_editor, c74::max::gensym("visible"), 1);
	}
	END
	
	
	METHOD (edclose) {
		c_editor = nullptr;
	}
	END
	
	
	METHOD (okclose) {
		char* text = nullptr;
		
		object_method(c_editor, c74::max::gensym("gettext"), &text);
		if (*text == 0)
			return;	// totally blank text editor
		
		atoms as = {atom(c74::max::gensym("mymain")), atom(c74::max::gensym(text))};
		define(as);
		
		if (text)
			c74::max::sysmem_freeptr(text);
	}
	END
	
	
private:
	c74::max::t_hashtab*	c_functions;	// names --> t_functions
	c74::max::t_object*		c_editor;		// jed
	
};


MIN_EXTERNAL(mini, "mini");
