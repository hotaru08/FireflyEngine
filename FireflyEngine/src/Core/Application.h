/*******************************************************************************
* \file			Application.h

* \brief		Defines necessary functionalities of an application developed
*				in FireflyEngine.
*******************************************************************************/
#pragma once

#include <cstdint>

namespace FireflyEngine
{
	// Specifications for defining an application 
	struct AppSpecifications
	{
		char* const m_appName;
		std::uint32_t m_width;
		std::uint32_t m_height;
	};

	class Application final
	{

	};
}
