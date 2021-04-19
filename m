Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19842F84
	for <linux-staging@lists.linux.dev>; Mon, 19 Apr 2021 08:20:25 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id 66so17142966vsk.9
        for <linux-staging@lists.linux.dev>; Mon, 19 Apr 2021 01:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ltv54OOOgcKhPoH7oRaigoXMRi+Z2QqH7bQ4dTNkEvU=;
        b=kJOJR/ZxPkB5AQoF0Kk+s3/joJmw3QedoVjGwM1M4sEIHSc80m1x4RF8fy5eMiosjn
         raImPc78HHkuJnnAgQEIsgRwSP21QBqaQ2XK+dZGYKasmwx8Gc6r+fbwvhxTnzo8wOd7
         OrHT02oJQqSL6gUwfoB7lsvnKpJEqfLfQMvUEZpR3pmvH7kCssd8HPlBRBd6oEUWmn0q
         IH2SQp2pOZ6cXT2OAlkdVU9bDI5GC414KS09cpHWECuU+lQSBXDjKK5wdgvIkMWfJM1s
         QdUj4OzazRX+yd8IfBEl2wE0eOJrSQrTNaC7SydaUUXWoyovnnmDoCq9x/61Wh9woBst
         pkfw==
X-Gm-Message-State: AOAM533J2myvTl8zDJh7I1uK9tYXEmD77O7NuP65yaNFMDKWMi9/rm15
	7996muM6Vjq2EDtOCUYwbmTbNMKq8jczxruZkn8=
X-Google-Smtp-Source: ABdhPJw0QI7XOFx1TPnFrXWAlR/QW1v6zaWS/KnYbAtB/CEX2DsVVO2yNBv9r1VAA3kWmuOXuQwF2fQGH/J1go6B4oc=
X-Received: by 2002:a67:f503:: with SMTP id u3mr12373252vsn.3.1618820424835;
 Mon, 19 Apr 2021 01:20:24 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210419042722.27554-1-alice.guo@oss.nxp.com> <20210419042722.27554-2-alice.guo@oss.nxp.com>
In-Reply-To: <20210419042722.27554-2-alice.guo@oss.nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Apr 2021 10:20:13 +0200
Message-ID: <CAMuHMdUbrPxtJ9DCP0_nFrReuuO4vFY2J79LrKY82D7bCOfzRw@mail.gmail.com>
Subject: Re: [RFC v1 PATCH 1/3] drivers: soc: add support for soc_device_match
 returning -EPROBE_DEFER
To: "Alice Guo (OSS)" <alice.guo@oss.nxp.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, horia.geanta@nxp.com, 
	aymen.sghaier@nxp.com, herbert@gondor.apana.org.au, davem@davemloft.net, 
	tony@atomide.com, geert+renesas@glider.be, mturquette@baylibre.com, 
	sboyd@kernel.org, vkoul@kernel.org, peter.ujfalusi@gmail.com, 
	a.hajda@samsung.com, narmstrong@baylibre.com, robert.foss@linaro.org, 
	airlied@linux.ie, daniel@ffwll.ch, khilman@baylibre.com, tomba@kernel.org, 
	jyri.sarha@iki.fi, joro@8bytes.org, will@kernel.org, mchehab@kernel.org, 
	ulf.hansson@linaro.org, adrian.hunter@intel.com, kishon@ti.com, 
	kuba@kernel.org, linus.walleij@linaro.org, Roy.Pledge@nxp.com, 
	leoyang.li@nxp.com, ssantosh@kernel.org, matthias.bgg@gmail.com, 
	edubezval@gmail.com, j-keerthy@ti.com, balbi@kernel.org, 
	linux@prisktech.co.nz, stern@rowland.harvard.edu, wim@linux-watchdog.org, 
	linux@roeck-us.net, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux-foundation.org, linux-media@vger.kernel.org, 
	linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-staging@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

Hi Alice,

CC Arnd (soc_device_match() author)

On Mon, Apr 19, 2021 at 6:28 AM Alice Guo (OSS) <alice.guo@oss.nxp.com> wrote:
> From: Alice Guo <alice.guo@nxp.com>
>
> In i.MX8M boards, the registration of SoC device is later than caam
> driver which needs it. Caam driver needs soc_device_match to provide
> -EPROBE_DEFER when no SoC device is registered and no
> early_soc_dev_attr.

I'm wondering if this is really a good idea: soc_device_match() is a
last-resort low-level check, and IMHO should be made available early on,
so there is no need for -EPROBE_DEFER.

>
> Signed-off-by: Alice Guo <alice.guo@nxp.com>

Thanks for your patch!

> --- a/drivers/base/soc.c
> +++ b/drivers/base/soc.c
> @@ -110,6 +110,7 @@ static void soc_release(struct device *dev)
>  }
>
>  static struct soc_device_attribute *early_soc_dev_attr;
> +static bool soc_dev_attr_init_done = false;

Do you need this variable?

>
>  struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr)
>  {
> @@ -157,6 +158,7 @@ struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr
>                 return ERR_PTR(ret);
>         }
>
> +       soc_dev_attr_init_done = true;
>         return soc_dev;
>
>  out3:
> @@ -246,6 +248,9 @@ const struct soc_device_attribute *soc_device_match(
>         if (!matches)
>                 return NULL;
>
> +       if (!soc_dev_attr_init_done && !early_soc_dev_attr)

if (!soc_bus_type.p && !early_soc_dev_attr)

> +               return ERR_PTR(-EPROBE_DEFER);
> +
>         while (!ret) {
>                 if (!(matches->machine || matches->family ||
>                       matches->revision || matches->soc_id))

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
