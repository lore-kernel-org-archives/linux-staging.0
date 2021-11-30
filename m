Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C90F2C99
	for <linux-staging@lists.linux.dev>; Tue, 30 Nov 2021 08:16:50 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id a14so39771105uak.0
        for <linux-staging@lists.linux.dev>; Tue, 30 Nov 2021 00:16:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3tvLL9kOtzMPDSDABpyDexTlx7DFRm6dXyi4fSUyw0k=;
        b=Dk2bWhu14+g7XhnJdr36GJBe3CMR53nZuiNL+gsQ33lCZ8YxbGW9gCr03nCU4ku6UH
         Gix8RUA2kxTYUhixrtAr56VvkTJTV9RVq3Y84YwceYDWia7ivgSsIXSqn4RUHmZkQVC8
         GtCOnXqMqCS6yhIAfnOK1imDgfWjpcMFpWhyQrH4z/nqpNgY5sj90Wyh8qxRQf6YT1Wv
         vFWZSsrXXjgBWmhxC2ViYbE9CRsdm/1zmWzoRGvRbYWgPv9uJkVrlOX8VjBqTVrL+70L
         O+f0XTzH631Xrb5l3aB3MwpqKNVYqR6SLvArI+p9+H0TL5LgSSse2tKIt+1Je5jFcXw0
         JIhw==
X-Gm-Message-State: AOAM533cVUwNPqWmgHvbfoFwJJJ2t3qGZcsKMtV+H2XTXfXBygfMblYi
	n9nJOul2uBEiogEqrVGuKu2DmeyMnAbtww==
X-Google-Smtp-Source: ABdhPJzoDDmu+vtzT9UgXc6TRHpP7QaJ+5lAzVEN2lnqdxutdD8ph9DIrId1eKBl5xwYG0YW/0YSLw==
X-Received: by 2002:a67:1ac1:: with SMTP id a184mr38244988vsa.22.1638260209809;
        Tue, 30 Nov 2021 00:16:49 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id q12sm9662375vkd.1.2021.11.30.00.16.49
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Nov 2021 00:16:49 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id p37so39671980uae.8
        for <linux-staging@lists.linux.dev>; Tue, 30 Nov 2021 00:16:49 -0800 (PST)
X-Received: by 2002:a05:6102:e10:: with SMTP id o16mr37823915vst.5.1638260209223;
 Tue, 30 Nov 2021 00:16:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aadbd32c-c0ab-4c8a-c590-3334f736f224@gmail.com>
In-Reply-To: <aadbd32c-c0ab-4c8a-c590-3334f736f224@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Nov 2021 09:16:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU_90XdFZM6kVA78XUX+7+Jm1WqjBmBN7irVOY3k-Gcfg@mail.gmail.com>
Message-ID: <CAMuHMdU_90XdFZM6kVA78XUX+7+Jm1WqjBmBN7irVOY3k-Gcfg@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: add spi_device_id table
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	DRI Development <dri-devel@lists.freedesktop.org>, 
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Heiner,

On Mon, Nov 29, 2021 at 10:12 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
> After 5fa6863ba692 ("spi: Check we have a spi_device_id for each DT
> compatible") we need the following to make the SPI core happy.
>
> Works for me with a SH1106-based OLED display.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Thanks for your patch!

> --- a/drivers/staging/fbtft/fbtft.h
> +++ b/drivers/staging/fbtft/fbtft.h
> @@ -307,12 +307,19 @@ static const struct of_device_id dt_ids[] = {                              \
>                                                                            \
>  MODULE_DEVICE_TABLE(of, dt_ids);                                           \
>                                                                            \
> +static const struct spi_device_id spi_ids[] = {                            \
> +       { .name = _compatible },                                           \

Shouldn't this be the part of _compatible after the "<vendor>," prefix?

> +       {},                                                                \
> +};                                                                         \
> +                                                                          \
> +MODULE_DEVICE_TABLE(spi, spi_ids);                                        \
>                                                                            \
>  static struct spi_driver fbtft_driver_spi_driver = {                       \
>         .driver = {                                                        \
>                 .name   = _name,                                           \
>                 .of_match_table = dt_ids,                                  \
>         },                                                                 \
> +       .id_table = spi_ids,                                               \
>         .probe  = fbtft_driver_probe_spi,                                  \
>         .remove = fbtft_driver_remove_spi,                                 \
>  };                                                                         \

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
