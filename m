Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6669772
	for <linux-staging@lists.linux.dev>; Wed, 13 Oct 2021 12:24:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AF6A60F23;
	Wed, 13 Oct 2021 12:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1634127892;
	bh=4s6wU6xVKQAR878cEXhPsqNrnWGlU/+dyX5KTUREZ18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S4umREiHN43ck0bJtS5IRQc0Hf0stWqeWleSpMWn3iSIeP/bdGO8xsT0+JWIxLs+N
	 z7t0n7C+46wOreMyY5MtU9w9c1d+JcnbAnT6YWDcQQr6BtwS4UJZEPBRKt6KlwFZfz
	 T++70qYJgZK6yVJod1zvCaGaTM2uPd56fvopHfeg=
Date: Wed, 13 Oct 2021 14:24:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Christian Gromm <christian.gromm@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
	linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 23/28] staging: most: dim2: use device tree
Message-ID: <YWbQEQBYTrfmzq4N@kroah.com>
References: <1525772716-15742-1-git-send-email-christian.gromm@microchip.com>
 <1525772716-15742-24-git-send-email-christian.gromm@microchip.com>
 <alpine.DEB.2.22.394.2110121749450.1045463@ramsan.of.borg>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2110121749450.1045463@ramsan.of.borg>

On Tue, Oct 12, 2021 at 08:14:14PM +0200, Geert Uytterhoeven wrote:
> 	Hi Christian, Greg,
> 
> CC devicetree, linux-renesas-soc
> 
> On Tue, 8 May 2018, Christian Gromm wrote:
> > This patch removes the dependency to platform specific source files
> > that do platform specific initialization and supply the IRQ number.
> > Instead DT code is added
> > 
> > Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
> 
> This patch bypassed review by the DT people, and ended up in v4.18 as
> commit 21e57ff086056c01 ("staging: most: dim2: use device tree").

Yeah, staging-only dt changes are not usually run by the dt maintainers.

> 
> > --- a/drivers/staging/most/dim2/dim2.c
> > +++ b/drivers/staging/most/dim2/dim2.c
> > +static const struct of_device_id dim2_of_match[] = {
> > +	{
> > +		.compatible = "fsl,imx6q-mlb150",
> > +		.data = plat_data + FSL_MX6
> > +	},
> > +	{
> > +		.compatible = "renesas,mlp",
> > +		.data = plat_data + RCAR_H2
> > +	},
> > +	{
> > +		.compatible = "rcar,medialb-dim2",
> > +		.data = plat_data + RCAR_M3
> > +	},
> > +	{
> > +		.compatible = "xlnx,axi4-os62420_3pin-1.00.a",
> > +	},
> > +	{
> > +		.compatible = "xlnx,axi4-os62420_6pin-1.00.a",
> > +	},
> > +	{},
> > };
> 
> There are no documented DT bindings for this hardware block, nor any
> upstream example users.  Given some compatible values do not follow
> standard practises (no idea about the other parts), it's very likely
> these de facto bindings, and all their out-of-tree users, will have to
> be changed.

Great, fix the bindings and anything in-kernel here please.  We don't
care about out-of-kernel stuff for drivers/staging/ at all.

thanks,

greg k-h
