Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BB45EA4
	for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 18:19:44 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id m17so24877966edc.13
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 10:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=benWcURYgGK+uAiYHNdB8VXxJ8t300zl1DIDLlznLsQ=;
        b=Ert31gFzb8VTlobnNs1vwF57jnx93vMlznupDkEG4c13sDwkjbkROJXgtzzDvrSloF
         Vy0Q8YKYfUlHGWdMc6F1O62EXfZiSKkKbkGItz5MUyiOnj9PP9JJGC4RL7cUtfud1ErA
         ZUWZUsGHYxdMQGikpuVeP2Xn6YUQwygLwDe9uujAGQM+Y2tubq18Z1jr/fxWP5jvCRCz
         jEa6nj+F/dMAIE+j3hMNyYySmOnvXihpYIrE0MOWfTlhDrvM3Uu6BRluGBQcjIHC+2sm
         M/ErUYXTOtfwdUOGcoH9dVNcV4TGkdP7IYeUwqEehl7Re8INQ4c5PEJuAFli28rOt5D8
         UUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=benWcURYgGK+uAiYHNdB8VXxJ8t300zl1DIDLlznLsQ=;
        b=sOnQgAgysRcY/b+496Q+LxTexN+S6vQUadLUKiS8wKBqkuWUUYltdVGb0m6rhJkH4v
         djsSf8yAtjSz1f6YJQpncaAKRoj8nnQ/3d0mK+WC549CGwD47uZdFMt1plWs8ghTrniC
         NgZnRuYZ94RAzoMtHDjl2sdFB20q1hKQT8COBpe0cx68SRjxtoRwbp2BX/f0Mfin16Zn
         GGo0viTBh56jKaHkfupHld3ng/TIWZj1gltrUpaooo1swDAJ60WE3WUas3TBIP+UKW1y
         +6ovehtRUM+aveVvRBLzLkFt7qKf3Q3iYaj259p4/2k/thfK/mnn2h97n47zxwXZVG+i
         qogg==
X-Gm-Message-State: AOAM533Aq5jQ8R04MFTwS9Qj9Jk9FDqdXoAdD+445blQR5HF4eB5kE4f
	Oh9y93Eu1JhpCcdWrUebakNXxM17mOfP2NofkWA=
X-Google-Smtp-Source: ABdhPJwiJkhS1p3i4WFuARwlpZWTIFoZp10y/I2/1aFGjDT2dQlpg4tPMK+6DGjm0IEFl2mlLHt8yzNy62zCuklNblw=
X-Received: by 2002:a05:6402:18:b0:410:86cd:9dce with SMTP id
 d24-20020a056402001800b0041086cd9dcemr17780927edu.70.1645381182179; Sun, 20
 Feb 2022 10:19:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220218183421.583874-1-jacopo@jmondi.org>
In-Reply-To: <20220218183421.583874-1-jacopo@jmondi.org>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 20 Feb 2022 12:19:30 -0600
Message-ID: <CAHCN7xKXoBB4AiJY=wEhZ-8YT=QW4CANe7bapGpjFGnWKm3xmQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] media: imx: Destage imx7-mipi-csis
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

On Sun, Feb 20, 2022 at 8:56 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hello
>   this series includes patches from two series previously sent:
> https://lore.kernel.org/linux-media/20220119112024.11339-1-jacopo@jmondi.org/
> https://lore.kernel.org/linux-media/20220211180216.290133-1-jacopo@jmondi.org/
> v1:
> https://lore.kernel.org/linux-media/20220214184318.409208-1-jacopo@jmondi.org/T/#t
>
> Which can now be marked as superseded.
>
> The first 2 patches performs the de-staging of the imx7-mipi-csis driver and
> are now reviewed.
>
> The rest of the series builds on top of the comment received on:
> https://lore.kernel.org/linux-media/20220119112024.11339-3-jacopo@jmondi.org/
>
> If DUAL pixel mode is used in the CSIS driver, then the CSI block of the IMX8MM
> SoC needs to be operated in dual mode as well. To do so, use the image format
> sample size to determine in the CSI bridge if dual or single mode should be
> used.
>
> Laurent could you test on MM to see if it works now ?

Jacopo,

Do you have a repo I can clone?  If not, I need to know which branch
to apply to the series. I have an 8MM with an OV5640, and I'm willing
to test if Laurent can't.

adam
>
> On top two small patches I was carrying in my tree to add more formats to the
> CSIS driver, the last one with the caveat that RGB24 is transmitted on the wire
> with one format and stored in memory with a different one.
>
> Series based on top of the most recent media master branch.
>
> Thanks
>   j
>
> v1->v2:
> - Remove per-SoC handling in CSI bridge and only use image formats
> - Add TODO note to the staging driver
> - Fix PIXEL_DUAL mode comments for imx-mipi-csis
> - Add output format translation to imx-mipi-csis to handle RGB24
>
> Jacopo Mondi (7):
>   media: imx: De-stage imx7-mipi-csis
>   media: imx: Rename imx7-mipi-csis.c to imx-mipi-csis.c
>   media: imx: imx7-media-csi: Use dual sampling for YUV 1X16
>   media: imx: imx-mipi-csis: Set PIXEL_MODE for YUV422
>   media: imx: imx-mipi-csis: Add RGB565_1X16
>   media: imx: imx-mipi-csis: Add BGR888
>   media: imx: imx-mipi-csis: Add output format
>
>  Documentation/admin-guide/media/imx7.rst      |  2 +-
>  ...-mipi-csi2.yaml => nxp,imx-mipi-csi2.yaml} |  2 +-
>  MAINTAINERS                                   |  4 +-
>  drivers/media/platform/Kconfig                |  1 +
>  drivers/media/platform/Makefile               |  1 +
>  drivers/media/platform/imx/Kconfig            | 24 ++++++++
>  drivers/media/platform/imx/Makefile           |  1 +
>  .../platform/imx/imx-mipi-csis.c}             | 59 +++++++++++++++++--
>  drivers/staging/media/imx/Makefile            |  1 -
>  drivers/staging/media/imx/TODO                | 26 ++++++++
>  drivers/staging/media/imx/imx7-media-csi.c    |  8 ++-
>  11 files changed, 117 insertions(+), 12 deletions(-)
>  rename Documentation/devicetree/bindings/media/{nxp,imx7-mipi-csi2.yaml => nxp,imx-mipi-csi2.yaml} (98%)
>  create mode 100644 drivers/media/platform/imx/Kconfig
>  create mode 100644 drivers/media/platform/imx/Makefile
>  rename drivers/{staging/media/imx/imx7-mipi-csis.c => media/platform/imx/imx-mipi-csis.c} (95%)
>
> --
> 2.35.0
>
