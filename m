Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D54910F7
	for <linux-staging@lists.linux.dev>; Mon, 17 Oct 2022 08:35:03 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1BFE6CCF;
	Mon, 17 Oct 2022 10:29:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1665995361;
	bh=sVZCLSgX6k6MUk9kICNW2SQeppujn+8ITE9dOx6WEps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TQhfME+rXpgkfi5VecYtgR3HKbcRwya1/4W3jPJMEBnxuiGmSzEyzF2XdDd5Y+wqR
	 IGqbu1ShhI9VMJN/B9CpfUkn6ENgIDt+qpphx4KYNYu7HkDHvdukGGInjGgaMRe8hK
	 JGAWGgxTkYSfaF/PeWIXn3jh9cPWDq/13EuBbxJA=
Date: Mon, 17 Oct 2022 11:28:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
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
	linux-kernel@vger.kernel.org, kernel@puri.sm,
	phone-devel@vger.kernel.org
Subject: Re: [PATCHv3 1/1 RESEND] media: imx: Round line size to 4 bytes
Message-ID: <Y00SSRMFuL3Drjd4@pendragon.ideasonboard.com>
References: <20221016163928.1ef0a4fe.dorota.czaplejewicz@puri.sm>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221016163928.1ef0a4fe.dorota.czaplejewicz@puri.sm>

Hi Dorota,

Thank you for the patch.

On Sun, Oct 16, 2022 at 04:39:28PM +0200, Dorota Czaplejewicz wrote:
> Section 13.7.6.13 "CSI Image Parameter Register" of the
> i.MX 8M Quad Applications Processors Reference Manual
> states that the line size should be divisible by 8 bytes.
> However, the hardware also accepts sizes divisible by 4 bytes,
> which are needed to fully utilize the S5K3L6XX sensors.
> 
> This patch accepts line sizes divisible by 4 bytes.

The patch itself looks fine, but I always worry when we depart from the
documentation (sometimes that's a worry about documentation inaccuracies
:-)). In this particular case, we need to test the change on i.MX7 too,
as the alignment constraints could be platform-specific.

I would also very much appreciate feedback from NXP on this. There's a
risk of ill side-effects that I would prefer ruling out very clearly.

> Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
> ---
> Hello,
> 
> the Librem 5 is using an out-of-tree driver for s5k3l6xx, and rounding to 4 is optimal to operate it.
> 
> This revision improves the commit message.
> 
> Cheers,
> Dorota Czaplejewicz
> 
>  drivers/staging/media/imx/imx7-media-csi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index a0553c24cce4..af821b410c3f 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -999,10 +999,10 @@ static int imx7_csi_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
>  	}
>  
>  	/* Round up width for minimum burst size */
> -	width = round_up(mbus->width, 8);
> +	width = round_up(mbus->width, 4);
>  
>  	/* Round up stride for IDMAC line start address alignment */
> -	stride = round_up((width * cc->bpp) >> 3, 8);
> +	stride = round_up((width * cc->bpp) >> 3, 4);
>  
>  	pix->width = width;
>  	pix->height = mbus->height;

-- 
Regards,

Laurent Pinchart
