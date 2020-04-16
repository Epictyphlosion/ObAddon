------------------------------------------------------------------------
--  MODULE: Epic Composite Textures Lump
------------------------------------------------------------------------
--
--  Copyright (C) 2019-2020 MsrSgtShooterPerson
--
--  This program is free software; you can redistribute it and/or
--  modify it under the terms of the GNU General Public License
--  as published by the Free Software Foundation; either version 2
--  of the License, or (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
-------------------------------------------------------------------

EPIC_TEXTUREX_LUMP =
[[
WallTexture "T_TECH01", 128, 512
{
  Patch "PLAT1", -64, 0
  {
    Blend "#E4B381"
  }
  Patch "PLAT1", 64, 0
  {
    Blend "#E4B381"
  }
  Patch "PLAT1", -64, 256
  {
    Blend "#E4B381"
  }
  Patch "PLAT1", 64, 256
  {
    Blend "#E4B381"
  }
  Patch "PLAT1", -64, 384
  {
    FlipY
    Blend "#E4B381"
  }
  Patch "PLAT1", 64, 384
  {
    FlipY
    Blend "#E4B381"
  }
  Patch "PLAT1", -64, 128
  {
    FlipX
    FlipY
    Blend "#E4B381"
  }
  Patch "PLAT1", 64, 128
  {
    FlipX
    FlipY
    Blend "#E4B381"
  }
  Patch "RW37_4", 96, 0
  {
    Blend "#E4B381"
  }
  Patch "RW37_4", 96, 128
  {
    Blend "#E4B381"
  }
  Patch "RW37_4", 96, 256
  {
    Blend "#E4B381"
  }
  Patch "RW37_4", 96, 384
  {
    Blend "#E4B381"
  }
  Patch "RW37_4", -32, 0
  {
    FlipX
    Blend "#E4B381"
  }
  Patch "RW37_4", -32, 128
  {
    FlipX
    Blend "#E4B381"
  }
  Patch "RW37_4", -32, 256
  {
    FlipX
    Blend "#E4B381"
  }
  Patch "RW37_4", -32, 384
  {
    FlipX
    Blend "#E4B381"
  }
  Patch "RW37_2", 64, 488
  {
    Blend "#E4B381"
  }
  Patch "RW37_2", 64, -96
  {
    Blend "#E4B381"
  }
  Patch "RW37_2", 0, 488
  {
    Blend "#E4B381"
  }
  Patch "RW37_2", 0, -96
  {
    Blend "#E4B381"
  }
}

Texture "TP_HLBH", 64, 16
{
  Patch "T14_5", 0, 0
  {
    Rotate 90
  }
}

Texture "TP_HLCRE", 120, 10
{
  Patch "T_HLITE1", -4, -3
}

WallTexture "T_HLITE1", 128, 16
{
  Patch "TP_HLBH", 0, 0
  Patch "TP_HLBH", 64, 0
  {
    FlipX
  }
}

WallTexture "T_HLITEY", 128, 16
{
  Patch "T_HLITE1", 0, 0
  Patch "TP_HLCRE", 4, 3
  {
    Translation "83:111=161:167"
  }
}

WallTexture "T_HLITEG", 128, 16
{
  Patch "T_HLITE1", 0, 0
  Patch "TP_HLCRE", 4, 3
  {
    Translation "84:111=112:127"
  }
}

WallTexture "T_HLITEB", 128, 16
{
  Patch "T_HLITE1", 0, 0
  Patch "TP_HLCRE", 4, 3
  {
    Translation "80:111=192:207"
  }
}

WallTexture "T_GTHLY", 64, 128
{
  Patch "GOTH21", 0, 0
  {
    Translation "168:191=160:167", "17:47=160:167"
  }
}

WallTexture "T_GTHLG", 64, 128
{
  Patch "GOTH21", 0, 0
  {
    Translation "168:191=112:127", "17:47=112:127"
  }
}

WallTexture "T_GTHLB", 64, 128
{
  Patch "GOTH21", 0, 0
  {
    Translation "168:191=192:207", "17:47=192:207"
  }
}

WallTexture "T_GTHLP", 64, 128
{
  Patch "GOTH21", 0, 0
  {
    Translation "168:191=250:254", "17:47=250:254"
  }
}

Texture "TP_LIT5C", 14, 6
{
  Patch "LITE4", -1, 0
}

Texture "TP_LIL5C", 10, 64
{
  Patch "LITE4", -3, -59
}

Texture "T_VLITER", 16, 128
{
  Patch "LITE4", 0, 0
  Patch "LITEBLU4", 0, -72
  {
    Translation "201:207=172:191"
  }
  Patch "TP_LIL5C", 3, 59
  {
    Translation "80:95=169:191", "96:111=191:191"
  }
}

Texture "T_VLITEO", 16, 128
{
  Patch "LITE4", 0, 0
  Patch "LITEBLU4", 0, -72
  {
    Translation "201:207=211:223"
  }
  Patch "TP_LIL5C", 3, 59
  {
    Translation "80:95=211:223", "96:111=223:223"
  }
}

Texture "T_VLITEY", 16, 128
{
  Patch "LITE4", 0, 0
  Patch "LITEBLU4", 0, -72
  {
    Translation "201:207=160:167"
  }
  Patch "TP_LIL5C", 3, 59
  {
    Translation "80:95=160:167", "96:111=167:167"
  }
}

Texture "T_VLITEG", 16, 128
{
  Patch "LITE4", 0, 0
  Patch "LITEBLU4", 0, -72
  {
    Translation "201:207=112:127"
  }
  Patch "TP_LIL5C", 3, 59
  {
    Translation "80:95=112:127", "96:111=127:127"
  }
}

Texture "T_VLITEP", 16, 128
{
  Patch "LITE4", 0, 0
  Patch "LITEBLU4", 0, -72
  {
    Translation "201:207=250:254"
  }
  Patch "TP_LIL5C", 3, 59
  {
    Translation "80:95=250:254", "96:111=254:254"
  }
}

Flat "T_GHFLY", 64, 64
{
  Patch "GLITE04", 0, 0
  {
    Translation "168:191=160:167"
  }
}

Flat "T_GHFLG", 64, 64
{
  Patch "GLITE04", 0, 0
  {
    Translation "168:191=112:127"
  }
}

Flat "T_GHFLB", 64, 64
{
  Patch "GLITE04", 0, 0
  {
    Translation "168:191=192:200"
  }
}

Flat "T_GHFLP", 64, 64
{
  Patch "GLITE04", 0, 0
  {
    Translation "168:191=249:254"
  }
}

Flat "T_CL43R", 64, 64
{
  Patch "CEIL4_3", 0, 0
  {
    Translation "240:247=186:191", "192:207=185:185"
  }
}

Flat "T_CL43Y", 64, 64
{
  Patch "CEIL4_3", 0, 0
  {
    Translation "240:247=164:167", "192:207=163:163"
  }
}

Flat "T_CL43G", 64, 64
{
  Patch "CEIL4_3", 0, 0
  {
    Translation "240:247=120:127", "192:207=119:119"
  }
}

Flat "T_CL43P", 64, 64
{
  Patch "CEIL4_3", 0, 0
  {
    Translation "240:247=252:255", "192:207=252:252"
  }
}
]]