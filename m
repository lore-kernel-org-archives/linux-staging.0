Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F55724214;
	Mon, 16 Oct 2023 11:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B50C433C8;
	Mon, 16 Oct 2023 11:40:52 +0000 (UTC)
Message-ID: <98297bfc-ab81-4bb5-acc3-619fdf879276@xs4all.nl>
Date: Mon, 16 Oct 2023 13:40:50 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/8] Add StarFive Camera Subsystem driver
Content-Language: en-US, nl
To: Jack Zhu <jack.zhu@starfivetech.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, bryan.odonoghue@linaro.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 changhuang.liang@starfivetech.com
References: <20231008085154.6757-1-jack.zhu@starfivetech.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231008085154.6757-1-jack.zhu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jack,

On 08/10/2023 10:51, Jack Zhu wrote:
> Hi,
> 
> This series is the v10 series that attempts to support the Camera Subsystem
> found on StarFive JH7110 SoC.
> 
> This series is based on top of the master branch of media_stage repository,
> which is tested with a v4l2-compliance compiled from the git repo
> (git://linuxtv.org/v4l-utils.git).

I get one smatch warning:

drivers/staging/media/starfive/camss/stf-isp.c:122 isp_enum_mbus_code() warn: unsigned 'code->index' is never less than zero.

And I also notice that there is no TODO file: staging drivers should have a
TODO file explaining what needs to be done to get them out of staging.

I'm curious to know that as well :-)

It looks like there is a lot of additional development that can be done, since
most of the ISP parameters appear to be hardcoded.

I also notice something weird in the compliance test output for v4l-subdev0 vs
v4l-subdev1:

> Compliance test for starfive-camss device /dev/v4l-subdev0:
> 
> Driver Info:
> 	Driver version   : 6.6.0
> 	Capabilities     : 0x00000000
> Media Driver Info:
> 	Driver name      : starfive-camss
> 	Model            : Starfive Camera Subsystem
> 	Serial           : 
> 	Bus info         : platform:19840000.camss
> 	Media version    : 6.6.0
> 	Hardware revision: 0x00000000 (0)
> 	Driver version   : 6.6.0
> Interface Info:
> 	ID               : 0x0300001c
> 	Type             : V4L Sub-Device
> Entity Info:
> 	ID               : 0x00000001 (1)
> 	Name             : stf_isp
> 	Function         : Image Signal Processor
> 	Pad 0x01000002   : 0: Sink
> 	  Link 0x02000014: from remote pad 0x1000010 of entity 'cdns_csi2rx.19800000.csi-bridge' (Video Interface Bridge): Data, Enabled
> 	Pad 0x01000003   : 1: Source
> 	  Link 0x0200000c: to remote pad 0x1000009 of entity 'capture_yuv' (V4L2 I/O): Data, Enabled

Here it shows the Media Driver Info for v4l-subdev0.

<snip>

> --------------------------------------------------------------------------------
> Compliance test for device /dev/v4l-subdev1:
> 
> Driver Info:
> 	Driver version   : 6.6.0
> 	Capabilities     : 0x00000000

But this does not appear for v4l-subdev1.

I can't really tell why it doesn't show that. Can you debug a little bit?
The code is in v4l2-compliance.cpp, line 1086:

ent_id = mi_media_info_for_fd(media_fd, node.g_fd(), &is_invalid, &node.function);

The mi_media_info_for_fd() function calls ioctl(media_fd, MEDIA_IOC_DEVICE_INFO, &mdinfo),
and that fails for some reason. It could be that media_fd is invalid (would be weird).

This could well be a v4l2-compliance bug that you hit with this driver.

Regards,

	Hans
