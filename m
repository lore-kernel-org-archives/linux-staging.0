Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79AB7D
	for <linux-staging@lists.linux.dev>; Mon, 14 Feb 2022 10:28:54 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id c192so9340329wma.4
        for <linux-staging@lists.linux.dev>; Mon, 14 Feb 2022 02:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:content-transfer-encoding:date:message-id:subject:from
         :to:cc:references:in-reply-to;
        bh=D2GsCZSXYLyBzTyJQdHmKSBWP2WQVnRLA/DkH4BgHkQ=;
        b=pRszNiZClGEGZFPz1pk6/24PR9vgxvwJBvtXvtBhYKxZIW9zn8ioeNdkQ3SX6+Y85q
         EW1LU6PPGlQGHTfuJj5DNxpRfhJvSER1wmPhVAKbc1qN8juatVyZ5S2vd/Di9WISPDDr
         oiQAWBwCh0K4W3P1h/ertGEIYv2TEhD4bKQLKFsvUr17JIsZi0tgqleo41rVgbxXvJcK
         ALbM1aP4gt/Hwxx2U6ttmRn1Es3xZb+lPXBG3w3jydY0oDiE8cb1RQ2FpHddkRQVq8NJ
         l9GPmen2EvlmeqtaWLMZ+0S4pu1EQ4gzY7qvxz2HFbDaQRDHEZ3ZPvZgGNRlZHju12z3
         afAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:subject:from:to:cc:references:in-reply-to;
        bh=D2GsCZSXYLyBzTyJQdHmKSBWP2WQVnRLA/DkH4BgHkQ=;
        b=T6KxCB21f8fjnq/ne9XGVueOnDbJDNOyHnUjUf1o1jPFH1cnZbvYyxpLmVX39AGOC/
         9JsRDUn/xHH30RSyl0e6vqr/ZF5K/iTBzLlbIytJaPuS3p88Ac1o0he1wYTra9iviCfQ
         tYljjVgNUoYev+dT3ATsrJPbJQChjeB0JrG9orNFHAJyRnlR5uftaQyuB395AlKNCncu
         +qqGnpgByh20eYv/o8ptQ+ld/Kdi354p8HNX2hHwhCv8aQZsH0twyPajcp4uHnQjoHU+
         lKg6sSEo+V+Ifi9/8efnfFfi8cF8qlQ7oD13ECUvSeWM8J1ozKWpQsMfyQkA6y3Wyq8p
         cRww==
X-Gm-Message-State: AOAM530rtF/IFjiN+LXV3n5ASHflop3YWU3w/5qHRWhqV7evDm6xnWVf
	wo8YOno5CLWv96LTyvoD6Pc=
X-Google-Smtp-Source: ABdhPJx7qYUimsM7wq37Sr+0Dw1Xx7DQTnWQppErmyEqaqzXHb0aLvmBb45+LX5c8keLT1FPsManPA==
X-Received: by 2002:a05:600c:219a:: with SMTP id e26mr10359622wme.177.1644834533053;
        Mon, 14 Feb 2022 02:28:53 -0800 (PST)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id t1sm35072033wre.45.2022.02.14.02.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 02:28:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Feb 2022 10:28:51 +0000
Message-Id: <CHVP6G7WQIJT.WVPQU6O1Y4OX@arch-thunder>
Subject: Re: [PATCH 2/3] media: imx: Rename imx7-mipi-csis.c to
 imx-mipi-csis.c
From: "Rui Miguel Silva" <rmfrfs@gmail.com>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Jacopo Mondi"
 <jacopo@jmondi.org>
Cc: <slongerbeam@gmail.com>, <p.zabel@pengutronix.de>,
 <shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <festevam@gmail.com>,
 <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
 <martin.kepplinger@puri.sm>, <xavier.roumegue@oss.nxp.com>,
 <kernel@pengutronix.de>, <linux-imx@nxp.com>,
 <linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>
References: <20220211180216.290133-1-jacopo@jmondi.org>
 <20220211180216.290133-3-jacopo@jmondi.org>
 <YgbKLDwyV6pYj8Fu@pendragon.ideasonboard.com>
In-Reply-To: <YgbKLDwyV6pYj8Fu@pendragon.ideasonboard.com>

Hi Laurent,
On Fri Feb 11, 2022 at 8:42 PM WET, Laurent Pinchart wrote:

> Hi Jacopo,
>
> Thank you for the patch.
>
> On Fri, Feb 11, 2022 at 07:02:15PM +0100, Jacopo Mondi wrote:
> > Rename the imx7-mipi-csis.c driver to remove the reference to i.MX7.
> >=20
> > The driver is for an IP core found on i.MX7 and i.MX8 SoC so do not
> > specify a SoC version number in the driver name.
>
> I'm not against this, but I think we should then rename the symbols in
> the source code too. I don't mind keeping the current name if the rename
> causes too much churn.

I think Jacopo does that in the 3/3 patch in the source and I think he
cover all, since the main symbols namespace is mipi_csis and do not
include imx7 specifically.

Cheers,
   Rui

>
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  MAINTAINERS                                                     | 2 +-
> >  .../media/platform/imx/{imx7-mipi-csis.c =3D> imx-mipi-csis.c}    | 0
> >  2 files changed, 1 insertion(+), 1 deletion(-)
> >  rename drivers/media/platform/imx/{imx7-mipi-csis.c =3D> imx-mipi-csis=
.c} (100%)
> >=20
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
> > =20
> >  MEDIA DRIVERS FOR HELENE
> > diff --git a/drivers/media/platform/imx/imx7-mipi-csis.c b/drivers/medi=
a/platform/imx/imx-mipi-csis.c
> > similarity index 100%
> > rename from drivers/media/platform/imx/imx7-mipi-csis.c
> > rename to drivers/media/platform/imx/imx-mipi-csis.c
>
> --=20
> Regards,
>
> Laurent Pinchart



