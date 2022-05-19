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

	/*
		Application class - handles the setup of an application instance
	*/
	class Application final
	{

	};

	// To be implemented by client projects to create an application instance (window instance)

}
