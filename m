Received: from newton.telenet-ops.be (newton.telenet-ops.be [195.130.132.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEC172
	for <linux-staging@lists.linux.dev>; Tue, 12 Oct 2021 18:23:06 +0000 (UTC)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by newton.telenet-ops.be (Postfix) with ESMTPS id 4HTP283lbMzMr38j
	for <linux-staging@lists.linux.dev>; Tue, 12 Oct 2021 20:14:24 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:9c93:91ff:d58:ecfb])
	by laurent.telenet-ops.be with bizsmtp
	id 56EE2600J0KW32a016EEoF; Tue, 12 Oct 2021 20:14:17 +0200
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1maMI2-004QmP-Cm; Tue, 12 Oct 2021 20:14:14 +0200
Date: Tue, 12 Oct 2021 20:14:14 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
X-X-Sender: geert@ramsan.of.borg
To: Christian Gromm <christian.gromm@microchip.com>, 
    gregkh@linuxfoundation.org
cc: Rob Herring <robh+dt@kernel.org>, 
    Nikita Yushchenko <nikita.yoush@cogentembedded.com>, 
    linux-staging@lists.linux.dev, devicetree@vger.kernel.org, 
    linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 23/28] staging: most: dim2: use device tree
In-Reply-To: <1525772716-15742-24-git-send-email-christian.gromm@microchip.com>
Message-ID: <alpine.DEB.2.22.394.2110121749450.1045463@ramsan.of.borg>
References: <1525772716-15742-1-git-send-email-christian.gromm@microchip.com> <1525772716-15742-24-git-send-email-christian.gromm@microchip.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

 	Hi Christian, Greg,

CC devicetree, linux-renesas-soc

On Tue, 8 May 2018, Christian Gromm wrote:
> This patch removes the dependency to platform specific source files
> that do platform specific initialization and supply the IRQ number.
> Instead DT code is added
>
> Signed-off-by: Christian Gromm <christian.gromm@microchip.com>

This patch bypassed review by the DT people, and ended up in v4.18 as
commit 21e57ff086056c01 ("staging: most: dim2: use device tree").

> --- a/drivers/staging/most/dim2/dim2.c
> +++ b/drivers/staging/most/dim2/dim2.c
> +static const struct of_device_id dim2_of_match[] = {
> +	{
> +		.compatible = "fsl,imx6q-mlb150",
> +		.data = plat_data + FSL_MX6
> +	},
> +	{
> +		.compatible = "renesas,mlp",
> +		.data = plat_data + RCAR_H2
> +	},
> +	{
> +		.compatible = "rcar,medialb-dim2",
> +		.data = plat_data + RCAR_M3
> +	},
> +	{
> +		.compatible = "xlnx,axi4-os62420_3pin-1.00.a",
> +	},
> +	{
> +		.compatible = "xlnx,axi4-os62420_6pin-1.00.a",
> +	},
> +	{},
> };

There are no documented DT bindings for this hardware block, nor any
upstream example users.  Given some compatible values do not follow
standard practises (no idea about the other parts), it's very likely
these de facto bindings, and all their out-of-tree users, will have to
be changed.

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
