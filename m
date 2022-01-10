Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F4E2C9C
	for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 15:58:36 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id y4so24290585uad.1
        for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 07:58:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YMgV+mDX/K3qcOomX1PVvdIm2AvlPzqwI7apstT0jDc=;
        b=wb21Q7HQnM3u0UQoNite5swlQJ6GkyDPyQws8qS8bokxXPXz9iNxrDnhzN0AnAPPVb
         YccJl+fm9s7qkhZSdLb2WsiaynIL+gVmD49eCV7EL4uwp7P09gov52cFSnyJy9fLFIvo
         ZkEldbpBhAv4SRbNBvo/Ggr3/72kmbEq4iNlOMjwhD3qgYZUHrIv8Vz5ZZCQAtmphxFV
         6wYr36Sut0d7dFeKAifdfAhp/phiE034Xxrys1rloHq0j6cpztL7x+VkWTBO62dBZrZq
         rY+c9aDm5dZVfPrPIOZ+S4IetKY8N0oKkvU80x8xOOz7KuPZrBnRKoxKWzBlOyZ6970F
         GdHg==
X-Gm-Message-State: AOAM5314/Gu8EI2ABFUhahZJ4nThzejkm3fPDYM52+lSQ1WfZTtKtq+a
	ZQn2YXf924Q6SNZGEbJsnfqyXnV35O90jg==
X-Google-Smtp-Source: ABdhPJz8snoEH27WVD7cgJv7o54jYJcvpI2FEDmignsxk43ZFn+3BfJK2/KRYaDO8XsJD6UOQ6OL6g==
X-Received: by 2002:a05:6102:3581:: with SMTP id h1mr55125vsu.17.1641830315239;
        Mon, 10 Jan 2022 07:58:35 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id k135sm3906813vke.53.2022.01.10.07.58.34
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 07:58:34 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id p1so24217679uap.9
        for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 07:58:34 -0800 (PST)
X-Received: by 2002:a67:e985:: with SMTP id b5mr182967vso.77.1641830314339;
 Mon, 10 Jan 2022 07:58:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211226082530.2245198-1-nikita.yoush@cogentembedded.com> <20211226082530.2245198-2-nikita.yoush@cogentembedded.com>
In-Reply-To: <20211226082530.2245198-2-nikita.yoush@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Jan 2022 16:58:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV+Yb1As-2fjq+1eeUEiTo21OH+aUQwEcSCAEErDh2A7w@mail.gmail.com>
Message-ID: <CAMuHMdV+Yb1As-2fjq+1eeUEiTo21OH+aUQwEcSCAEErDh2A7w@mail.gmail.com>
Subject: Re: [PATCH 1/3] staging: most: dim2: update renesas compatible string
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Christian Gromm <christian.gromm@microchip.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Nikita,

On Sun, Dec 26, 2021 at 9:25 AM Nikita Yushchenko
<nikita.yoush@cogentembedded.com> wrote:
> Use "renesas,rcar-gen3-mlp" instead of "rcar,medialb-dim2"
> - the documented vendor prefix for Renesas is "renesas,"
> - existing r-car devices use "rcar-genN-XXX" pattern.
>
> There are currently no in-tree users to update.
>
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>

Thanks for your patch!

> --- a/drivers/staging/most/dim2/dim2.c
> +++ b/drivers/staging/most/dim2/dim2.c
> @@ -1086,7 +1086,7 @@ static const struct of_device_id dim2_of_match[] = {
>                 .data = plat_data + RCAR_H2
>         },
>         {
> -               .compatible = "rcar,medialb-dim2",
> +               .compatible = "renesas,rcar-gen3-mlp",
>                 .data = plat_data + RCAR_M3
>         },

Looks sane, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

But there is no DT binding documentation covering this block :-(

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
