Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961702581
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 11:29:21 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
	by mail.gandi.net (Postfix) with ESMTPSA id DC409200003;
	Mon, 21 Feb 2022 11:29:16 +0000 (UTC)
Date: Mon, 21 Feb 2022 12:29:15 +0100
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: aford173@gmail.com, slongerbeam@gmail.com, p.zabel@pengutronix.de,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	martin.kepplinger@puri.sm, rmfrfs@gmail.com,
	xavier.roumegue@oss.nxp.com, alexander.stein@ew.tq-group.com,
	dorota.czaplejewicz@puri.sm, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: imx: imx8mp-mipi-csi2: Remove YUV422 2X8
Message-ID: <20220221112915.44zmds5mxolj2rkv@uno.localdomain>
References: <20220221111611.52905-1-jacopo@jmondi.org>
 <YhN29Tat/GMl+2eS@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YhN29Tat/GMl+2eS@pendragon.ideasonboard.com>

Hi Laurent

On Mon, Feb 21, 2022 at 01:26:45PM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Mon, Feb 21, 2022 at 12:16:11PM +0100, Jacopo Mondi wrote:
> > The 2X8 variants of MEDIA_BUS_FMT_YUYV8_2X8 does not apply to serial
>
> Maybe s/serial/CSI-2/
>
> > busses.
> >
> > Drop it and while at it beautify the formats declaration list a little
> > by putting the opening curly brace after the comment.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/staging/media/imx/imx8mq-mipi-csi2.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/staging/media/imx/imx8mq-mipi-csi2.c b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> > index 56ef3b3b2906..a3e33ce83c1f 100644
> > --- a/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> > +++ b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> > @@ -200,11 +200,9 @@ static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
> >  	}, {
> >  		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
> >  		.width = 14,
> > -	}, {
> > +	},
> >  	/* YUV formats */
> > -		.code = MEDIA_BUS_FMT_YUYV8_2X8,
> > -		.width = 16,
> > -	}, {
> > +	{
> >  		.code = MEDIA_BUS_FMT_YUYV8_1X16,
>
> While at it, should we also switch this to MEDIA_BUS_FMT_UYVY8_1X16,
> which is the canonical format for YUV422 8-bit on CSI-2 ?
>

Should I ?
I forgot why UYVY is preferred over YUYV.

Also this will break quite some scripts for many users :)
Should I rather add it instead ?

No problem for me in either cases

> >  		.width = 16,
> >  	}
>
> --
> Regards,
>
> Laurent Pinchart
