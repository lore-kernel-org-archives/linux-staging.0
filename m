Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500193FC9
	for <linux-staging@lists.linux.dev>; Sat,  4 Sep 2021 11:12:02 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id u6so1620598pfi.0
        for <linux-staging@lists.linux.dev>; Sat, 04 Sep 2021 04:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PmFrXKRKeIR2yVHZ2IBS5vFBvtUC5hAYiL4a0y3Y7B4=;
        b=HU2TLwarjzF+4YD6vfsmIndBSmCCqdCMImTC1yJ/qxtemhz2qZHsa1oY9qWctSQfLc
         tpc9N7ONfG3hdOTNu39XNny25GBSmrKdNGGZuIsqGn+yAHl1KbpipSS+KHV7/ZKIyHRS
         o+UIOT7lHTI+uCSkv5x/gLp9GAbvZbUzgWz0p32dbqmzgUzIXBnY+E98UPNnR/AGKopB
         RihMMwSf5paPr5sQTzQXF3L1P5Yxnk8hZO+PDj+Qnl3J/Ojk+/vCxLNQ+UEh0JTVmVGD
         fQw6PwiJGAJc9hnlgjGX464TPJN9D+yuN6KgSAxkefP6wV51k/LJWucv/za3c7d6K9Dj
         ndIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PmFrXKRKeIR2yVHZ2IBS5vFBvtUC5hAYiL4a0y3Y7B4=;
        b=Exx/Hjak2Hq0aZR359qF/WaOEgi00XE304AVRRdv2OG5Yd02/cSYRK5t8eK1ImVFf3
         B4m/sTAYI4Gu8+vCnWgYrwK9V0dNhdbOdJT7JPF5TxAINLHoA/xQz/845Ck4fkwWzyYL
         Lf5AJrmWrxtiqh8nDXovE9iB4JARQ2c+WgDuUTeMDYdz6IlWcAOlYfTU5dOrgTgjdW/M
         pG3ZIVhlLuuGNVYWvk0SGvMu5WY3tM0fuXwiBUgvjFkBrdX3X05epY2JidQWMk+NKQCc
         sjXGgRb5Bfjonc4M2DZj1GnMWhAtFyUhZ0ujXMhM7sMxTokt/HPi5HXvGXLJRLoRga90
         4QzA==
X-Gm-Message-State: AOAM532CQLPjvcib7KKvUbxCoW/urMRR3VHb/PLxKPdQjDJqli35nJMI
	4HglPCmzuJcNxlIyRkf7yDG1YjJjivCiRhL9K8k=
X-Google-Smtp-Source: ABdhPJxW6JnVQwvmRZMx83HSKQs/kFc6IsPZBDVIpoMP7wTlLCjPqIdgyvZu3DxEAnhGOr9O4aqSMFmlWNbz5+yoRSc=
X-Received: by 2002:a63:101c:: with SMTP id f28mr3195734pgl.330.1630753921691;
 Sat, 04 Sep 2021 04:12:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210902111339.GA577108@panther> <YTCU3SpFgyFbxXs3@kroah.com>
 <CAPGkw+xhPfD0acY1GcwPpHg=kHw7o2+y94-r3AxfzsfyqG4bDw@mail.gmail.com>
 <YTJXOFlkLTBTg9rl@kroah.com> <CAPGkw+yKQx+O3yfxxMgv9oyH2-pun5-g=+mFWQ_YwbfXp1Y6cA@mail.gmail.com>
 <YTMMAS+veKFAwRi7@kroah.com>
In-Reply-To: <YTMMAS+veKFAwRi7@kroah.com>
From: Krish Jain <krishjain02939@gmail.com>
Date: Sat, 4 Sep 2021 13:11:50 +0200
Message-ID: <CAPGkw+yHzWsQvARu+k9F7S-sRScDjuTz05Sbypzvv7qJC3O21Q@mail.gmail.com>
Subject: Re: [PATCH] Fix formatting for file "hsdma-mt7621.c"
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 4, 2021 at 8:02 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, Sep 03, 2021 at 08:54:33PM +0200, Krish Jain wrote:
> > On Fri, Sep 3, 2021 at 7:11 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, Sep 03, 2021 at 05:49:46PM +0200, Krish Jain wrote:
> > > > On Thu, Sep 2, 2021 at 11:09 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Thu, Sep 02, 2021 at 01:13:39PM +0200, Krish Jain wrote:
> > > > > > This patch fixes the format of the code. It properly formats lines that should not end with a '(' as suggested by checkpath.pl.
> > > > >
> > > > > Please properly line-wrap your changelog text like your editor asked you
> > > > > to.
> > > > >
> > > > > Also, your subject line needs work, look at other commits for this
> > > > > driver with:
> > > > >         git log --oneline drivers/staging/mt7621-dma/
> > > > > and notice how they say the driver name and the subsystem.
> > > > >
> > > > > Please fix up and resend a v2.
> > > > >
> > > > > thanks,
> > > > >
> > > > > greg k-h
> > > >
> > > > Do you mean I should line-wrap (at 72 columns) the entire thing or
> > > > only that line?
> > >
> > > Your whole changelog text needs to be wrapped at 72 columns.
> > >
> > > Look at the 'git log' in the kernel tree for hundreds of thousands of
> > > examples :)
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > Hi, so you mean only the change-log text (as in the text telling what
> > changes have been made) needs to be wrapped at 72 columns but the code
> > itself (the git diff) doesn't, right ?
>
> Yes, just the text that you add to the commit message.
>


Oh, wow, thank you. That's rather easy. You'll have it ASAP when I reach home


Best Regards
