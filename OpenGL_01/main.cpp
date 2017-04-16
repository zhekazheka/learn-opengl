//
//  main.cpp
//  OpenGL_01
//
//  Created by Yevgeniy Tolstikov on 16/04/2017.
//  Copyright © 2017 HandMade. All rights reserved.
//

#define GLEW_STATIC
#include <GL/glew.h>

#include <iostream>
#include <GLFW/glfw3.h>

int main(int argc, const char * argv[])
{
    glfwInit();
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
    glfwWindowHint(GLFW_RESIZABLE, GL_FALSE);
    
    return 0;
}
