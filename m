Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400972C99
	for <linux-staging@lists.linux.dev>; Tue, 30 Nov 2021 08:13:59 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id l24so39755471uak.2
        for <linux-staging@lists.linux.dev>; Tue, 30 Nov 2021 00:13:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M9TvqAb2dbPQyUlV58mO9YTh/iv9wO/YMHLV7b29cnQ=;
        b=0EbXCDWxCrOKIJonPnhDF+i+qBGwawvrhYCE7Oi9JUK65NHqFWu0yqu7D9iYVnx+Ai
         aeAHyVQjVWOQsx2BzOl8E5DIFlv/BTWadbJ/KfTY9BBEaeeclUbnGQNe7RO+8BxbCltp
         pwJIUsCOtsT6yh1ySe5OZr8XS8GS5DnUYWEvyOZTS6kpAciHwC8pFPbPX3GPJSZ6xjJG
         P09tDCq8MQJJ72t9ziXoBeMg6JczqXnpoy+g9DZ98OmLOoT3UFMllhoEzKpxfpCvb9ZR
         p1t2ZJ9096VxumjMi1oICh2OD3R9hrmClpIl6cET4t98yvYdzGF/ui/4Zgkl8GAcdyN2
         GL4g==
X-Gm-Message-State: AOAM530ceif/Npss9WLHJzXDYmzVH0QqOtVu9Em5MZTz8cTk+RDDlSBS
	WYpdH9Fd6rWwSwJPjrEA+koOSXosDHq+Qw==
X-Google-Smtp-Source: ABdhPJyE2tFHmP4SlNvSe0DuthKDbQZS72j+2GIuoCSZsspUrxPtkUEno79GMaHaEgrzZuFtnYOk8Q==
X-Received: by 2002:a05:6102:3709:: with SMTP id s9mr37648287vst.10.1638260037849;
        Tue, 30 Nov 2021 00:13:57 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id g187sm10218585vsc.10.2021.11.30.00.13.56
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Nov 2021 00:13:57 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id b192so13022175vkf.3
        for <linux-staging@lists.linux.dev>; Tue, 30 Nov 2021 00:13:56 -0800 (PST)
X-Received: by 2002:a1f:4641:: with SMTP id t62mr25229885vka.0.1638260036796;
 Tue, 30 Nov 2021 00:13:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211124150757.17929-1-noralf@tronnes.org> <eba23198-5c52-6520-079b-d2d41f71dc25@lechnology.com>
 <20211129093946.xhp22mvdut3m67sc@houat>
In-Reply-To: <20211129093946.xhp22mvdut3m67sc@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Nov 2021 09:13:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUKcOuTjSOQmEywXWJtK+15jPD5jfxXx06JJG1f1U+fog@mail.gmail.com>
Message-ID: <CAMuHMdUKcOuTjSOQmEywXWJtK+15jPD5jfxXx06JJG1f1U+fog@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm/tiny/st7735r: Match up with staging/fbtft driver
To: Maxime Ripard <maxime@cerno.tech>
Cc: David Lechner <david@lechnology.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	DRI Development <dri-devel@lists.freedesktop.org>, 
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"

Hi Maxime,

On Mon, Nov 29, 2021 at 11:17 PM Maxime Ripard <maxime@cerno.tech> wrote:
> The problem that fbtft (and this series) wants to fix is completely
> different though: it wants to address the issue the users are facing.
> Namely, you get a cheap display from wherever, connect it to your shiny
> new SBC and wants to get something on the display.
>
> In this situation, the user probably doesn't have the knowledge to
> introduce the compatible in the kernel in the first place. But there's
> also some technical barriers there: if they use secure boot, they can't
> change the kernel (well, at least the knowledge required is far above
> what we can expect from the average user). If the platform doesn't allow

If you can change the DT, you can introduce a vulnerability to change
the kernel ;-)

> access to the DT, you can't change the DT either.

How do people connect a cheap display from wherever to their shiny
new SBC and make it work, without modifying DT?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
