## XBMC4Xbox
If you like my work and want keep me motivated to bring awesome stuffs to best console of all times, consider [buying me a cofee](https://www.buymeacoffee.com/antonic901)!

<a href="https://www.buymeacoffee.com/antonic901" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

<p align="center"><img width="460" height="300" src="https://github.com/antonic901/xbmc4xbox-redux/blob/master/media/Splash.png?raw=true"></p>

## Official Links
 - [XBMC4Xbox Official Website](https://www.xbmc4xbox.org.uk)
 - [XBMC4Xbox Forum](https://www.xbmc4xbox.org.uk/forum/)
 - [XBMC4Xbox Development](https://www.xbmc4xbox.org.uk/development/)
 - [XBMC4Xbox SVN Repository](https://svn.exotica.org.uk:8443/xbmc4xbox/)
 - [Repository Browser](https://redmine.exotica.org.uk/projects/xbmc4xbox/repository)

**All latest code will be available on official SVN repo. When building please use it instead of this GITHUB repo.**

## Table of Contents
- [Goal](#goal)
- [Info](#info)
- [Roadmap](#roadmap)
- [Requirements](#requirements)
- [How to build](#how-to-build)
- [Running](#running)
- [Video](#video)
- [Some images](#some-images)

## Goal
My goal is to port as much as I can from Kodi. Currently my main task is to port as many as I can stuffs from Kodi's GUILIB. I have started with XBMC Eden and I'm going over all XBMC Skinning Changes threads on Kodi forum. Some stuffs are easy to port but some are not. I'm currently porting the biggest one and then I will try to port also the one that are not so important. After that I will maybe take a look to bring code base more up to date with Kodi 15/16 but that's not my main task. My main task is to have latest Estuary skin working on XBMC4Xbox.

## Info
Everything started with my [Stream Movies & TV Shows](https://github.com/antonic901/xbox-streaming-app) app for Original Xbox. I didn't have any experience with XBMC scripts nor Skinning Engine. Also I had a really small amount of experience in Python making things even more worse. But day after day, week after week and month after month I've managed to pull that off and by the end of February 2022. I had working Streaming app for OG Xbox. After that I've created two more XBMC plugins which were [Watch YouTube on Original Xbox](https://github.com/antonic901/xbox-youtube) and [Listen Radio on Original Xbox](https://github.com/antonic901/xbox-radio). After I wanted to fix long time broken Weather feature and that was my first encounter with XBMC source code. After fixing weather I had an idea to port official Kodi skin known as Estuary but after taking a closer look on that I know that's not going to happen because XBMC's GUILIB was missing a lot of Kodi features. So I have started to inspect Kodi PR's history and thanks to forum threads that had information for each version what has changed or was added I manage to port a lot of features from Kodi's GUILIB making a port of Esturay skin a thing again. With current fixes I have manage to use Estuary from latest Kodi Nexus release and it's working pretty good. Ofcourse skin will need some modifications just like they did witch Confluence Lite back in the day but that is an easy part.

## Roadmap

**XBMC Gotham (13)**
| Description | Kodi PR | Kodi Commit | Kodi Thread | More info | Priority | Status | Notes |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **New control positioning method:** control positioning | [#3451](https://github.com/xbmc/xbmc/pull/3451) | [commit](https://github.com/xbmc/xbmc/commit/a52edf6fecb8056203d0575150508901ae0868f3) | [thread](https://forum.kodi.tv/showthread.php?tid=176115) | [link](https://forum.kodi.tv/showthread.php?tid=158812&pid=1541008#pid1541008) | IMMEDIATE | ✗ | N/A |
| **Containers:** Option to get content from directories | [#3522](https://github.com/xbmc/xbmc/pull/3522) | [commit](https://github.com/xbmc/xbmc/commit/82970664a80d67554f2a5828a7a6b1e985e06d99) | [thread](https://forum.kodi.tv/showthread.php?tid=176864) | [link](https://forum.kodi.tv/showthread.php?tid=158812&pid=1549040#pid1549040) | NORMAL | ✗ | N/A |
| **Containers:** Add support for auto-scrolling in containers | [#3792](https://github.com/xbmc/xbmc/pull/3792) | [commit](https://github.com/Black09/xbmc/commit/b5eeb1d83c6473b28ca94a1973bf99d61cb87359) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=158812&pid=1594636#pid1594636) | NORMAL | ✗ | N/A |
| **Label control:** add support for `<width>auto</width>` | [#2023](https://github.com/xbmc/xbmc/pull/2023) | [commit](https://github.com/xbmc/xbmc/commit/996c64e0a8f98b1f3643461262103906c20e8d37) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=158812&pid=1389325#pid1389325) | IMMEDIATE | ✗ | N/A |
| **Label parsing:** add support for $NUMBER[] in labels | [#3919](https://github.com/xbmc/xbmc/pull/3919) | [commit](https://github.com/xbmc/xbmc/commit/bcbd22b4cba604f3f559ae394b0bbbd4e5a4b68f) | [thread](https://forum.kodi.tv/showthread.php?tid=181529) | [link](https://forum.kodi.tv/showthread.php?tid=158812&pid=1592939#pid1592939) | IMMEDIATE | ✗ | N/A |
| **Button & Edit control:** add support for `<invalidcolor>` | [#3088](https://github.com/xbmc/xbmc/pull/3088) | N/A | N/A | [link](https://forum.kodi.tv/showthread.php?tid=158812&pid=1503819#pid1503819) | LOW | ✗ | N/A |
| **Radiobutton control:** add separate radio textures for focused/unfocused states | [#2876](https://github.com/xbmc/xbmc/pull/2876) | [commit](https://github.com/xbmc/xbmc/commit/e387a4e565b83b77b42fcd982c05c172f4027fb3) | [thread](https://forum.kodi.tv/showthread.php?tid=164787) | [link](https://forum.kodi.tv/showthread.php?tid=158812&pid=1526793#pid1526793) | IMMEDIATE | ✗ | N/A |
| **Textbox control:** add support for auto height | [#4085](https://github.com/xbmc/xbmc/pull/4085) | [commit](https://github.com/xbmc/xbmc/commit/2db7d501652ff582ad163a6439dab5c19d2fb38c) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=158812&pid=1618131#pid1618131) | NORMAL | ✗ | N/A |
| **Textures:** add support for colordiffuse attribute | [#1772](https://github.com/xbmc/xbmc/pull/1772) | [commit](https://github.com/xbmc/xbmc/commit/20b850eea370d0718959c7af9698a45721e91d7f) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=158812&pid=1437421#pid1437421) | IMMEDIATE | ✗ | N/A |
| **Add support for artwork in lists with directory content:** Including artwork | [#4094](https://github.com/xbmc/xbmc/pull/4094) | [commit](https://github.com/xbmc/xbmc/commit/b1a0a017aa59ea91130303ae0067577bb7748a32) | [thread](https://forum.kodi.tv/showthread.php?tid=176864) | [link](https://forum.kodi.tv/showthread.php?tid=158812&pid=1632401#pid1632401) | NORMAL | ✗ | N/A |

**Kodi Helix (14)**
| Description | Kodi PR | Kodi Commit | Kodi Thread | More info | Priority | Status | Notes |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Font.xml:** remove unicode="true" attribute | [#4740](https://github.com/xbmc/xbmc/pull/4740) | [commit](https://github.com/xbmc/xbmc/commit/14850f61dccdaaef90178569f2c8946d89a5a74a) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=194515&pid=1744576#pid1744576) | LOW | ✗ | N/A |
| **Image controls inside containers - aspect change:** info images will now stretch by default | [#4613](https://github.com/xbmc/xbmc/pull/4613) | [commit](https://github.com/xbmc/xbmc/commit/8a73336e95387d960c9ce16d3078f5740a180a37) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=194515&pid=1718572#pid1718572) | NORMAL | ✗ | N/A |
| **Label controls inside containers - alignment change:** `<left>` will now always be the left side of the control | [#4613](https://github.com/xbmc/xbmc/pull/4613) | [commit](https://github.com/xbmc/xbmc/commit/917b1ec27e2caaa67afc002b4877ac32ec325d60) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=194515&pid=1718582#pid1718582) | NORMAL | ✗ | N/A |

**Kodi Isengard (15)**
| Description | Kodi PR | Kodi Commit | Kodi Thread | More info | Priority | Status | Notes |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Textbox control:** alignment change | [#6277](https://github.com/xbmc/xbmc/pull/6277) | [commit](https://github.com/xbmc/xbmc/commit/20dd1905fb50e6e6cb32096934b978734b5a0fc9) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=211896&pid=1909194#pid1909194) | NORMAL | ✗ | N/A |
| **Fonts:** [CAPITALIZE] tag | [#6599](https://github.com/xbmc/xbmc/pull/6599) | [commit](https://github.com/xbmc/xbmc/commit/4e542f704689f9ce3b6279b000deb646357ea601) | [thread](https://forum.kodi.tv/showthread.php?tid=220249) | [link](https://forum.kodi.tv/showthread.php?tid=211896&pid=1952070#pid1952070) | IMMEDIATE | ✗ | N/A |
| **Includes:** option to pass params to includes | [#4876](https://github.com/xbmc/xbmc/pull/4876) | [commit](https://github.com/xbmc/xbmc/commit/6f66aaf4fe9e0934e0bd06495c19c60becf90f11) | [thread](https://forum.kodi.tv/showthread.php?tid=190135) | [link](https://forum.kodi.tv/showthread.php?tid=211896&pid=1960946#pid1960946) | IMMEDIATE | ✗ | N/A |

**Kodi Jarvis (16)**
| Description | Kodi PR | Kodi Commit | Kodi Thread | More info | Priority | Status | Notes |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **New tags:** menucontrol | [#3885](https://github.com/xbmc/xbmc/pull/3885) | [commit](https://github.com/xbmc/xbmc/commit/f3c46e0091dd3b1433bc9ca133e0357d6cc32ec1) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=231270&pid=2080369#pid2080369) | HIGH | ✗ | N/A |
| **New tags:** depth | [#8147](https://github.com/xbmc/xbmc/pull/8147) | [commit](https://github.com/xbmc/xbmc/commit/108c0346668480e75322b014564a9e5976fcf219) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=231270&pid=2132284#pid2132284) | HIGH | ✗ | N/A |
| **New tags:** oninfo | [#8169](https://github.com/xbmc/xbmc/pull/8169) | [commit](https://github.com/xbmc/xbmc/commit/4f0c05987df97f1ae4c36804eb35a9dcb466050f) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=231270&pid=2137695#pid2137695) | HIGH | ✗ | N/A |
| **Removed tags:** allowoverlay | [#7516](https://github.com/xbmc/xbmc/pull/7516) | [commit](https://github.com/xbmc/xbmc/commit/605bd9697618eed8bae298f09c6249db3d2252ae) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=231270&pid=2084427#pid2084427) | LOW | ✗ | N/A |
| **New attributes:** sortby/sortorder for content tag | [#7822](https://github.com/xbmc/xbmc/pull/7882) | [commit](https://github.com/xbmc/xbmc/commit/ea9faae3677d5a69c8e75111bcfb9387ddfe3d45) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=231270&pid=2095392#pid2095392) | NORMAL | ✗ | N/A |
| **Changed built-in functions:** Control.SetFocus() | [#7218](https://github.com/xbmc/xbmc/pull/7218) | [commit](https://github.com/phil65/xbmc/commit/171dba408f3cbd86c6569b968dbd3eb6637d3950) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=231270&pid=2052021#pid2052021) | IMMEDIATE | ✗ | N/A |
| **Button control:** auto width support | [#7357](https://github.com/xbmc/xbmc/pull/7357) | [commit](https://github.com/xbmc/xbmc/commit/25990070b338e8b69050ccf8260e7ee2596bb786) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=231270&pid=2054911#pid2054911) | HIGH | ✗ | N/A |
| **Button control:** wrapmultiline support | [#7357](https://github.com/xbmc/xbmc/pull/7357) | [commit](https://github.com/xbmc/xbmc/commit/25990070b338e8b69050ccf8260e7ee2596bb786) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=231270&pid=2141918#pid2141918) | HIGH | ✗ | N/A |
| **Container controls:** onclick override | [#8178](https://github.com/xbmc/xbmc/pull/8178) | [commit](https://github.com/xbmc/xbmc/commit/3acbdec94ae0d2b0debce4d54d37ef83be476fb1) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=231270&pid=2136130#pid2136130) | NORMAL | ✗ | N/A |
| **Container controls:** onfocus / onunfocus | [#8177](https://github.com/xbmc/xbmc/pull/8177) | [commit](https://github.com/xbmc/xbmc/commit/90241d66c841cc96d7c06dbc8614c9f61d1a1f44) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=231270&pid=2137693#pid2137693) | NORMAL | ✗ | N/A |
| **Fadelabel control:** new scroll tag | [#7454](https://github.com/xbmc/xbmc/pull/7454) | [commit](https://github.com/xbmc/xbmc/commit/64090ec819862008c902bb9eb7c069838460467a) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=231270&pid=2054912#pid2054912) | NORMAL | ✗ | N/A |
| **Fadelabel control:** new randomize tag | [#7900](https://github.com/xbmc/xbmc/pull/7900) | [commit](https://github.com/xbmc/xbmc/commit/b90a8b187453614c8dd2f7295936bf2712e53dd5) |  | [link](https://forum.kodi.tv/showthread.php?tid=231270&pid=2109482#pid2109482) | NORMAL | ✗ | N/A |
| **Grouplist control:** Container(id).CurrentItem / NumItems support | [#7768](https://github.com/xbmc/xbmc/pull/7768) | [commit](https://github.com/xbmc/xbmc/commit/b3ec824c395a540cf4a71ef8bee5d91c527ccab6) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=231270&pid=2077865#pid2077865) | NORMAL | ✗ | N/A |
| **Grouplist control:** justified alignment | [#7809](https://github.com/xbmc/xbmc/pull/7809) | [commit](https://github.com/xbmc/xbmc/commit/efca3e188e251c96a0e0da14a8441d6ee0d2aa89) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=231270&pid=2122471#pid2122471) | NORMAL | ✗ | N/A |
| **Radiobutton control:** textureradioondisabled textureradiooffdisabled | [#7505](https://github.com/xbmc/xbmc/pull/7505) | [commit](https://github.com/hudokkow/xbmc/commit/8a8412d256f72cb3e2e571484bf329505d05fe0d) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=231270&pid=2055208#pid2055208) | HIGH | ✗ | N/A |
| **Radiobutton control:** label2 support | [#7686](https://github.com/xbmc/xbmc/pull/7686) | [commit](https://github.com/xbmc/xbmc/commit/e4b2d0ad20edb7cc759bbf25b56a89e9422e7838) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=231270&pid=2073580#pid2073580) | LOW | ✗ | N/A |
| **Spincontrol:** textureupdisabled texturedowndisabled | [#7505](https://github.com/xbmc/xbmc/pull/7505) | [commit](https://github.com/hudokkow/xbmc/commit/8a8412d256f72cb3e2e571484bf329505d05fe0d) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=231270&pid=2055208#pid2055208) | HIGH | ✗ | N/A |
| **Spincontrolex:** textureupdisabled texturedowndisabled | [#7505](https://github.com/xbmc/xbmc/pull/7505) | [commit](https://github.com/hudokkow/xbmc/commit/8a8412d256f72cb3e2e571484bf329505d05fe0d) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=231270&pid=2055208#pid2055208) | HIGH | ✗ | N/A |
| **Textbox control:** Container(id).HasNext / HasPrevious support | [#7769](https://github.com/xbmc/xbmc/pull/7769) | [commit](https://github.com/xbmc/xbmc/commit/184261c9a3e0277f2215f26601dc29aec2b324f6) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=231270&pid=2077863#pid2077863) | NORMAL | ✗ | N/A |
| **Togglebutton control:** wrapmultiline support | [#7631](https://github.com/xbmc/xbmc/pull/7631) | [commit](https://github.com/xbmc/xbmc/commit/0c13d57f6ba03e2a41047b0bd156273de15165c4) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=231270&pid=2073571#pid2073571) | NORMAL | ✗ | N/A |
| **Includes:** option to conditionally include files | [#7208](https://github.com/xbmc/xbmc/pull/7208) | [commit](https://github.com/xbmc/xbmc/commit/a962441684064a65471f3800e7f14524d41a7fba) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=231270&pid=2046412#pid2046412) | IMMEDIATE | ✗ | N/A |
| **Zorder:** cleanup | [#7492](https://github.com/xbmc/xbmc/pull/7492) | [commit](https://github.com/xbmc/xbmc/commit/6e04fdf86d73c4f1fb1bf9e77b704e04f7fc3f3b) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=231270&pid=2052081#pid2052081) | HIGH | ✗ | N/A |
| **Fonts:** light weight option | [#8182](https://github.com/xbmc/xbmc/pull/8182) | [commit](https://github.com/xbmc/xbmc/commit/9c5bddaf29fda4ed193a096e3d2c9efb6f329e53) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=231270&pid=2129012#pid2129012) | LOW | ✗ | N/A |

**Kodi Krypton (17)**
| Description | Kodi PR | Kodi Commit | Kodi Thread | More info | Priority | Status | Notes |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **New feature:** expression / EXP[] | [#9327](https://github.com/xbmc/xbmc/pull/9327) | [commit](https://github.com/xbmc/xbmc/commit/8d55ebe92337bdde3d5fb5cee60ce076c0e3649d) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=250862&pid=2280099#pid2280099) | IMMEDIATE | ✗ | N/A |
| **New feature:** context menu for directory providers | [#9257](https://github.com/xbmc/xbmc/pull/9257) | [commit](https://github.com/xbmc/xbmc/commit/c35b26d847de3a5826d377354e492d6de1d2cf4e) |  | [link](https://forum.kodi.tv/showthread.php?tid=250862&pid=2286167#pid2286167) | NORMAL | ✗ | N/A |
| **Includes:** changed reference attribute | [#9114](https://github.com/xbmc/xbmc/pull/9114) | [commit](https://github.com/xbmc/xbmc/pull/9114/commits/f084ad5bd3461999982f32b81cc9e832a8be75e7) | [thread](https://forum.kodi.tv/showthread.php?tid=259585) | [link](https://forum.kodi.tv/showthread.php?tid=250862&pid=2300137#pid2300137) | IMMEDIATE | ✗ | N/A |
| **Grouplist control:** `<defaultcontrol>` support  | [#8501](https://github.com/xbmc/xbmc/pull/8501) | [commit](https://github.com/xbmc/xbmc/commit/127c59baf9605bb64854b3ce0c4265b00b31a099) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=250862&pid=2211601#pid2211601) | NORMAL | ✗ | N/A |
| **Slider control:** `<orientation>` support | [#9704](https://github.com/xbmc/xbmc/pull/9704) | [commit](https://github.com/xbmc/xbmc/commit/578e9d50cc97f7055b2ebcbb1154508fab41d958) | [thread](https://forum.kodi.tv/showthread.php?tid=271091) | [link](https://forum.kodi.tv/showthread.php?tid=250862&pid=2341033#pid2341033) | NORMAL | ✗ | N/A |

**Kodi Leia (18)**
| Description | Kodi PR | Kodi Commit | Kodi Thread | More info | Priority | Status | Notes |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Custom containers:** multiple content tags | [#10730](https://github.com/xbmc/xbmc/pull/10730) | [commit](https://github.com/xbmc/xbmc/commit/2c1977f70d44398edda6b5baf6e854c8a790cc8f) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=298565&pid=2578642#pid2578642) | NORMAL | ✗ | N/A |
| **Origin, camera & animation attributes:** r offset and % value support <br /> **scaling improvements:** % and r-suffixed vaues for position attributes | [#1233](https://github.com/xbmc/xbmc/pull/11233) | N/A | N/A | [link](https://forum.kodi.tv/showthread.php?tid=298565&pid=2488040#pid2488040) | HIGH | ✗ | N/A |
| **Font.xml:** Add support for includes | [#11379](https://github.com/xbmc/xbmc/pull/11379) | [commit](https://github.com/xbmc/xbmc/commit/affdfe4e1ec6b2132e2f8fb58b45b777f9a35c47) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=298565&pid=2578641#pid2578641) | LOW | ✗ | N/A |

**Kodi Matrix (19)**
| Description | Kodi PR | Kodi Commit | Kodi Thread | More info | Priority | Status | Notes |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **New control type:** ranges | [#15767](https://github.com/xbmc/xbmc/pull/15767) | [commit](https://github.com/xbmc/xbmc/commit/cfba380151e001e096266c506c96803d031d2014) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=343076&pid=2846526#pid2846526) | LOW | ✗ | N/A |
| **Functional change:** always load skin from Startup.xml | [#18319](https://github.com/xbmc/xbmc/pull/18319) | [commit](https://github.com/xbmc/xbmc/commit/4fec8426b69f61fd9a6376351a70cdbbf450a46a) | N/A | [link](https://forum.kodi.tv/showthread.php?tid=343076&pid=2973818#pid2973818) | LOW | ✗ | N/A |
| **:**  | []() | [commit]() |  | [link]() |  | ✗ | N/A |

## Requirements
 - PC or [Virtual Machine](https://www.virtualbox.org/) with Windows XP SP3
 - Microsoft Visual C++ 2003 with [XDK (Xbox Development Kit)](https://xbox.fandom.com/wiki/Xbox_Development_Kit)
 - [TortoiseSVN](https://sourceforge.net/projects/tortoisesvn/files/OldFiles/1.7.11/Application/TortoiseSVN-1.7.11.23600-win32-svn-1.7.8.msi/download)
 - [OPTIONAL] [7-Zip](https://www.7-zip.org/a/7z920.msi)
 - [OPTIONAL] [Xbox Debug Kit](https://www.ogxbox.com/forums/uploads/monthly_2020_12/J4Y_1212.jpg.4af38b46ded4f0fe90372b85b4ecf3d2.jpg)

Unfortunately I can't share any of those software because both Microsoft Visual Studio C++ 2003 and Xbox Development Kit are Microsot's property. But on this [link](https://www.youtube.com/watch?v=YN2t-D0cj48) you can find a great tutorial from MVG on how to convert retail consoles to debug kits. I suggest you to use CerBios with flag "debug = enabled" in cerbios.ini file. You then just need to find DEBUG Dash which you will copy to your Xbox and you are ready to go.

## How to build
 - Clone XBMC4Xbox SVN [repo](https://svn.exotica.org.uk:8443/xbmc4xbox/trunk/)
 - Open Build.bat
 - Both times choose option 1 and hit enter
 - After build is finished, inside BUILD folder you will have XBMC4Xbox ready to be installed on Xbox

## Running
 - Rename BUILD folder to XBMC
 - Copy XBMC folder to your Xbox using FTP or any other method
 - Open default.xbe from XBMC and enjoy!

## Video
 [![](https://markdown-videos.deta.dev/youtube/9gbir9Xf4sg)](https://youtu.be/9gbir9Xf4sg)

## Some images
![System information](https://media.discordapp.net/attachments/1050581194401652736/1069292210677350502/Screenshot_2023-01-29_16-44-25.png)
