Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4CB7A
	for <linux-staging@lists.linux.dev>; Mon, 14 Feb 2022 08:05:44 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id g10so17840041vss.1
        for <linux-staging@lists.linux.dev>; Mon, 14 Feb 2022 00:05:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EuaFh4R/zObETHWYBEmlGLpeIw2W/ozuVWTZLGlRemg=;
        b=soB6TGXPjnzT0mTRaXkrYLK1BarKg3566YrW/1grXZ0gzrERUWKIYUFVQPKcnPVP86
         mkUMVBUfs1ptM3qRlp+BiL0kfh3hXgKUmRvwcIvoXMAAhxfc0lhplq3kNx3sE+i6QDNz
         IvsLG7fpml7atJyKqrOl4PYSX/uW/KVdBdSCmYpva+hUFhwYjXyBxHDqRrsF4zIRcvQV
         kw0ajrRGI9YbcWfSRJJ7VUGGyCz9xJrIRoiNaK57KCVq7U9AE4Xczrzqgu6SQNoI3ZQL
         HNZaOcMpTJ414rIjnO16+jJYWON1x5rQmVSsixCNbmE/VJJHMgJVoKNCNbo1z1+agfGh
         DbfA==
X-Gm-Message-State: AOAM5329i0D3Q8SJ8FAA4cStNiBIouDJT+yTrwO1OGnJIdLXdc8hOcpL
	YuZ0ucKYeFuXxeUvPsCZFcdjTLlwTyHyng==
X-Google-Smtp-Source: ABdhPJx30yqmRPSnMTJRwVfy3k2+vb4zXhChq7/uE3VX/vTBFR8j1ZCCTSPU+X/vfH++7zb0rxiNbw==
X-Received: by 2002:a67:ac09:: with SMTP id v9mr3353637vse.85.1644825943474;
        Mon, 14 Feb 2022 00:05:43 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id p196sm55128vke.27.2022.02.14.00.05.42
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 00:05:43 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id g20so5614317vsb.9
        for <linux-staging@lists.linux.dev>; Mon, 14 Feb 2022 00:05:42 -0800 (PST)
X-Received: by 2002:a05:6102:440d:: with SMTP id df13mr877893vsb.5.1644825942770;
 Mon, 14 Feb 2022 00:05:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220210141111.5231-1-tzimmermann@suse.de> <20220210141111.5231-3-tzimmermann@suse.de>
In-Reply-To: <20220210141111.5231-3-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Feb 2022 09:05:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVb1JjZkEo-PM6DTXOywcmJDRr0a=Ci94DJCj7dXbbihw@mail.gmail.com>
Message-ID: <CAMuHMdVb1JjZkEo-PM6DTXOywcmJDRr0a=Ci94DJCj7dXbbihw@mail.gmail.com>
Subject: Re: [PATCH 2/2] fbdev: Don't sort deferred-I/O pages by default
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, javierm@redhat.com, noralf@tronnes.org, 
	andriy.shevchenko@linux.intel.com, deller@gmx.de, bernie@plugable.com, 
	jayalk@intworks.biz, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Thu, Feb 10, 2022 at 4:24 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Fbdev's deferred I/O sorts all dirty pages by default, which incurs a
> significant overhead. Make the sorting step optional and update the few
> drivers that require it. Use a FIFO list by default.
>
> Sorting pages by memory offset for deferred I/O performs an implicit
> bubble-sort step on the list of dirty pages. The algorithm goes through
> the list of dirty pages and inserts each new page according to its
> index field. Even worse, list traversal always starts at the first
> entry. As video memory is most likely updated scanline by scanline, the
> algorithm traverses through the complete list for each updated page.
>
> For example, with 1024x768x32bpp a page covers exactly one scanline.
> Writing a single screen update from top to bottom requires updating
> 768 pages. With an average list length of 384 entries, a screen update
> creates (768 * 384 =) 294912 compare operation.

What about using folios?
If consecutive pages are merged into a single entry, there's much less
(or nothing in the example above) to sort.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
