Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7814A3FC3;
	Sat, 11 Sep 2021 02:54:10 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id i25so4060782lfg.6;
        Fri, 10 Sep 2021 19:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=HrzUj2kOKfp3nelOA5Rh3JYBH3kW210KP3kKzozo3hQ=;
        b=E/9MuYttcjVnEKVBZ2RRAdeR5sb0jdTfQCYb1fxvZuMnXDOqBUk3nYtw01GbB/X6GT
         KggcfGmwCKui4q1Y6I/Zoewi6bpefiFqH9GtByYCph/JAmob901pvdpWdS0oAAjuQAQY
         mIt53RhE8vVOg5KcsGsboDvrHMmJmD71OmAobqcM89jEkxFuKdeCm6HPYYXtYIFrqhrJ
         dFK/DpqxoNzWKevcTP+KgCwCNJKfFsg9FltQhqCa+RNL9HgiSU8wylxtIU6LHwvS1Htg
         e86/hx94l8K+EqGTl66TFPACjucVhgvtD34TV9/63Bv/ZONfn/DmbCo1ZnS6JjWDSxs9
         P05g==
X-Gm-Message-State: AOAM533yEn+C+DAp/5ZMEX99mTWKhqRvTlaLE9OK29/vhlkUXeQDeVhX
	RS3buhnQLgCIBnn5dRQM20Op7va0bIXPmg==
X-Google-Smtp-Source: ABdhPJyOJ4xJsmMtxdv73wBm/9goZ6Pj3WvEN7C4D7S7zxhxfccPg10OOwjh7PI4ANd7Nt67+Z8qaQ==
X-Received: by 2002:ac2:4f02:: with SMTP id k2mr566460lfr.58.1631328848101;
        Fri, 10 Sep 2021 19:54:08 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id p3sm55225lfk.152.2021.09.10.19.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Sep 2021 19:54:07 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id i25so4060643lfg.6;
        Fri, 10 Sep 2021 19:54:07 -0700 (PDT)
X-Received: by 2002:ac2:482d:: with SMTP id 13mr583877lft.120.1631328846840;
 Fri, 10 Sep 2021 19:54:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210910184147.336618-1-paul.kocialkowski@bootlin.com> <20210910184147.336618-14-paul.kocialkowski@bootlin.com>
In-Reply-To: <20210910184147.336618-14-paul.kocialkowski@bootlin.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 11 Sep 2021 10:53:55 +0800
X-Gmail-Original-Message-ID: <CAGb2v66OHJREEg1Djkk=VyY0yUr5JE8Fp+xsb40wCk6E56bH8A@mail.gmail.com>
Message-ID: <CAGb2v66OHJREEg1Djkk=VyY0yUr5JE8Fp+xsb40wCk6E56bH8A@mail.gmail.com>
Subject: Re: [PATCH NOT FOR MERGE 13/22] ARM: dts: sun8i: a83t: Add MIPI CSI-2
 controller node
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>, linux-phy@lists.infradead.org, 
	linux-clk <linux-clk@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hans.verkuil@cisco.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Helen Koike <helen.koike@collabora.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Sat, Sep 11, 2021 at 2:42 AM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:
>
> MIPI CSI-2 is supported on the A83T with a dedicated controller that
> covers both the protocol and D-PHY. It can be connected to the CSI
> interface as a V4L2 subdev through the fwnode graph.
>
> This is not done by default since connecting the bridge without a
> subdev attached to it will cause a failure on the CSI driver.
>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

I believe you tagged the wrong patch to not be merged? AFAICT it
should be the next patch that hooks up OV8865, not this one.

> ---
>  arch/arm/boot/dts/sun8i-a83t.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
> index ac97eac91349..1fa51f7ef063 100644
> --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> @@ -1064,6 +1064,32 @@ csi: camera@1cb0000 {
>                         status = "disabled";
>                 };
>
> +               mipi_csi2: csi@1cb1000 {
> +                       compatible = "allwinner,sun8i-a83t-mipi-csi2";
> +                       reg = <0x01cb1000 0x1000>;
> +                       interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&ccu CLK_BUS_CSI>,
> +                                <&ccu CLK_CSI_SCLK>,
> +                                <&ccu CLK_MIPI_CSI>,
> +                                <&ccu CLK_CSI_MISC>;
> +                       clock-names = "bus", "mod", "mipi", "misc";
> +                       resets = <&ccu RST_BUS_CSI>;
> +                       status = "disabled";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               mipi_csi2_in: port@0 {
> +                                       reg = <0>;
> +                               };
> +
> +                               mipi_csi2_out: port@1 {
> +                                       reg = <1>;
> +                               };
> +                       };
> +               };
> +
>                 hdmi: hdmi@1ee0000 {
>                         compatible = "allwinner,sun8i-a83t-dw-hdmi";
>                         reg = <0x01ee0000 0x10000>;
> --
> 2.32.0
>
>
