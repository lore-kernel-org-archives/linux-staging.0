Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0754B7A
	for <linux-staging@lists.linux.dev>; Wed, 15 Jun 2022 14:26:40 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id d128so8834447qkg.8
        for <linux-staging@lists.linux.dev>; Wed, 15 Jun 2022 07:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z+v4uJresp4bk2kGcz6lgky6S6tyTgmS2aLhIJim1Ts=;
        b=nGOZxxF98+QMA2XUMyubp0ENjyJTh6qz9YOSZR4QoOZct6phhpp6wT9n3RWO/PaScc
         nm62ZEvvnmI8VW8qVzecBPDLI5ouWLz3DA8GkzApUilIkw/dWvbaP/Fu7BteTQSX+H7n
         tPLORG+75rzJMM+n+Y7rs6I8FfYaRzSKaqhWU7LMFKA4gwXlrGMDPc8NvtLLXbDaUAxz
         g4UQq1vbU1GR/g84Vs5VCkZoW5dZLDedTQbUMgdgVmKWzO1UqNkBrcr04JjAXf7Kj1eL
         z58Oelg98cSnfrUeTvmOzM5BgwL6nZaF00vSQfaZsz3bJIPzMF7W7GD3DzEb44MAaNbu
         F5gQ==
X-Gm-Message-State: AOAM533NZyniyZPZhR+aKaJbIg3Nh427nZuGDOeijZc/71luc1guy1nQ
	o8ZO4OFkVQlWJMRHaMayEQO7ho+fWBvQAA==
X-Google-Smtp-Source: ABdhPJx2o3Isl+Gd+XndBi1i2kokMw01glxIiUNEeI4MwkO39Y0YUaI1P1/4ZHul6DeF50rFUwNW3Q==
X-Received: by 2002:a37:6cc1:0:b0:6a6:a788:bdff with SMTP id h184-20020a376cc1000000b006a6a788bdffmr8333023qkc.131.1655303199732;
        Wed, 15 Jun 2022 07:26:39 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id z18-20020ac87cb2000000b0030515374a6asm9166783qtv.51.2022.06.15.07.26.38
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 07:26:38 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-30c143c41e5so63087247b3.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Jun 2022 07:26:38 -0700 (PDT)
X-Received: by 2002:a81:6c46:0:b0:315:bb1:6a21 with SMTP id
 h67-20020a816c46000000b003150bb16a21mr7276529ywc.283.1655303198318; Wed, 15
 Jun 2022 07:26:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220615142144.3968617-1-windhl@126.com>
In-Reply-To: <20220615142144.3968617-1-windhl@126.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jun 2022 16:26:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4O2d6BFnsW58r_uQezRnpQ9EERFyVt2RC6mbfxZEHSg@mail.gmail.com>
Message-ID: <CAMuHMdX4O2d6BFnsW58r_uQezRnpQ9EERFyVt2RC6mbfxZEHSg@mail.gmail.com>
Subject: Re: [PATCH] drivers: staging: board: Add missing of_node_put() in board.c
To: Liang He <windhl@126.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Liang,

On Wed, Jun 15, 2022 at 4:21 PM Liang He <windhl@126.com> wrote:
> In board_staging_gic_setup_xlate(), of_find_compatible_node() return
> a node pointer with refcount incremented. We should use of_node_put()
> when it is not used anymore.
>
> Signed-off-by: Liang He <windhl@126.com>

Thanks for your patch!

> --- a/drivers/staging/board/board.c
> +++ b/drivers/staging/board/board.c
> @@ -67,6 +67,8 @@ int __init board_staging_gic_setup_xlate(const char *gic_match,
>         if (!irqc_node)
>                 return -ENOENT;
>
> +       of_node_put(irqc_node);
> +
>         irqc_base = base;
>         return 0;
>  }

irqc_node is a global variable, and it is used after this function
has returned.

NAKed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
