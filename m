Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65327C
	for <linux-staging@lists.linux.dev>; Mon, 14 Feb 2022 11:19:03 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 37349E0002;
	Mon, 14 Feb 2022 11:18:51 +0000 (UTC)
Date: Mon, 14 Feb 2022 12:20:00 +0100
From: Jacopo Mondi <jacopo@jmondi.org>
To: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, shawnguo@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
	martin.kepplinger@puri.sm, xavier.roumegue@oss.nxp.com,
	kernel@pengutronix.de, linux-imx@nxp.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] media: imx: Rename imx7-mipi-csis.c to
 imx-mipi-csis.c
Message-ID: <20220214112000.y7npvxtxoot26753@uno.localdomain>
References: <20220211180216.290133-1-jacopo@jmondi.org>
 <20220211180216.290133-3-jacopo@jmondi.org>
 <CHVP0EFTUAMC.2NPFPZMC5ACNW@arch-thunder>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CHVP0EFTUAMC.2NPFPZMC5ACNW@arch-thunder>

Hi Rui,

On Mon, Feb 14, 2022 at 10:20:57AM +0000, Rui Miguel Silva wrote:
> Hey Jacopo,
> I think you by now saw the kernel test report.
>
> You miss the rename in the makefile also.

Yes, that's pretty stupid sorry, I forgot to add the Makefile :(

I'll fix in v2

Laurent, do you want to squash 2/3 and 3/3 to have the symbols and the
file rename in the same patch ?

Thanks
  j

>
> ------
> Cheers,
>      Rui
> On Fri Feb 11, 2022 at 6:02 PM WET, Jacopo Mondi wrote:
>
> > Rename the imx7-mipi-csis.c driver to remove the reference to i.MX7.
> >
> > The driver is for an IP core found on i.MX7 and i.MX8 SoC so do not
> > specify a SoC version number in the driver name.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  MAINTAINERS                                                     | 2 +-
> >  .../media/platform/imx/{imx7-mipi-csis.c => imx-mipi-csis.c}    | 0
> >  2 files changed, 1 insertion(+), 1 deletion(-)
> >  rename drivers/media/platform/imx/{imx7-mipi-csis.c => imx-mipi-csis.c} (100%)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5bdb8c881b0b..7def3b7d56bc 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11891,7 +11891,7 @@ T:	git git://linuxtv.org/media_tree.git
> >  F:	Documentation/admin-guide/media/imx7.rst
> >  F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> >  F:	Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> > -F:	drivers/media/platform/imx/imx7-mipi-csis.c
> > +F:	drivers/media/platform/imx/imx-mipi-csis.c
> >  F:	drivers/staging/media/imx/imx7-media-csi.c
> >
> >  MEDIA DRIVERS FOR HELENE
> > diff --git a/drivers/media/platform/imx/imx7-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
> > similarity index 100%
> > rename from drivers/media/platform/imx/imx7-mipi-csis.c
> > rename to drivers/media/platform/imx/imx-mipi-csis.c
> > --
> > 2.35.0
>
>
>
