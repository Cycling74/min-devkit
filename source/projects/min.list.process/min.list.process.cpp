/// @file	
///	@ingroup 	minexamples
///	@copyright	Copyright (c) 2016, Cycling '74
/// @author		Timothy Place
///	@license	Usage of this file and its contents is governed by the MIT License

#include "c74_min.h"

using namespace c74::min;


// one could easily imagine calling the number message with a metro/counter but then
// banging the results with mouse-clicks or an sfplay~ "done" notification

class list_process : public object<list_process> {
public:
	
	MIN_DESCRIPTION { "Process lists in various ways." };
	MIN_TAGS		{ "lists" };
	MIN_AUTHOR		{ "Cycling '74" };
	MIN_RELATED		{ "zl" };

	inlet<>		in		{ this, "(anything) input" };
	outlet<>	out1	{ this, "(list) result" };
	outlet<>	out2	{ this, "(list) result" };


	// For enum attributes you first define your enum class.
	// The indices must start at zero and increase sequentially.

	enum class operations : int {
		collect,
		average,
		enum_count
	};

	// You then define the symbols to associate with your enum values.
	// These will be indexed starting at zero.
	// You must have one for each item in the actual enum.

	enum_map operations_range = {
		"collect",
		"average"
	};

	// Finally, you create the attribute...
	// specialized with the type of the enum and with the range passed as one of the optional args.

	attribute<operations> operation { this, "operation", operations::collect, operations_range,
		description {"Choose the operation to perform with the input. Collect items into a list or calculate the mean from a list."}
	};


	// Here we demonstrate sharing a function to process lists from either the 'list' or 'anything' messages.

	c74::min::function process = MIN_FUNCTION {
		switch (operation) {
			case operations::collect: {
				lock lock { m_mutex };
				m_data.reserve( m_data.size() + args.size() );
				m_data.insert( m_data.end(), args.begin(), args.end() );
				break;
			}
			case operations::average: {
				lock lock { m_mutex };
				auto x = from_atoms<std::vector<double>>(args);
				auto y = math::mean<double>(x);
				lock.unlock();
				out1.send(y.first, y.second);
				break;
			}
			case operations::enum_count:
				break;
		}
		return {};
	};
	
	message<threadsafe::yes> list		{ this, "list", "Operate on the list. Either add it to the collection or calculate the mean.", process };
	message<threadsafe::yes> anything	{ this, "anything", "Add content to the collection. Only applicable if using the 'collect' operation.", process };
	message<threadsafe::yes> number		{ this, "number", "Add content to the collection. Only applicable if using the 'collect' operation.", process };

	message<threadsafe::yes> bang		{ this, "bang", "Send out the collected list. Only applicable if using the 'collect' operation.",
		MIN_FUNCTION {
			lock lock { m_mutex };
			atoms data_copy = m_data;
			m_data.clear();
			lock.unlock();

			out1.send(data_copy);
			return {};
		}
	};

private:
	atoms	m_data;
	mutex	m_mutex;
};

MIN_EXTERNAL(list_process);
