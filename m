Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480152CA6
	for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 21:21:31 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id g14so337249edb.8
        for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 13:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y4P5wy6iix7HfpBAPgE+l0TDwUWAk0zjGM03BbiTQsw=;
        b=P8Z7C13ZdPu+qAQpnBOAeCbP5gMwD7ydNMb9fH1tHtsh2kJc7ibH4bhB9n6SSttNEt
         vEEmkYmz1t6Wm9/57Wpyql1gY0lukX/tq7xgtngawV31lXiyIPiGdLlXzIBBpOnQ/pNU
         l8TY+90t1LjC9Ts43pf+0L3t6Cq68GW0mMKuPmHBlsyYPUEBjqZHsJ8O0Uy21wTlkTut
         DkYw3nq5oS+YsuqCdF7sZUGi6ZaY6WUqsUowfAES53fFq8ONWXmRQXBRmsakgmTB4xiK
         lcxLsvwMVZyq/6SKHFurTYHOEqmmqbVonYppG/FJLvW5oRfRzsPSbaJYXXnR9qD6yz3J
         794g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y4P5wy6iix7HfpBAPgE+l0TDwUWAk0zjGM03BbiTQsw=;
        b=sxxPJk6u1e3e23+OPdmggusIWN1PyVOrF4BsNgsCW11YAIPXYpQpfPxVTjgBf3HWEh
         RJuJpD2RgJimhYvZD0f5KAvFS+6Ass9WnGxMH4EGfiy1EZ9phgX3QznfHNiZUcjU9Lrc
         dLWhXGV12t1CrVWA6o80CujxnwZfV2Wdwa81s6dh9knHl7Z842lVyX9Pwygm7nIkeY20
         CWiEeB8TvZYrGCS0LMXC1j4icexzv7ATmtwiiSf1wadWGF4sDn+SEpZxFZHLSBmWp2vZ
         Ssf6MJG5S7uoTxcz28UtlUlqUJioLNUhz3Mv4WeGml09VQc2OWU/EPdZNUfl6i62deuc
         1lnQ==
X-Gm-Message-State: AOAM533hpi2BzT//DMR2MLJLulouPYc0maVSftcMhldvgR6P0AOgswNZ
	T8SQO6IGn85xBePribnTKMgzS170wjYIZ/ZYg8Q=
X-Google-Smtp-Source: ABdhPJwsfak5UbIcc8yFH8Rwdwqg3PnBpr0/RxL71FTeqrqpj/OhkfEuzEX2FvqtqvCKNpPM2N8yXgEq/ke4MwvehrM=
X-Received: by 2002:a17:906:6dce:: with SMTP id j14mr9377078ejt.305.1639689689489;
 Thu, 16 Dec 2021 13:21:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211216111256.2362683-1-aford173@gmail.com> <20211216111256.2362683-9-aford173@gmail.com>
 <YbuqpayfYVPp1dTe@robh.at.kernel.org>
In-Reply-To: <YbuqpayfYVPp1dTe@robh.at.kernel.org>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 16 Dec 2021 15:21:18 -0600
Message-ID: <CAHCN7xLGeu4=CwqCv8BBowuQQ5t9iFDQV0adPNmy9dufW8soAg@mail.gmail.com>
Subject: Re: [PATCH V2 08/10] dt-bindings: media: nxp,imx8mq-vpu: Add support
 for G1 and G2 on imx8mm
To: Rob Herring <robh@kernel.org>
Cc: linux-media <linux-media@vger.kernel.org>, Abel Vesa <abel.vesa@nxp.com>, 
	Adam Ford-BE <aford@beaconembedded.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lucas Stach <l.stach@pengutronix.de>, 
	"open list:HANTRO VPU CODEC DRIVER" <linux-rockchip@lists.infradead.org>, 
	devicetree <devicetree@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 16, 2021 at 3:07 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Dec 16, 2021 at 05:12:53AM -0600, Adam Ford wrote:
> > The i.MX8M mini appears to have a similar G1 and G2 decoder but the
> > post-procesing isn't present, so different compatible flags are requred.
>
> post-processing
>
> > Since all the other parameters are the same with imx8mq, just add
> > the new compatible flags to nxp,imx8mq-vpu.yaml.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> > index c1e157251de7..b1f24c48c73b 100644
> > --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> > +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> > @@ -5,7 +5,7 @@
> >  $id: "http://devicetree.org/schemas/media/nxp,imx8mq-vpu.yaml#"
> >  $schema: "http://devicetree.org/meta-schemas/core.yaml#"
> >
> > -title: Hantro G1/G2 VPU codecs implemented on i.MX8MQ SoCs
> > +title: Hantro G1/G2 VPU codecs implemented on i.MX8MQ/i.MX8MM SoCs
>
> Just 'i.MX8' so we don't have to change this everytime?

Are you OK with i.MX8M?  8MQ, 8MM, and 8MP all appear to have G1 and
G2 decoders.  The i.MX8 is different.
>
> >
> >  maintainers:
> >    - Philipp Zabel <p.zabel@pengutronix.de>
> > @@ -20,6 +20,8 @@ properties:
> >          deprecated: true
> >        - const: nxp,imx8mq-vpu-g1
> >        - const: nxp,imx8mq-vpu-g2
> > +      - const: nxp,imx8mm-vpu-g1
> > +      - const: nxp,imx8mm-vpu-g2
>
> Not compatible with the imx8mq variants?

No, the structures associated with these compatible flags telling the
driver what features are available have options for the post-processor
in the 8MQ which are not present in the 8MM.

>
> >
> >    reg:
> >      maxItems: 1
> > @@ -66,3 +68,27 @@ examples:
> >                  clocks = <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
> >                  power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G2>;
> >          };
> > +  - |
> > +        #include <dt-bindings/clock/imx8mm-clock.h>
> > +        #include <dt-bindings/power/imx8mm-power.h>
> > +        #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +        vpu_g1: video-codec@38300000 {
> > +                compatible = "nxp,imx8mm-vpu-g1";
> > +                reg = <0x38300000 0x10000>;
> > +                interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> > +                clocks = <&clk IMX8MM_CLK_VPU_G1_ROOT>;
> > +                power-domains = <&vpu_blk_ctrl IMX8MM_VPUBLK_PD_G1>;
> > +        };
> > +  - |
> > +        #include <dt-bindings/clock/imx8mm-clock.h>
> > +        #include <dt-bindings/power/imx8mm-power.h>
> > +        #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +        vpu_g2: video-codec@38300000 {
> > +                compatible = "nxp,imx8mm-vpu-g2";
> > +                reg = <0x38310000 0x10000>;
> > +                interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> > +                clocks = <&clk IMX8MM_CLK_VPU_G2_ROOT>;
> > +                power-domains = <&vpu_blk_ctrl IMX8MM_VPUBLK_PD_G2>;
> > +        };
>
> No point in more examples just for a different compatible.

No problem.
>
> > --
> > 2.32.0
> >
> >
