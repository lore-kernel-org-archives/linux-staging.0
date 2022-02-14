Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEEA7D
	for <linux-staging@lists.linux.dev>; Mon, 14 Feb 2022 09:05:27 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id j20so4068615vsg.5
        for <linux-staging@lists.linux.dev>; Mon, 14 Feb 2022 01:05:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ACc7MhlmQaRHyX1iGzVS1S3D+ci69MdBwNfaRqsmbHE=;
        b=uK1KAgxeEYXLtnRFxCBXiPQ9FRSIaBjdyKZfDwkXJ2FBt77Jx9b0CTsohtcbd+fxV5
         XWogTqDc8Sxl+ud2B/FVWcXP8LxvBLl5y/8rxDtUaQGNRzUKT8J3Qmle+Ei81BBwy2nu
         tW8TEdiHXrCDOMdUvC1opocERAmrrrJh8s96hTq9Gb9a1XMbD12MtRh+hblrcZ0lLiLJ
         1ZuB5EUnhNwkP5DG2arF28s2H0mwMSyF+mhrbEXL7SfuXUlHffz/LBUqhtwLXtYlXhld
         DWbOoYT/r8HOc3O+k+r3TpF22kAbdjfig1v57E3NbatO42OvJEmx2JujrQA5PqYwv/GP
         UayQ==
X-Gm-Message-State: AOAM533zFM6MQwB4RPNAamGNPfxh1pheMzJ4xuxiFul2WuqAdZhkgOFG
	Qc8ly/hgnpmSD3BAKzUHkwCi+/SwnFQISg==
X-Google-Smtp-Source: ABdhPJwQkXqQD5tWurupNznvmMNxE5zi4UoELGuJXH2HUh6201e8Q8qv5yTt3WmZOgpUKGp3XF91rA==
X-Received: by 2002:a05:6102:a48:: with SMTP id i8mr3368070vss.68.1644829526478;
        Mon, 14 Feb 2022 01:05:26 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id p80sm155023vkf.7.2022.02.14.01.05.26
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 01:05:26 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id m24so17941306vsp.7
        for <linux-staging@lists.linux.dev>; Mon, 14 Feb 2022 01:05:26 -0800 (PST)
X-Received: by 2002:a05:6102:440d:: with SMTP id df13mr936716vsb.5.1644829525839;
 Mon, 14 Feb 2022 01:05:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220210141111.5231-1-tzimmermann@suse.de> <20220210141111.5231-3-tzimmermann@suse.de>
 <CAMuHMdVb1JjZkEo-PM6DTXOywcmJDRr0a=Ci94DJCj7dXbbihw@mail.gmail.com> <9b2e2649-1511-66a3-b346-60863de788fc@suse.de>
In-Reply-To: <9b2e2649-1511-66a3-b346-60863de788fc@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Feb 2022 10:05:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWPw8UcTVown3Zghxn11-WuqSBNCWKpP3T5NUxxZmntcA@mail.gmail.com>
Message-ID: <CAMuHMdWPw8UcTVown3Zghxn11-WuqSBNCWKpP3T5NUxxZmntcA@mail.gmail.com>
Subject: Re: [PATCH 2/2] fbdev: Don't sort deferred-I/O pages by default
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de, linux-staging@lists.linux.dev, 
	javierm@redhat.com, dri-devel@lists.freedesktop.org, bernie@plugable.com, 
	noralf@tronnes.org, andriy.shevchenko@linux.intel.com, jayalk@intworks.biz
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Mon, Feb 14, 2022 at 9:28 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 14.02.22 um 09:05 schrieb Geert Uytterhoeven:
> > On Thu, Feb 10, 2022 at 4:24 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >> Fbdev's deferred I/O sorts all dirty pages by default, which incurs a
> >> significant overhead. Make the sorting step optional and update the few
> >> drivers that require it. Use a FIFO list by default.
> >>
> >> Sorting pages by memory offset for deferred I/O performs an implicit
> >> bubble-sort step on the list of dirty pages. The algorithm goes through
> >> the list of dirty pages and inserts each new page according to its
> >> index field. Even worse, list traversal always starts at the first
> >> entry. As video memory is most likely updated scanline by scanline, the
> >> algorithm traverses through the complete list for each updated page.
> >>
> >> For example, with 1024x768x32bpp a page covers exactly one scanline.
> >> Writing a single screen update from top to bottom requires updating
> >> 768 pages. With an average list length of 384 entries, a screen update
> >> creates (768 * 384 =) 294912 compare operation.
> >
> > What about using folios?
> > If consecutive pages are merged into a single entry, there's much less
> > (or nothing in the example above) to sort.
>
> How would the code know that? Calls to page_mkwrite happen
> pagefault-by-pagefault in any order AFAICT.

fb_deferred_io_mkwrite() would still be called for a page, but an
adjacent page can be merged with an existing entry while adding it
to the list.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
