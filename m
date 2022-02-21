Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFCD29A3
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 13:38:31 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id bq11so8129905edb.2
        for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 05:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AE4XeU44vSd/sL9aIQeJuEB4bjJequuMaol59LSY2i8=;
        b=omx75ZG52xD7qa4+gn02NpqXOKFppuraxVJR3CYtZFjTMg8pnPuku0CsU5QRaobe+/
         aWkVVSRSC9cbMM1j5MXp21tNHzXnzYhjay8Oqtxb2jNaBH8KP2VzprVGevbWEeny/CBF
         y1p4xqsTNQ9SLNnQyEfI5VmsVeIkJpAGuz85QtfnKiqc5onfW09FaftiOPRPKaqVUhUA
         pfhEYb0mRKxL7w2WCPUcH1eQttfbMX9JtG18SLNxup6YyPvxDKkVagiZiaQb3bMARQHj
         Lk3SgjPmnhVfBWJMG5wDYcNWhQx2eMbYudZFXC/BZCfItyFu8inA/GWKKSifY8LcUSd4
         9tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AE4XeU44vSd/sL9aIQeJuEB4bjJequuMaol59LSY2i8=;
        b=DhLXAqAZByLWHzMeX2fW5gP7euBB7RoanJ/kAhnPUitQt16n+ZmnA5rzA5VOGbYUB6
         o2ZSuHgVuNCNFVCvNQ99LyoidoEOIOiitHOtcTefxKNPbPeeKkE556Zv0gxBOJETwnpd
         vSva3LAoHrva3fd0Cykt0IqVwHaCcXRBRncauTHaCVpKvcRNgrY0t6UiP8f2xh3x/Ynd
         R9Bz9OV73tWEt9oSS9/gVCm0Hfn1zTiTm72HbkkFYA3tjkiin8ZOSaSUo1uinsnkz23+
         3JqBJlX7GBj9LmsXSIP98czU0/27qE+GJGRGj9CUieS5eVje92pX+FE5g1Qh+r6+j9Cy
         r/Jw==
X-Gm-Message-State: AOAM530EV8q/aekuwFGHpxWd/0zV9ViLDIQmGogvSS0bYnqKFutjrlzu
	D2nBolyIusGLEjjzT8ey4rNeFMWHem7niXr1CfI=
X-Google-Smtp-Source: ABdhPJwlLJBBrqnX5dqmFG7mqUg5FOgbJgj2Hc5s8ttunkrBfSsomSPWj8ldQBb8h4VaXxRmcVCrmpJxYsOHCDcu4Ho=
X-Received: by 2002:a50:aa9d:0:b0:40f:d653:ff0f with SMTP id
 q29-20020a50aa9d000000b0040fd653ff0fmr21633157edc.114.1645450709889; Mon, 21
 Feb 2022 05:38:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220221111611.52905-1-jacopo@jmondi.org>
In-Reply-To: <20220221111611.52905-1-jacopo@jmondi.org>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 21 Feb 2022 07:38:18 -0600
Message-ID: <CAHCN7xKgsuMMHcL0BQDDMojoghLb+T88ptV7KTmjOBRpK=z51w@mail.gmail.com>
Subject: Re: [PATCH] media: imx: imx8mp-mipi-csi2: Remove YUV422 2X8
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Steve Longerbeam <slongerbeam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, martin.kepplinger@puri.sm, 
	rmfrfs@gmail.com, xavier.roumegue@oss.nxp.com, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, dorota.czaplejewicz@puri.sm, 
	Sascha Hauer <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, 
	linux-media <linux-media@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 21, 2022 at 5:17 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> The 2X8 variants of MEDIA_BUS_FMT_YUYV8_2X8 does not apply to serial
> busses.
>
> Drop it and while at it beautify the formats declaration list a little
> by putting the opening curly brace after the comment.
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/staging/media/imx/imx8mq-mipi-csi2.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx8mq-mipi-csi2.c b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> index 56ef3b3b2906..a3e33ce83c1f 100644
> --- a/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> +++ b/drivers/staging/media/imx/imx8mq-mipi-csi2.c

The subject says imx8mp but the file modified is imx8mq.  I assume the
subject is a typo.

To my knowledge, the 8mp uses the same csis as the 8mm.

adam
> @@ -200,11 +200,9 @@ static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
>         }, {
>                 .code = MEDIA_BUS_FMT_SRGGB14_1X14,
>                 .width = 14,
> -       }, {
> +       },
>         /* YUV formats */
> -               .code = MEDIA_BUS_FMT_YUYV8_2X8,
> -               .width = 16,
> -       }, {
> +       {
>                 .code = MEDIA_BUS_FMT_YUYV8_1X16,
>                 .width = 16,
>         }
> --
> 2.35.0
>
