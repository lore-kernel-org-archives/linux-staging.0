Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA63917F
	for <linux-staging@lists.linux.dev>; Tue, 25 May 2021 23:01:57 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1llg3b-00070s-VH; Wed, 26 May 2021 01:01:52 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Ezequiel Garcia <ezequiel@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Lee Jones <lee.jones@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, Alex Bee <knaerzche@gmail.com>
Cc: Alex Bee <knaerzche@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/10] Add support for older Rockchip SoCs to V4L2 hantro and rkvdec drivers
Date: Wed, 26 May 2021 01:01:51 +0200
Message-ID: <38327082.10thIPus4b@diego>
In-Reply-To: <20210525152225.154302-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Alex,

Am Dienstag, 25. Mai 2021, 17:22:15 CEST schrieb Alex Bee:
> Hi list,
> 
> this series adds support for older Rockchip SoCs (RK3036, RK3066, RK3188
> and RK322x) to the existing V4L2 video decoder/-encoder drivers - namely
> hantro and rkvdec.
> They can be used as-is or with very little modifications.
> 
> In preparation to that patches 1-3 add power-controller support for RK3036
> and RK322x, since both drivers rely on pm. The drivers for them exist
> already in the common Rockchip pm driver, they just haven't be added to
> the device trees yet.

on first glance, looks good. Just a small ordering nit, if you need to resend
the series for other reasons:

Please try to order patches like:
(1) dt-binding - compatible addition
(2) driver patches
(3) devicetree node patches

That makes it way easier to keep track of dependencies when glancing at
the series. Like for patches 1+2, I need to wait for Lee to apply (or Ack) the
binding addition in patch 3.

Same for the hantro devicetree additions, that need to wait for both
bindings (and driver) changes to get applied to the media tree.

Thanks
Heiko


> 
> Thanks for your feedback,
> Alex.
> 
> Alex Bee (10):
>   ARM: dts: rockchip: add power controller for RK322x
>   ARM: dts: rockchip: add power controller for RK3036
>   dt-bindings: mfd: syscon: add Rockchip RK3036/RK3228 qos compatibles
>   media: hantro: add support for Rockchip RK3066
>   media: hantro: add support for Rockchip RK3036
>   ARM: dts: rockchip: add vpu nodes for RK3066 and RK3188
>   ARM: dts: rockchip: add vpu node for RK322x
>   media: dt-bindings: media: rockchip-vpu: add new compatibles
>   ARM: dts: rockchip: add vdec node for RK322x
>   media: dt-bindings: media: rockchip-vdec: add RK3228 compatible
> 
>  .../bindings/media/rockchip,vdec.yaml         |  10 +-
>  .../bindings/media/rockchip-vpu.yaml          |  33 +++-
>  .../devicetree/bindings/mfd/syscon.yaml       |   2 +
>  arch/arm/boot/dts/rk3036.dtsi                 |  51 ++++++
>  arch/arm/boot/dts/rk3066a.dtsi                |   4 +
>  arch/arm/boot/dts/rk3188.dtsi                 |   5 +
>  arch/arm/boot/dts/rk322x.dtsi                 | 139 ++++++++++++++-
>  arch/arm/boot/dts/rk3xxx.dtsi                 |  12 ++
>  drivers/staging/media/hantro/hantro_drv.c     |   2 +
>  drivers/staging/media/hantro/hantro_hw.h      |   2 +
>  drivers/staging/media/hantro/rk3288_vpu_hw.c  | 165 ++++++++++++++++++
>  11 files changed, 414 insertions(+), 11 deletions(-)
> 
> 
> base-commit: 5d765451c2409e63563fa6a3e8005bd03ab9e82f
> 




