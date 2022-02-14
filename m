Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FBF7D
	for <linux-staging@lists.linux.dev>; Mon, 14 Feb 2022 10:21:00 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id fy20so36185850ejc.0
        for <linux-staging@lists.linux.dev>; Mon, 14 Feb 2022 02:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=3acC942XOkSMbMJ+3TBUiXHSvzV2i5tsHNRcDSPAh74=;
        b=HiDzzFzDboiPPjHWFFslX/Ug7hj3iXoU3sa846oVoeHBryTRX8IywRo67+QMdKB1z4
         ZH4kTbK83O3cwUEcfOfhaCTyhymPNLeSpYUVumdcZ23GFWn9eOGevULbQvdEMPOgSPlh
         YIrXwsRL/Behvu69lFzsLZP0ONE8W3GnxtnNLXy73I6wfoque8o+cpHo49rJT4a/ShjX
         FM9IpEetlzQpzjA21Qbke/dcFImPQJSrYznZAOVMl5S6aZDpr+Q0xQ9SRC6J7XcJqh7J
         KdsjMzF43WicGJrNPgxfHjIUjIsjj7WJpeXb6n/NEl+IUP/bdffjNn0liQrxIZpD+q5I
         swYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=3acC942XOkSMbMJ+3TBUiXHSvzV2i5tsHNRcDSPAh74=;
        b=iIN3WPiWeEHLyUAYbomXo3269wA8l/dCw8XsuQEMZQevHOWl7tbCx0fPoDecLzqe1y
         pLP1rar5xvFmGlovLmhv52e/u0tq41+YJnxAMeuoVRI/fEglkP4zf7y4hnymZC4i6/t4
         SqmeM3DLcGa1DKzP96o8nr1Tm/fyVm2N5bFboGWptS/T8UFO82majWosOpTPH9Oa7p9C
         Qw13xdO4zz8y+UrJlr725u78nnU8X9INUbmPKBLs440uMpYAvX5UhYIHfsCGEefSiVgK
         Hc5a9EU8ePhTK7Gj9Zrn8sZm/OdmYshZwWePvyYl+ubBv8u9RTXKK4Ugy79UZkpnB3U9
         fPww==
X-Gm-Message-State: AOAM530Xiw4jM81YcjfhS3e+VdM11SFGl2TO0axqdihPNR3/w1RLtiCV
	RlQQon8nSCfGC5vuJ2poeYQ=
X-Google-Smtp-Source: ABdhPJwvBnVyU5QPkbEJVYpg7/PgRa1gL06w4Xg9ZZIxt03PD9/YJgSW4GQoC/KmmRxXVHLO+Jh6JA==
X-Received: by 2002:a17:906:7497:: with SMTP id e23mr4685706ejl.403.1644834059047;
        Mon, 14 Feb 2022 02:20:59 -0800 (PST)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id d4sm7758736eje.21.2022.02.14.02.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 02:20:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Feb 2022 10:20:57 +0000
Message-Id: <CHVP0EFTUAMC.2NPFPZMC5ACNW@arch-thunder>
Cc: <kernel@pengutronix.de>, <linux-imx@nxp.com>,
 <linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/3] media: imx: Rename imx7-mipi-csis.c to
 imx-mipi-csis.c
From: "Rui Miguel Silva" <rmfrfs@gmail.com>
To: "Jacopo Mondi" <jacopo@jmondi.org>, <slongerbeam@gmail.com>,
 <p.zabel@pengutronix.de>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
 <festevam@gmail.com>, <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
 <laurent.pinchart@ideasonboard.com>, <martin.kepplinger@puri.sm>,
 <xavier.roumegue@oss.nxp.com>
References: <20220211180216.290133-1-jacopo@jmondi.org>
 <20220211180216.290133-3-jacopo@jmondi.org>
In-Reply-To: <20220211180216.290133-3-jacopo@jmondi.org>

Hey Jacopo,
I think you by now saw the kernel test report.

You miss the rename in the makefile also.

------
Cheers,
     Rui
On Fri Feb 11, 2022 at 6:02 PM WET, Jacopo Mondi wrote:

> Rename the imx7-mipi-csis.c driver to remove the reference to i.MX7.
>
> The driver is for an IP core found on i.MX7 and i.MX8 SoC so do not
> specify a SoC version number in the driver name.
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  MAINTAINERS                                                     | 2 +-
>  .../media/platform/imx/{imx7-mipi-csis.c =3D> imx-mipi-csis.c}    | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename drivers/media/platform/imx/{imx7-mipi-csis.c =3D> imx-mipi-csis.c=
} (100%)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5bdb8c881b0b..7def3b7d56bc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11891,7 +11891,7 @@ T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/admin-guide/media/imx7.rst
>  F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
>  F:	Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> -F:	drivers/media/platform/imx/imx7-mipi-csis.c
> +F:	drivers/media/platform/imx/imx-mipi-csis.c
>  F:	drivers/staging/media/imx/imx7-media-csi.c
> =20
>  MEDIA DRIVERS FOR HELENE
> diff --git a/drivers/media/platform/imx/imx7-mipi-csis.c b/drivers/media/=
platform/imx/imx-mipi-csis.c
> similarity index 100%
> rename from drivers/media/platform/imx/imx7-mipi-csis.c
> rename to drivers/media/platform/imx/imx-mipi-csis.c
> --=20
> 2.35.0



