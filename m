Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F1C2C9C
	for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 15:56:58 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id y4so24281076uad.1
        for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 07:56:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HKrDGNi+gg98U9bw/lL+NYbJMypwOOc8TZbuy5d3uxA=;
        b=nCaBhOS9ygumZhNHZd90Fl/3Qb6PGRrDW4ilp6OxGDK+vjdmCG8D4DWnWHxj9L0avZ
         HPCisXdG80PRH6UQYbXBYl2h/dWsPgVwXbOCTwb+A28ZNUb8Mr9+NcORRsjSExZgSqsO
         v/MhlC6YLZVJKj/P5yTNlBNyBqPr23dhA6m2W7P2uxZK4S03YfVHJHYXnZ0QGXUkSiAW
         Neh4/7wphFIOS/UJcNKDhEOmROYwzBMWi9qsTp8ZgeRsPh3i5jzVbgX9CKO0c4jx72HH
         /nz8WX2M4iiwdG1YrXV4J47azWLm+com4BF7XTSc3EBEi1ZiQ/0oRzeyqAWECQeGk9Sj
         J6pw==
X-Gm-Message-State: AOAM530k4/+GWHFj2r4Bhd8UWu/MMn9wsPzyoCgZKzsoknr1QO4G2nw/
	OLXorCDAZGUZDULGbg0YCKLHGrpPaZUHHg==
X-Google-Smtp-Source: ABdhPJxNZJLQkn7UMQJZSBkrdt+7l6IRx5wf1TDDtjoyOJhtXSiG204uuKYJWEmrADXG3RuWkV1IhQ==
X-Received: by 2002:a67:d297:: with SMTP id z23mr181588vsi.18.1641830217190;
        Mon, 10 Jan 2022 07:56:57 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id c25sm4250853vsk.32.2022.01.10.07.56.56
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 07:56:56 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id y4so24280962uad.1
        for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 07:56:56 -0800 (PST)
X-Received: by 2002:ab0:4d5a:: with SMTP id k26mr154723uag.122.1641830216111;
 Mon, 10 Jan 2022 07:56:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211226082530.2245198-4-nikita.yoush@cogentembedded.com> <20211226153349.2296024-1-nikita.yoush@cogentembedded.com>
In-Reply-To: <20211226153349.2296024-1-nikita.yoush@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Jan 2022 16:56:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUJfq+nFFMoiPiTt1=Ny9zOm-O1EAmq3n56n4RJ6H8tdA@mail.gmail.com>
Message-ID: <CAMuHMdUJfq+nFFMoiPiTt1=Ny9zOm-O1EAmq3n56n4RJ6H8tdA@mail.gmail.com>
Subject: Re: [PATCH 3/3 v2] arm64: dts: renesas: add MOST device
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Christian Gromm <christian.gromm@microchip.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Nikita,

On Sun, Dec 26, 2021 at 4:34 PM Nikita Yushchenko
<nikita.yoush@cogentembedded.com> wrote:
> This patch adds mlp device to dtsi files for R-Car Gen3 SoCs that have
> it.
>
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> ---
> Change from v1:
> - fix power domain ids so all dtbs build properly

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> @@ -2412,6 +2412,19 @@ ssi9: ssi-9 {
>                         };
>                 };
>
> +               mlp: mlp@ec520000 {
> +                       compatible = "renesas,rcar-gen3-mlp";

No SoC-specific compatible value?

> +                       reg = <0 0xec520000 0 0x800>;
> +                       interrupts = <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>;

What is the purpose of the various interrupts?
Perhaps you need interrupt-names?
The driver seems to use only the first two, which is strange, as
the second and third interrupt handle different channels.

> +                       clocks = <&cpg CPG_MOD 802>;
> +                       power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;

Missing resets property?

> +                       status = "disabled";
> +               };
> +

The rest looks sane to me.  But without any DT binding documentation
for this hardware block, this is hard to validate, and not yet ready for
upstream integration.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
