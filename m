Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969CF156F5
	for <linux-staging@lists.linux.dev>; Mon, 18 Sep 2023 09:30:17 +0000 (UTC)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 30AB824E2BA;
	Mon, 18 Sep 2023 17:30:09 +0800 (CST)
Received: from EXMBX073.cuchost.com (172.16.6.83) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 18 Sep
 2023 17:30:09 +0800
Received: from [192.168.1.218] (180.164.60.184) by EXMBX073.cuchost.com
 (172.16.6.83) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 18 Sep
 2023 17:30:08 +0800
Message-ID: <41370a5d-ffa3-f85b-aa2a-b6dd9cc570f6@starfivetech.com>
Date: Mon, 18 Sep 2023 17:30:08 +0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v9 0/8] Add StarFive Camera Subsystem driver
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Robert Foss <rfoss@kernel.org>, Todor Tomov
	<todor.too@gmail.com>, <bryan.odonoghue@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-staging@lists.linux.dev>,
	<changhuang.liang@starfivetech.com>
References: <20230914031607.34877-1-jack.zhu@starfivetech.com>
 <11735008-1adf-4b84-9023-d295371caed5@xs4all.nl>
Content-Language: en-US
From: Jack Zhu <jack.zhu@starfivetech.com>
In-Reply-To: <11735008-1adf-4b84-9023-d295371caed5@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX073.cuchost.com
 (172.16.6.83)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable

Hi Hans=EF=BC=8C

Thanks for your comment.

On 2023/9/15 17:26, Hans Verkuil wrote:
> On 14/09/2023 05:15, Jack Zhu wrote:
>> Hi,
>>=20
>> This series is the v9 series that attempts to support the Camera Subsy=
stem
>> found on StarFive JH7110 SoC.
>>=20
>> This series is based on top of the master branch of media_stage reposi=
tory.
>>=20
>> The following are the media graph for the device and the v4l2-complian=
ce
>> output.
>>=20
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>> [the media graph]:
>>=20
>> digraph board {
>> 	rankdir=3DTB
>> 	n00000001 [label=3D"{{<port0> 0} | stf_isp\n/dev/v4l-subdev0 | {<port=
1> 1}}", shape=3DMrecord, style=3Dfilled, fillcolor=3Dgreen]
>> 	n00000001:port1 -> n00000008 [style=3Ddashed]
>> 	n00000004 [label=3D"capture_raw\n/dev/video0", shape=3Dbox, style=3Df=
illed, fillcolor=3Dyellow]
>> 	n00000008 [label=3D"capture_yuv\n/dev/video1", shape=3Dbox, style=3Df=
illed, fillcolor=3Dyellow]
>> 	n0000000e [label=3D"{{<port0> 0} | cdns_csi2rx.19800000.csi-bridge\n =
| {<port1> 1 | <port2> 2 | <port3> 3 | <port4> 4}}", shape=3DMrecord, sty=
le=3Dfilled, fillcolor=3Dgreen]
>> 	n0000000e:port1 -> n00000001:port0 [style=3Ddashed]
>> 	n0000000e:port1 -> n00000004 [style=3Ddashed]
>> 	n00000018 [label=3D"{{} | imx219 6-0010\n/dev/v4l-subdev1 | {<port0> =
0}}", shape=3DMrecord, style=3Dfilled, fillcolor=3Dgreen]
>> 	n00000018:port0 -> n0000000e:port0 [style=3Dbold]
>> }
>>=20
>> [the device topology]:
>>=20
>> Media controller API version 6.5.0
>>=20
>> Media device information
>> ------------------------
>> driver          starfive-camss
>> model           Starfive Camera Subsystem
>> serial         =20
>> bus info        platform:19840000.camss
>> hw revision     0x0
>> driver version  6.5.0
>>=20
>> Device topology
>> - entity 1: stf_isp (2 pads, 2 links)
>>             type V4L2 subdev subtype Unknown flags 0
>>             device node name /dev/v4l-subdev0
>> 	pad0: Sink
>> 		[fmt:SRGGB10_1X10/1920x1080 field:none colorspace:srgb
>> 		 crop.bounds:(0,0)/1920x1080
>> 		 crop:(0,0)/1920x1080]
>> 		<- "cdns_csi2rx.19800000.csi-bridge":1 []
>> 	pad1: Source
>> 		[fmt:YUYV8_1_5X8/1920x1080 field:none colorspace:srgb
>> 		 crop.bounds:(0,0)/1920x1080
>> 		 crop:(0,0)/1920x1080]
>> 		-> "capture_yuv":0 []
>>=20
>> - entity 4: capture_raw (1 pad, 1 link)
>>             type Node subtype V4L flags 0
>>             device node name /dev/video0
>> 	pad0: Sink
>> 		<- "cdns_csi2rx.19800000.csi-bridge":1 []
>>=20
>> - entity 8: capture_yuv (1 pad, 1 link)
>>             type Node subtype V4L flags 0
>>             device node name /dev/video1
>> 	pad0: Sink
>> 		<- "stf_isp":1 []
>>=20
>> - entity 14: cdns_csi2rx.19800000.csi-bridge (5 pads, 3 links)
>>              type V4L2 subdev subtype Unknown flags 0
>> 	pad0: Sink
>> 		<- "imx219 6-0010":0 [ENABLED,IMMUTABLE]
>> 	pad1: Source
>> 		-> "stf_isp":0 []
>> 		-> "capture_raw":0 []
>> 	pad2: Source
>> 	pad3: Source
>> 	pad4: Source
>>=20
>> - entity 24: imx219 6-0010 (1 pad, 1 link)
>>              type V4L2 subdev subtype Sensor flags 0
>>              device node name /dev/v4l-subdev1
>> 	pad0: Source
>> 		[fmt:SRGGB10_1X10/3280x2464 field:none colorspace:srgb xfer:srgb ycb=
cr:601 quantization:full-range
>> 		 crop.bounds:(8,8)/3280x2464
>> 		 crop:(8,8)/3280x2464]
>> 		-> "cdns_csi2rx.19800000.csi-bridge":0 [ENABLED,IMMUTABLE]
>>=20
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>> [the v4l2-compliance output]:
>>=20
>> v4l2-compliance 1.24.1, 64 bits, 64-bit time_t
>=20
> This v4l2-compliance version is from a distro. For driver acceptance yo=
u
> must test with a v4l2-compliance compiled from the git repo (git://linu=
xtv.org/v4l-utils.git).
>=20

It is compiled from buildroot, but its source code is also downloaded fro=
m the repo tag v4l-utils-1.24.1.
Do you mean I should use the latest stable version (stable-1.24) on the r=
epo?

--=20
Regards,

Jack Zhu
