Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2034D33D8
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 21:51:12 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1pK4ia-0004ba-5k; Mon, 23 Jan 2023 22:51:08 +0100
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1pK4iX-00063k-F7; Mon, 23 Jan 2023 22:51:05 +0100
Date: Mon, 23 Jan 2023 22:51:05 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Brent Pappas <bpappas@pappasbrent.com>
Cc: slongerbeam@gmail.com, festevam@gmail.com, p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org, s.hauer@pengutronix.de,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-imx@nxp.com, kernel@pengutronix.de, mchehab@kernel.org,
	shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: imx: imx-media-fim: Replace macro icap_enabled()
 with function
Message-ID: <20230123215105.fbfzxueegtnbu4ym@pengutronix.de>
References: <20230123191714.22430-1-bpappas@pappasbrent.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123191714.22430-1-bpappas@pappasbrent.com>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-staging@lists.linux.dev

Hi,

thank you for the patch.

On 23-01-23, Brent Pappas wrote:
> Replace the macro icap_enabled() with a static function to comply
> with Linux coding style standards.
> 
> Signed-off-by: Brent Pappas <bpappas@pappasbrent.com>
> ---
>  drivers/staging/media/imx/imx-media-fim.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-fim.c b/drivers/staging/media/imx/imx-media-fim.c
> index fb6590dcfc36..ccb35d098a19 100644
> --- a/drivers/staging/media/imx/imx-media-fim.c
> +++ b/drivers/staging/media/imx/imx-media-fim.c
> @@ -68,7 +68,10 @@ struct imx_media_fim {
>  	bool              stream_on;
>  };
>  
> -#define icap_enabled(fim) ((fim)->icap_flags != IRQ_TYPE_NONE)
> +static bool icap_enabled(struct imx_media_fim *fim)
> +{
> +	return fim->icap_flags != IRQ_TYPE_NONE;
> +}

Nit: I would make it inline but recent compiler may do the job for us.

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

Regards,
  Marco

>  static void update_fim_nominal(struct imx_media_fim *fim,
>  			       const struct v4l2_fract *fi)
> -- 
> 2.34.1
> 
> 
> 
