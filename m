Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5387B70
	for <linux-staging@lists.linux.dev>; Thu,  5 Aug 2021 11:52:50 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id m10-20020a17090a34cab0290176b52c60ddso8679739pjf.4
        for <linux-staging@lists.linux.dev>; Thu, 05 Aug 2021 04:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mGypu+NaaW+Jhwv++tohvkOpOq2EXdTSw+wGzb6zcXY=;
        b=GKXmOU+ySf+o3OukbvSv/pA5RbTOf44GtDdunsovYzvoPvUnPMlSz4t0g+UqM3SsnG
         G1nzYSU4UXFic6w/8n6qihydAo38qyYbFj9YRvlrkRu+Wvjf9X5m2j2r/aKuSdpz2hvy
         C1vy+TeRBfItlx+pL7J7cYgw2plEnn/Z9hUA0yi5/hIg1Hs4lX01hDtVAoFKSdOgABeu
         ylgYVhXb5UJMvGdJTR5tSCUrHE63OAYYHpDHwiYMTvR2/lbYT3VOb0zsuc7j40xbusBf
         JK8Jx4viVS1X9ygZuHkq6qq5YGRDNZnHCkQd2X6i21oZZFLZLugKVoJeHr0WdTF0lfKK
         ADxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mGypu+NaaW+Jhwv++tohvkOpOq2EXdTSw+wGzb6zcXY=;
        b=tFyfB1qtxIqaO0nHcQCGTqPzbZEo9M80xpHySWmTV3GelyKYvF6fXWXBXXryWrTP/V
         IZ2yNXSJ/q5aIjEmFB+KBsPIC1tW03L1PFt8welFCc7BVGCInlUGv34RzuR9dot2G+tR
         a2SUOOmp8KJFsHKjxCABWUwQ5+MWtRCsTET6pwzo3NYsSnb2NCu+1oaBj2VzRcRrF9nW
         bNj68U495BwkMlcgnmh0L7G8J5zWT2bplcZDEorupQMlbXwjAJQSd3gx2fCqEl25V69y
         kvxaf1bgT+u5it+dC2h92Rf56mLiyq9Rg5fvBFTnLaB2C372ySvs5pvmxvuyOhNvnpGL
         yB0w==
X-Gm-Message-State: AOAM532s4zjhdOoan79cEK256J0x2Al5OasQQZyoX87hhxD6zMVwyAkr
	Ux8Ubo2kcihr59KRgrruCCfQM903TEUMz7ezlLo=
X-Google-Smtp-Source: ABdhPJyqrlC+wjN7QOWKQ3nQEXmW3Mste+3scQ3W1W2pJRbKhcHo+smIRdnf47EbM8CP0WtbPya/hI4LB7KfbDt26Hg=
X-Received: by 2002:a65:5ccd:: with SMTP id b13mr2323pgt.203.1628164369860;
 Thu, 05 Aug 2021 04:52:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210801085155.3170-1-len.baker@gmx.com> <CAHp75VcD_Kqedpkw-Pj+uQbWqdu_9FhXqJS5TuGUPoVv2x45-Q@mail.gmail.com>
 <YQvJB5s1zY2yO87D@kroah.com> <CAHp75VeUH3+dZ6scREA-sZz8-7AF_MLobde+2-eZJz=MsxaW0Q@mail.gmail.com>
 <YQvNnf0o9w4fdVjr@kroah.com>
In-Reply-To: <YQvNnf0o9w4fdVjr@kroah.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 5 Aug 2021 14:52:10 +0300
Message-ID: <CAHp75VdWiGM9-AqSeBC0tTWCVyLbjyf-F8_R0uns__HEUdrQMQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Remove all strcpy() uses
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@linux.ie>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: Len Baker <len.baker@gmx.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Phil Reid <preid@electromag.com.au>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

+Cc: David, Daniel, Noralf.

The idea is to move fbtft under drivers/fbdev on the same terms, i.e.
no acceptance of the new drivers there.
The rationale is that for some of the panels it (fbtft) will be the
only driver and nobody will convert it to tiny DRM.
See more below.

On Thu, Aug 5, 2021 at 2:38 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Thu, Aug 05, 2021 at 02:30:35PM +0300, Andy Shevchenko wrote:
> > On Thu, Aug 5, 2021 at 2:18 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > > On Sun, Aug 01, 2021 at 02:40:40PM +0300, Andy Shevchenko wrote:
> > > > On Sun, Aug 1, 2021 at 11:53 AM Len Baker <len.baker@gmx.com> wrote:
> > > > >
> > > > > strcpy() performs no bounds checking on the destination buffer. This
> > > > > could result in linear overflows beyond the end of the buffer, leading
> > > > > to all kinds of misbehaviors. So, this serie removes all strcpy uses
> > > > > from the "staging/fbtft" subsystem.
> > > > >
> > > > > Also, refactor the code a bit to follow the kernel coding-style and
> > > > > avoid unnecessary variable initialization.
> > > >
> > > > I don't see patch 3 (even on lore.kernel.org).
> > > >
> > > > Greg, Geert, does it make sense to move this driver outside of staging?
> > >
> > > If you clean up everything that needs to be done, yes, please do.
> >
> > Do we have a clear TODO for that?
> >
> > The current one has the item which is not feasible to achieve in
> > reasonable time. Some of those drivers won't be converted to tiny DRM.
> > So the idea is to keep this out of staging in the maintenance phase
> > (as it currently states, i.e. no new drivers accepted).  For the rest
> > I'm not sure what else can be done (checkpatch? coccinelle?).
> > Actually the first sentence in this paragraph is a motivation for
> > moving out of staging.
>
> Take it up with the DRM developers/maintainers.  If they approve for
> this to move out of staging without being converted over to use tiny
> DRM, then I am fine to move it out.

Got it.  Cc'ed this to corresponding people.

-- 
With Best Regards,
Andy Shevchenko
