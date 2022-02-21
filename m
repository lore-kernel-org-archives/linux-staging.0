Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1642D33C1
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 18:16:46 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id gb39so35424331ejc.1
        for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 10:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=PL945DvY9OK3LLJ2qww6rNoQ2Lb+Kd9OQXb6m49fWPo=;
        b=ZvZo5phpoMOcxyj55E+La4MqNbcdUsDwMLpcIj2Dr9k/HIwUbumX6k6upoKQ2iPif0
         mt88k0TdSEh5skV1R8CWqj+5BUoR0tni0em0/dxM0A70IlqGZ+jk3IVkRxfOLzmd9wXn
         /cN3ThnZR/g9huG0IH+MSEuKYLFVCuMeacgwHaPVYLIoD/c33ypFLPR6CmMcFLfcmaMK
         bpW7x/8mauj/qglA1DXy0QXSXTgZ/7xbZkD4EGxLjymkwPv/pOwICSORAiKFxPnUBuEp
         RqAb18jIfrOz1uJLjltcpzvqlryMBvg5iowPRiR/iF60P0ZXBfVMH0Jb7nYk0WRTm0xJ
         LB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=PL945DvY9OK3LLJ2qww6rNoQ2Lb+Kd9OQXb6m49fWPo=;
        b=wz/b1GVxIoU0CtBB4FO1mBWfX7eJmI307JaLTRRJ28DutENUgyWMxQQjvPM+0ZRijP
         HszzifWvbWoWNTyrTfVKUL7gEEMumUS/tek51sXYpPGyo/AkE9Uwh3KBIT85axofF+d0
         JtCsKxNQtLb8BQhXl9PXscfGQ93AxXGR8GS+649V03fXLxR/CYQUMp3VuU0qKXlIpwQ8
         uFXQYXIB8f2fRn9iNyPCpOveT6OmGl4b+5NKiUz0darC7wCQzheuzC1JAEntzyh6OB/B
         kE1tzyABLH2X3VUrpgbG1elBwDsky3NpTA/9aADDR55nnVAoGHoit4VaXjnUP9I5/EQ/
         IVMQ==
X-Gm-Message-State: AOAM530G0oGgalUOVGVC3IAwSy/Z3BZQp4h1kgb9BSeXDGAIQMpEmSeQ
	EJShoDQZsayCtdLnaMt+j7I=
X-Google-Smtp-Source: ABdhPJyQMk+rA8NhPx3ND9kOEJgGCF32zDlA3AItnnWWDQTGmSmRXBfWiG1mzt3Fku/0DJvJHraxSw==
X-Received: by 2002:a17:906:40c9:b0:6ba:6f72:dd3d with SMTP id a9-20020a17090640c900b006ba6f72dd3dmr16780816ejk.373.1645467404254;
        Mon, 21 Feb 2022 10:16:44 -0800 (PST)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id j18sm5408140ejc.166.2022.02.21.10.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 10:16:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Feb 2022 18:16:42 +0000
Message-Id: <CI1XIH3YREIS.3SVJ5KMDSXUR6@arch-thunder>
Cc: <kernel@pengutronix.de>, <linux-imx@nxp.com>,
 <linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 0/7] media: imx: Destage imx7-mipi-csis
From: "Rui Miguel Silva" <rmfrfs@gmail.com>
To: "Jacopo Mondi" <jacopo@jmondi.org>, <aford173@gmail.com>,
 <slongerbeam@gmail.com>, <p.zabel@pengutronix.de>, <shawnguo@kernel.org>,
 <s.hauer@pengutronix.de>, <festevam@gmail.com>, <mchehab@kernel.org>,
 <hverkuil-cisco@xs4all.nl>, <laurent.pinchart@ideasonboard.com>,
 <martin.kepplinger@puri.sm>, <xavier.roumegue@oss.nxp.com>,
 <alexander.stein@ew.tq-group.com>, <dorota.czaplejewicz@puri.sm>
References: <20220221174727.320320-1-jacopo@jmondi.org>
In-Reply-To: <20220221174727.320320-1-jacopo@jmondi.org>

Hey Jacopo,
On Mon Feb 21, 2022 at 5:47 PM WET, Jacopo Mondi wrote:

> Very few variations from the recent v3, just reflowed some text and dropp=
ed
> a plural name in 6/7 commit message.

Even though you lost all the cover letter and previous changes in this
v4, this looks good to me, and many thanks for de-staging of this
driver.

for the all series:
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
     Rui

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
>  ...-mipi-csi2.yaml =3D> nxp,imx-mipi-csi2.yaml} |  2 +-
>  MAINTAINERS                                   |  4 +-
>  drivers/media/platform/Kconfig                |  1 +
>  drivers/media/platform/Makefile               |  1 +
>  drivers/media/platform/imx/Kconfig            | 24 +++++++
>  drivers/media/platform/imx/Makefile           |  1 +
>  .../platform/imx/imx-mipi-csis.c}             | 67 +++++++++++++++++--
>  drivers/staging/media/imx/Makefile            |  1 -
>  drivers/staging/media/imx/TODO                | 25 +++++++
>  drivers/staging/media/imx/imx7-media-csi.c    | 32 +++++++--
>  11 files changed, 147 insertions(+), 13 deletions(-)
>  rename Documentation/devicetree/bindings/media/{nxp,imx7-mipi-csi2.yaml =
=3D> nxp,imx-mipi-csi2.yaml} (98%)
>  create mode 100644 drivers/media/platform/imx/Kconfig
>  create mode 100644 drivers/media/platform/imx/Makefile
>  rename drivers/{staging/media/imx/imx7-mipi-csis.c =3D> media/platform/i=
mx/imx-mipi-csis.c} (94%)
>
> --
> 2.35.0



