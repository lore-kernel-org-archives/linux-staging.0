Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ED968
	for <linux-staging@lists.linux.dev>; Mon,  6 Dec 2021 08:53:34 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id q21so6268055vkn.2
        for <linux-staging@lists.linux.dev>; Mon, 06 Dec 2021 00:53:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Fa88EzZGCDt/on2PK9adyVtAB10G/5IDqGLBZHmYHC8=;
        b=LEtnPz+kueUNysVoBTfi/W87kTAmwHgFQeO9fk8XezzKrUTU2iWgFbzbTaRxpnb0B/
         zmqpQ4ytqBBRGetxW+MaOUsWDO0xfX/fP3kXP6m2BXkKIAOldq9G00smfni0roVxFk9r
         dnUosGrbnBBlXg9u6Q8sn/FyoSVrt9FTx2z0dTdSs50GEY9ELlWcvhiZRF4YgDsdz0FB
         rlEa/ISvDrkvxXgeZLp6sQvidN33EB9FoAdWeAgw3uvsqgW2fs8twjNT1OUyayUQO86W
         dECe3s43Dov24xF2Zn54zsiRQKlkkuNwCFX9N+HmJYqLbCJt06xwFXW1JEdtUfZClje9
         C/bw==
X-Gm-Message-State: AOAM531Xb3QB4+ZuDMEOs/79Iki5fY7RzmdAQoX7yE5fcmCvD8Rc5v3e
	L7anpobyJ3iA4069VvkYrgnGePey0iH3lg==
X-Google-Smtp-Source: ABdhPJyeUwx/f6GGuCMppx2KSr8AOINdfxQe7dO33MZbKZ8wN17xe70I0U2Fx/xOP4UYrA+BCbSgYA==
X-Received: by 2002:a05:6122:2015:: with SMTP id l21mr40265660vkd.16.1638780813097;
        Mon, 06 Dec 2021 00:53:33 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id j21sm3781922vkn.4.2021.12.06.00.53.32
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 00:53:32 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id j14so18015286uan.10
        for <linux-staging@lists.linux.dev>; Mon, 06 Dec 2021 00:53:32 -0800 (PST)
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr37900038uai.89.1638780812238;
 Mon, 06 Dec 2021 00:53:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211124150757.17929-1-noralf@tronnes.org> <20211124150757.17929-2-noralf@tronnes.org>
In-Reply-To: <20211124150757.17929-2-noralf@tronnes.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Dec 2021 09:53:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUhtwXVFNCzijdtXtuRD=VeHQm2sEQ8WZfin6uBmY0QHg@mail.gmail.com>
Message-ID: <CAMuHMdUhtwXVFNCzijdtXtuRD=VeHQm2sEQ8WZfin6uBmY0QHg@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: display: sitronix,st7735r: Fix backlight
 in example
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: Rob Herring <robh+dt@kernel.org>, David Lechner <david@lechnology.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	DRI Development <dri-devel@lists.freedesktop.org>, 
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 25, 2021 at 4:17 PM Noralf Tr=C3=B8nnes <noralf@tronnes.org> wr=
ote:
> The backlight property was lost during conversion to yaml in commit
> abdd9e3705c8 ("dt-bindings: display: sitronix,st7735r: Convert to DT sche=
ma").
> Put it back.
>
> Fixes: abdd9e3705c8 ("dt-bindings: display: sitronix,st7735r: Convert to =
DT schema")
> Signed-off-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>

Mea culpa
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
