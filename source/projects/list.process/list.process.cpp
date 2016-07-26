/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"

using namespace c74::min;
using namespace std;


class list_process : public object<list_process> {
public:
	
	inlet			in		{ this, "(anything) input" };
	outlet			out1	{ this, "(list) result" };
	outlet			out2	{ this, "(list) result" };


	enum class operations : int {
		collect = 0,
		average
	};

	
	attribute<operations> operation { this, "operation", operations::collect };

	
	message number { this, "number", MIN_FUNCTION {
		if (operation == operations::collect) {
			m_data.reserve( m_data.size() + args.size() );
			m_data.insert( m_data.end(), args.begin(), args.end() );
		}
		return {};
	}};
	
	
	message bang { this, "bang", MIN_FUNCTION {
		out1.send(m_data);
		m_data.clear();
		return {};
	}};
	
	
	message list { this, "list", MIN_FUNCTION {
		switch (operation) {
			case operations::collect:
				m_data.reserve( m_data.size() + args.size() );
				m_data.insert( m_data.end(), args.begin(), args.end() );
				break;
			case operations::average:
				auto x = from_atoms<std::vector<double>>(args);
				auto y = math::mean<double>(x);
				out1.send(y.first, y.second);
				break;
		}
		return {};
	}};

	
	
private:
	atoms	m_data;
	
}; 


MIN_EXTERNAL(list_process);
