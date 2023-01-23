Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D86BA4F
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 09:41:57 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1pJt3f-0000OC-Dl; Mon, 23 Jan 2023 10:24:07 +0100
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1pJt3d-0000se-BA; Mon, 23 Jan 2023 10:24:05 +0100
Date: Mon, 23 Jan 2023 10:24:05 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Deepak R Varma <drv@mailo.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Praveen Kumar <kumarpraveen@linux.microsoft.com>,
	Saurabh Singh Sengar <ssengar@microsoft.com>
Subject: Re: [PATCH v2] staging: media: imx: change
 imx_media_fim_set_stream() to return void
Message-ID: <20230123092405.lwaosnsnlj7tvnmt@pengutronix.de>
References: <Y7RoDHnyHNnlPV71@qemulion>
 <Y82VVFFdUbww+BuS@ubun2204.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y82VVFFdUbww+BuS@ubun2204.myguest.virtualbox.org>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-staging@lists.linux.dev

Hi,

the patch lgtm.

On 23-01-23, Deepak R Varma wrote:
> On Tue, Jan 03, 2023 at 11:08:20PM +0530, Deepak R Varma wrote:
> > At present, the function imx_media_fim_set_stream() always returns 0.
> > So, convert it to be a function returning void instead. Issue identified
> > using the returnvar.cocci Coccinelle semantic patch.
> > 
> > Signed-off-by: Deepak R Varma <drv@mailo.com>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

> > ---
> > Changes in v2:
> >    1. Convert the function return type from int to void. Suggested by
> >       Fabio Estevam <festevam@gmail.com>
> >    2. Update patch subject and log accordingly.
> 
> Hello,
> May I request a review and feedback comment on this patch proposal please?
> 
> Thank you,
> ./drv
> 
> > 
> > 
> >  drivers/staging/media/imx/imx-media-csi.c | 7 ++-----
> >  drivers/staging/media/imx/imx-media-fim.c | 8 +++-----
> >  drivers/staging/media/imx/imx-media.h     | 6 +++---
> >  3 files changed, 8 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> > index 5c3cc7de209d..44d87fe30d52 100644
> > --- a/drivers/staging/media/imx/imx-media-csi.c
> > +++ b/drivers/staging/media/imx/imx-media-csi.c
> > @@ -779,11 +779,8 @@ static int csi_start(struct csi_priv *priv)
> >  		goto idmac_stop;
> > 
> >  	/* start the frame interval monitor */
> > -	if (priv->fim && priv->dest == IPU_CSI_DEST_IDMAC) {
> > -		ret = imx_media_fim_set_stream(priv->fim, output_fi, true);
> > -		if (ret)
> > -			goto idmac_stop;
> > -	}
> > +	if (priv->fim && priv->dest == IPU_CSI_DEST_IDMAC)
> > +		imx_media_fim_set_stream(priv->fim, output_fi, true);
> > 
> >  	ret = ipu_csi_enable(priv->csi);
> >  	if (ret) {
> > diff --git a/drivers/staging/media/imx/imx-media-fim.c b/drivers/staging/media/imx/imx-media-fim.c
> > index fb6590dcfc36..f456751f100a 100644
> > --- a/drivers/staging/media/imx/imx-media-fim.c
> > +++ b/drivers/staging/media/imx/imx-media-fim.c
> > @@ -368,12 +368,11 @@ void imx_media_fim_eof_monitor(struct imx_media_fim *fim, ktime_t timestamp)
> >  }
> > 
> >  /* Called by the subdev in its s_stream callback */
> > -int imx_media_fim_set_stream(struct imx_media_fim *fim,
> > -			     const struct v4l2_fract *fi,
> > -			     bool on)
> > +void imx_media_fim_set_stream(struct imx_media_fim *fim,
> > +			      const struct v4l2_fract *fi,
> > +			      bool on)
> >  {
> >  	unsigned long flags;
> > -	int ret = 0;
> > 
> >  	v4l2_ctrl_lock(fim->ctrl[FIM_CL_ENABLE]);
> > 
> > @@ -393,7 +392,6 @@ int imx_media_fim_set_stream(struct imx_media_fim *fim,
> >  	fim->stream_on = on;
> >  out:
> >  	v4l2_ctrl_unlock(fim->ctrl[FIM_CL_ENABLE]);
> > -	return ret;
> >  }
> > 
> >  int imx_media_fim_add_controls(struct imx_media_fim *fim)
> > diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
> > index f679249d82e4..6f9a46573edd 100644
> > --- a/drivers/staging/media/imx/imx-media.h
> > +++ b/drivers/staging/media/imx/imx-media.h
> > @@ -246,9 +246,9 @@ int imx_media_dev_notifier_register(struct imx_media_dev *imxmd,
> >  /* imx-media-fim.c */
> >  struct imx_media_fim;
> >  void imx_media_fim_eof_monitor(struct imx_media_fim *fim, ktime_t timestamp);
> > -int imx_media_fim_set_stream(struct imx_media_fim *fim,
> > -			     const struct v4l2_fract *frame_interval,
> > -			     bool on);
> > +void imx_media_fim_set_stream(struct imx_media_fim *fim,
> > +			      const struct v4l2_fract *frame_interval,
> > +			      bool on);
> >  int imx_media_fim_add_controls(struct imx_media_fim *fim);
> >  struct imx_media_fim *imx_media_fim_init(struct v4l2_subdev *sd);
> >  void imx_media_fim_free(struct imx_media_fim *fim);
> > --
> > 2.34.1
> > 
> 
> 
> 
> 
