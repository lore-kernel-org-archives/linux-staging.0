Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DE5403AF7;
	Mon,  3 Aug 2026 12:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.181.215.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785759407; cv=none; b=HCbF13VuL7YhYwQmwK4klKYyilOzW9+/U8H/uEFV8gCXJXkFy2qvt0cCt7W9W/bF76WsSRlcinEpQiO4ZzGyC+Rbx4PL3CwSs/xAT0jHVFITRejIIFUDH88tDKmNzDAKwXSH5H57qduw/iHtKj0CCbOz2l6Lpfa23ZS8PdFRroU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785759407; c=relaxed/simple;
	bh=YYFD90m5so6A9XTI4F2KjgkyK7i3tZMuKU0gjw+/xxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a76N5O7Ai4gkAtYdBwsW1kYqSQFXDTeJVfNaLO6FrVU1GfvfyOsuiT356qAlnOP0H4gtGcqKl/hX7o3x169nvvEeWTFQPBOJLEogd9N4jpyEK3Encthw+qEXokZWiSjhDU/JkRJcDDsRLV9LPKhKQVtGUrcExM+A1Jt7gkxq6E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz; spf=pass smtp.mailfrom=xff.cz; dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b=d7cBSibY; arc=none smtp.client-ip=195.181.215.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xff.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b="d7cBSibY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1785759394; bh=YYFD90m5so6A9XTI4F2KjgkyK7i3tZMuKU0gjw+/xxo=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=d7cBSibYeRaoiuQbfgChwVHHFRL1rN61EuS/9W7w4yWJxgwmZKbnCO2qEV7g5qnm3
	 rEKjwKQg/7ORITk5newcbrPSsN4WcoZ5sSMCHhW6OOxYch5+u/e0Lq940GdsEwhC4n
	 q1POPLO2guzGhba30dPOecXC1LyTpJAiH2T9Ltzw=
Date: Mon, 3 Aug 2026 14:16:33 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arash Golgol <arash.golgol@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH 00/16] media: sun6i-csi/isp MC-centric support and
 cleanups
Message-ID: <w72t67p2sucsppxclldfbfenl6hzgwkru4rsvxenfta7duah7h@nbeim2a2ssjt>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	Paul Kocialkowski <paulk@sys-base.io>, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arash Golgol <arash.golgol@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20260518102451.417971-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518102451.417971-1-paulk@sys-base.io>

Hi,

Just a heads up. I'm currently working on sun6i-isp support for A83T (so far all
the details seem to be turning out fully compatible with V3s), and I just
noticed this patch series. I'm basing my work on top of linux-next, which
doesn't have this series yet, sadly.

I'm working with YUYV input (because that's what I have currently on my A83T
tablet with HM5065 sensor - adding bayer output to it would be another can of
worms) and I re-organized the driver to support both the dual output mode
+ rotation (can be enabled on one output only at a time, due to HW limitations).

I also added missing pipeline blocks to the driver and statistics configuration
and buffer output (all very similar to how rkisp1 does this, which I have quite
a bit of experience with) + missing formats that thw HW supports.

So I'm pretty far into the whole re-debug on device process on this driver. :)

It would be nice if this series landed so I can submit my work without conflicts.
And I'm also sending this mail so that people know there's someone working on
this driver, to not duplicate work.

And it would be nice once I submit it if someone with bayer output sensor would
do the tests on ISP blocks that work with that (which are also part of my work
but will be untested).

Best regards,
	o.j.

On Mon, May 18, 2026 at 12:24:35PM +0200, Paul Kocialkowski wrote:
> This series first introduces some fixes and new formats to v4l2 format
> info, one of which we need for the sun6i-csi driver. Support for
> MC-centric format enumeration is then added, along with cleanups and
> improvements for both the sun6i-csi and sun6i-isp drivers.
> 
> The first 4 patches are already reviewed and ready to go and are
> included here as a reminder that this series depends on them.
> 
> Arash Golgol (4):
>   media: sun6i-csi: bridge: Use V4L2 subdev active state
>   media: sun6i-csi: capture: Implement vidioc_enum_framesizes
>   media: sun6i-mipi-csi2: Use V4L2 subdev active state
>   media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state
> 
> Paul Kocialkowski (12):
>   media: v4l2-common: Fix NV15_4L4 format info block height
>   media: v4l2-common: Add missing tiled format info block sizes
>   media: v4l2-common: Add NV12_16L16 pixel format to v4l2 format info
>   media: v4l2-common: Add NV12_32L32 pixel format to v4l2 format info
>   media: sun6i-csi: Split format validation to a dedicated helper
>   media: sun6i-csi: Add support for MC-centric format enumeration
>   media: sun6i-csi: Tidy up and unify coding style
>   media: sun6i-mipi-csi2: Fix parenthesis alignment
>   media: sun6i-isp: Add dummy params link_validate implementation
>   media: sun6i-isp: Use V4L2 subdev active state
>   media: sun6i-isp: Add support for MC-centric format enumeration
>   media: sun6i-isp: Add support for frame size enumeration
> 
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 153 +++++++---------
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 168 +++++++++++++-----
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 ++++++-----
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
>  .../sun8i_a83t_mipi_csi2.c                    | 113 ++++++------
>  .../sun8i_a83t_mipi_csi2.h                    |   2 -
>  drivers/media/v4l2-core/v4l2-common.c         |  12 +-
>  .../media/sunxi/sun6i-isp/sun6i_isp_capture.c |  47 ++++-
>  .../media/sunxi/sun6i-isp/sun6i_isp_params.c  |  37 +++-
>  .../media/sunxi/sun6i-isp/sun6i_isp_params.h  |   4 +-
>  .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    | 117 ++++++------
>  .../media/sunxi/sun6i-isp/sun6i_isp_proc.h    |   7 -
>  13 files changed, 437 insertions(+), 341 deletions(-)
> 
> -- 
> 2.54.0
> 
