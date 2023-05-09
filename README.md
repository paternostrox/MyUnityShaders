# My Unity Shaders
This is the repository for the Unity shaders I've written.
They are listed bellow:

## ShaderLab


### TexNormal.shader
Just a regular shader with a main texture and a normal map field.

### TexNormalRamp.shader 
It works with a main texture, a normal map and custom color ramp texture. It gives a toon-like aesthetic without outlines.

### TexNormalAtlas.shader
An atlas voxel shader, it has a main texture and a normal map field.

### BillboardYFog.shader
This is a billboard shader, it has a main texture field, and rotates it in the Y axis so it always faces the camera, it also takes ambient fog into consideration.

With this shader, 2D assets can appear to be 3D, just like Doom's characters.
