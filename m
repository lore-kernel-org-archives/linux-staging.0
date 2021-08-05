Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8346670
	for <linux-staging@lists.linux.dev>; Thu,  5 Aug 2021 11:31:15 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id u21-20020a17090a8915b02901782c36f543so5078487pjn.4
        for <linux-staging@lists.linux.dev>; Thu, 05 Aug 2021 04:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1EBdlg+wpGirHMmu5NpOXKP/wpVDNvTG7/9oMG8+2TA=;
        b=T79QxJMtJoS/ivMj3isDIYFd3/N4RCbbexFX0t1h5SX7XCPJG6tVru285TppZwWOPr
         eLuiWgak/SzvfxCMeG4cPfdLrPhJqkei5DRf6ZfGgL9tMjJQUU38jij0zr3xLU9j28GH
         wxfrOOBirApBfwqn3CSRucedRnCy4DrbFvNCcuCVWrZTZGGI0aVTm2TaHqUgjtJ+3/B2
         o31M0RBmSU/3x1RSNNGpOTtPvljeBXNQA+T3C1RHfEAJiEwBKlcRs9swRZXo1g/mYEAb
         0E8+4cxeJ9g6UfZ3uLjnb3l6p4N2oyMhLblsE4yoUBW/dejL05N4IYqb4X0fwpxGMZhh
         CqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1EBdlg+wpGirHMmu5NpOXKP/wpVDNvTG7/9oMG8+2TA=;
        b=nXKGGfOUouEDKufRJyB2GOZC55xXBcO+jeVFLV25KH/xQ1lZS0hEhcy/pWYEeIdjqe
         Xzld/8G/ILCrWhnXlLlWNhLPBiFrG4GvQqLnm/B6UK57Mo+ryUc8An0pcxTaaYL2Ls+5
         m43f079sPcP0vhSqz4t0QQObVqs5HjDCSMWvI2BXWn5bvexszqfWawKbJfeRv9g6H6sb
         OUaGazl5SF6SK7uUiHUzY7kJxO6NY0vKNUbdXI9p8DvIhCveTF5I6ftwObI5i2D3Ezr9
         XG3efSewAOXDgAK92ncUWWvdqcEUG8gpEiw5iiF8cjFEOsPdGtZNa0bDqqKcKMth0k3w
         6sFg==
X-Gm-Message-State: AOAM531FYtAJNRBjhklH0JSgWL+mx/1OYE1zdmILS7HenpO1Dz44ceu9
	MRGqu8Rvww8O1o9YOlL+hrFqwJDj/KsNKFWZn98=
X-Google-Smtp-Source: ABdhPJycCBqrY8XWLy+kVBb39vmiLH0ofV3jMCfOLQaWBv1ztWFo31bVO/8lk7CARMZbV+WTkAuumbYsSupxETjz690=
X-Received: by 2002:a17:90a:b10b:: with SMTP id z11mr14989609pjq.181.1628163074988;
 Thu, 05 Aug 2021 04:31:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210801085155.3170-1-len.baker@gmx.com> <CAHp75VcD_Kqedpkw-Pj+uQbWqdu_9FhXqJS5TuGUPoVv2x45-Q@mail.gmail.com>
 <YQvJB5s1zY2yO87D@kroah.com>
In-Reply-To: <YQvJB5s1zY2yO87D@kroah.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 5 Aug 2021 14:30:35 +0300
Message-ID: <CAHp75VeUH3+dZ6scREA-sZz8-7AF_MLobde+2-eZJz=MsxaW0Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Remove all strcpy() uses
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Len Baker <len.baker@gmx.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Phil Reid <preid@electromag.com.au>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 5, 2021 at 2:18 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Sun, Aug 01, 2021 at 02:40:40PM +0300, Andy Shevchenko wrote:
> > On Sun, Aug 1, 2021 at 11:53 AM Len Baker <len.baker@gmx.com> wrote:
> > >
> > > strcpy() performs no bounds checking on the destination buffer. This
> > > could result in linear overflows beyond the end of the buffer, leading
> > > to all kinds of misbehaviors. So, this serie removes all strcpy uses
> > > from the "staging/fbtft" subsystem.
> > >
> > > Also, refactor the code a bit to follow the kernel coding-style and
> > > avoid unnecessary variable initialization.
> >
> > I don't see patch 3 (even on lore.kernel.org).
> >
> > Greg, Geert, does it make sense to move this driver outside of staging?
>
> If you clean up everything that needs to be done, yes, please do.

Do we have a clear TODO for that?

The current one has the item which is not feasible to achieve in
reasonable time. Some of those drivers won't be converted to tiny DRM.
So the idea is to keep this out of staging in the maintenance phase
(as it currently states, i.e. no new drivers accepted).  For the rest
I'm not sure what else can be done (checkpatch? coccinelle?).
Actually the first sentence in this paragraph is a motivation for
moving out of staging.

-- 
With Best Regards,
Andy Shevchenko
