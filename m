Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D030173
	for <linux-staging@lists.linux.dev>; Wed, 12 Jan 2022 10:15:26 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id r15so3808673uao.3
        for <linux-staging@lists.linux.dev>; Wed, 12 Jan 2022 02:15:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6wKmSWMHWAmRWv4Hqzo9xUOdqr9ud8CTsl9Le52Qq2A=;
        b=0AziKzd4ZqzqxbGPcqZxZ1FdWkSR4axQRzLDpXF/LKUdpqmC8inZltwwCxZ1sf7AWn
         IBXinTESO3AmExtEbUnfJCB0mEKEInlwofl2si6eITRge4FgB7kb3Atq6kFeakL5E5KV
         jGKPtSG7ftsxjeKPxEzQQyjVAewzdzJUV/3HlVuLl5YhRmqD+8CnWHIRC5myW0N86nl+
         f7Hb3r5CCLz+YPTUoS0WQCoH/LjfCRdwOTkrW4iqRgEbqrVzFme19Y+bbB4k0Wtbozpw
         g/nwOBCiOT9eqquuidJ6uYHtMBhP4xZCVprBaoJCfWKlHOac0idYM4UpIsGbv/hmq6d3
         uH8g==
X-Gm-Message-State: AOAM532uzIMe98DGRvJE46IevV7Degm8H99FpA8T7S3lqqioWef6PhF2
	77AogE2bVm8OIJEMUSsvVLDS8kGOwsvjSNsb
X-Google-Smtp-Source: ABdhPJwqxeaV0Qe7AbtT608bnVy5MrvNwoul/SVpeZZkyDVDIrH700zEYCoGTq28QODLEUyhb7OHgw==
X-Received: by 2002:a67:ec82:: with SMTP id h2mr591757vsp.53.1641982525332;
        Wed, 12 Jan 2022 02:15:25 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id d3sm6393541vsl.4.2022.01.12.02.15.24
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 02:15:25 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id i5so3716419uaq.10
        for <linux-staging@lists.linux.dev>; Wed, 12 Jan 2022 02:15:24 -0800 (PST)
X-Received: by 2002:a67:c81c:: with SMTP id u28mr3649287vsk.38.1641982524577;
 Wed, 12 Jan 2022 02:15:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211226082530.2245198-4-nikita.yoush@cogentembedded.com>
 <20211226153349.2296024-1-nikita.yoush@cogentembedded.com>
 <CAMuHMdUJfq+nFFMoiPiTt1=Ny9zOm-O1EAmq3n56n4RJ6H8tdA@mail.gmail.com> <fccd00c9-ec44-9586-0df2-6e46568665c1@cogentembedded.com>
In-Reply-To: <fccd00c9-ec44-9586-0df2-6e46568665c1@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jan 2022 11:15:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWa+2q+Zx79YxRZECN-d52Zcs7rP-BNYBxWX5250aaxJw@mail.gmail.com>
Message-ID: <CAMuHMdWa+2q+Zx79YxRZECN-d52Zcs7rP-BNYBxWX5250aaxJw@mail.gmail.com>
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

On Wed, Jan 12, 2022 at 9:56 AM Nikita Yushchenko
<nikita.yoush@cogentembedded.com> wrote:
> >> +                       reg = <0 0xec520000 0 0x800>;
> >> +                       interrupts = <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
> >> +                               <GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
> >> +                               <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
> >> +                               <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
> >> +                               <GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>;
> >
> > What is the purpose of the various interrupts?
> > Perhaps you need interrupt-names?
> > The driver seems to use only the first two, which is strange, as
> > the second and third interrupt handle different channels.
>
> Maybe Christian Gromm (the original driver author) can comment here?
>
> As far as I understand:
> - interrupts are: mlb, ahb0, ahb1, ch0rx, ch1rx
> - of those, the first 3 are from dim2 itself, and the last two are from renesas-specific logic around dim2
> - in the interrupt assignment tables for gen3 SoCs, renesas documents all 5 interrupts, however in the
> mlb section, renesas mentions only mlb, ahb0 and ch0rx interrupts
> - moreover, renesas explicitly denies access dim2 registers responsible for channels 32..63 - which
> renders ahb1 interrupt useless; and renesas does not document any registers related to "async rx
> response" on channels 32..63 - which renders chrx1 interrupt useless
> - anyway, dim2 driver registers only 32 channels (for all use cases, not only for renesas), and thus
> uses only ahb0 interrupt
> - dim2 driver does not implement renesas-specific processing logic and thus does not use ch0rx interrupt
>
> I'm not sure how to proceed here.
> Is it better to define only two interrupts (mlb, ahb0) in device trees?
>
> Regarding 'interrupt-names' - dim2 driver currently uses platform_get_irq() and thus depends on numeric
> positions (mlb interrupt at index 0 and ahb0 interrupt at index 1). I'm not sure about current use cases
> of the driver other than with rcar-gen3, and if it is ok to use of_get_irq_byname() instead. And without
> using of_get_irq_byname(), interrupt-names looks somewhat useless.

As the driver is under staging, I think we can make any changes we want.

> > But without any DT binding documentation
> > for this hardware block, this is hard to validate, and not yet ready for
> > upstream integration.
>
> Christian, are you going to provide DT binding documentation for dim2?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
