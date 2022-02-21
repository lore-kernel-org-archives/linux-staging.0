Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C118333C1
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 18:01:00 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 71E2C1BF209;
	Mon, 21 Feb 2022 18:00:48 +0000 (UTC)
Date: Mon, 21 Feb 2022 19:00:46 +0100
From: Jacopo Mondi <jacopo@jmondi.org>
To: aford173@gmail.com, slongerbeam@gmail.com, p.zabel@pengutronix.de,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	laurent.pinchart@ideasonboard.com, martin.kepplinger@puri.sm,
	rmfrfs@gmail.com, xavier.roumegue@oss.nxp.com,
	alexander.stein@ew.tq-group.com, dorota.czaplejewicz@puri.sm
Cc: kernel@pengutronix.de, linux-imx@nxp.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] media: imx: imx8mq-mipi-csi2: Remove YUV422 2X8
Message-ID: <20220221180046.xkawkdnhpuzuhxr2@uno.localdomain>
References: <20220221174903.320466-1-jacopo@jmondi.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220221174903.320466-1-jacopo@jmondi.org>

On Mon, Feb 21, 2022 at 06:49:03PM +0100, Jacopo Mondi wrote:
> The 2X8 variants of MEDIA_BUS_FMT_YUYV8_2X8 does not apply to serial
> busses.
>
> Drop it and while at it also add the canonical UYVY wire format for
> packed YUV422 when transmitted on the CSI-2 serial bus.
>
> Also beautify a little the formats declaration list by putting the
> opening curly brace after the comment.
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>
> v1->v2:
> - Fix subject (s/mp/mq) as reported by Adam
> - Add UYVY_1X16 as suggested by Laurent
>
>  drivers/staging/media/imx/imx8mq-mipi-csi2.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx8mq-mipi-csi2.c b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> index 56ef3b3b2906..7d03cb340ed4 100644
> --- a/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> +++ b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> @@ -200,14 +200,16 @@ static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
>  	}, {
>  		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
>  		.width = 14,
> -	}, {
> +	},
>  	/* YUV formats */
> -		.code = MEDIA_BUS_FMT_YUYV8_2X8,
> -		.width = 16,
> -	}, {
> +	{
>  		.code = MEDIA_BUS_FMT_YUYV8_1X16,
>  		.width = 16,
>  	}

Damn me rushing to get stuff out.
v3 on its way :(

> +	{
> +		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.width = 16,
> +	}
>  };
>
>  static const struct csi2_pix_format *find_csi2_format(u32 code)
> --
> 2.35.0
>
