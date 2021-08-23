Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D773FC6
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 22:38:13 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id x15so1626053plg.10
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 15:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ls4wTzpAa/UZnJAhPpmUr+INHPkSHtnofBYbCYCTzyk=;
        b=fAcusxJ6XKUL8t7FXM1y3WtR17cVaFSBv7ku7U1H3elmNv9mQmLf6UW+xn+5ctZtct
         LLwdMyxTJPA+0X6O/ZuCscYfTqMVjM8zXDx2wuH/HcvRgq+rkEwSfFblL5CifR8j2xut
         4Bg3g94NsO0U6DrrC9ygqqxqNtcuIcOHjCjrqSqMxbmy5iSm+UfHvYBMy3e8D3VXe92X
         aUOc66Hk6Z9/SfCMiG8Cmln+D6I+JB9AVELDFmJD48B6K0oedQEJm/X9w4ABK44K3Md/
         PpzHooRdNOisKiG66aeV8YdACBimlwIOFTY8JtMRjmphYFafQ4oiVZqmNqqXQ5FGVZhY
         hOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ls4wTzpAa/UZnJAhPpmUr+INHPkSHtnofBYbCYCTzyk=;
        b=gQck+29wu0WivQAfQakaWsQxFyzvsstnwQN7mptFVrxpNdNmzoI8J+2ih+2hJwAPFa
         PxFdUGRl6hR/TN0MNlRv9/xuUA/n76F1FwtLXWD0DWpLuGZTY8z3VEWE0IzBx4diyGcP
         q9fBAk3r5UkxYCqbBdOw302ljiLW5o6sS/k2LcVyPINVs069mVgelpnBCrngShHU4/u3
         XCWlYOMvM0eE0Xf0cHx03cQwuJLsReAbC6NCnnOM1wddetRHoQc1LhXTP4QZeMEHqBAJ
         btZnNIWK7XIU0lIX6wjmRCRK85vdyVyxb5XUL+/7agR97TJaY3ab6IPZqYkJSvnjpvf3
         GNTQ==
X-Gm-Message-State: AOAM53200VHuY/b0GEStcwQqZcRte5g0lh09arrLnW6OD13xWsGtT1l6
	0GDsaxvxYVwxRBm1a4FpRGz9dOjTY69p8G6Xu167HQ==
X-Google-Smtp-Source: ABdhPJx6KS3qbCu+cw6fRdySrJxukemk3ty6zIhIK0NSv6weZRL1AxHAmZk/2EyQBzJr1LpCBCypoUgZm+FjB0UPj/4=
X-Received: by 2002:a17:90a:1b2e:: with SMTP id q43mr831589pjq.217.1629758292730;
 Mon, 23 Aug 2021 15:38:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210823081820.9724-1-straube.linux@gmail.com>
 <CAA=Fs0=6=ueb53iNhyjSE5B8CdQvrpijgihAaN9YVwdDgNGiFA@mail.gmail.com> <cb8d08f7-c27c-d6f3-1128-4047350d6871@gmail.com>
In-Reply-To: <cb8d08f7-c27c-d6f3-1128-4047350d6871@gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Mon, 23 Aug 2021 23:38:01 +0100
Message-ID: <CAA=Fs0=46RNFVBphJb+yj8KRKsMfePRu21bAB+puTntSF7ayFA@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: remove ip.h header file
To: Michael Straube <straube.linux@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Martin Kaiser <martin@kaiser.cx>, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Aug 2021 at 23:32, Michael Straube <straube.linux@gmail.com> wrote:
>
> On 8/24/21 12:21 AM, Phillip Potter wrote:
> > On Mon, 23 Aug 2021 at 09:19, Michael Straube <straube.linux@gmail.com> wrote:
> >>
> >> The struct ip_options declared in ip.h is only unsed in the optlength
> >> macro which is also defined in ip.h. All other definitions/declarations
> >> in ip.h are duplicated from <include/uapi/linux/ip.h>. Remove the ip.h
> >> header file and its includes.
> >>
> >> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> >> ---
>
> >
> > Dear Michael,
> >
> > Thanks for the patch. Sorry, but it seems to conflict with your
> > earlier patch titled: "[PATCH] staging: r8188eu: remove if_ether.h
> > header file". They apply fine individually, but not together - can you
> > confirm this is the case for you as well and not just me?
> >
> > Regards,
> > Phil
> >
>
> Hi Phillip,
>
> yes I can confirm, sorry about that. I will rework and send both patches
> in a series. Thank you for testing and pointing out this conflict.
>
> best regards,
> Michael

No apology necessary, and thanks again for the patches.

Regards,
Phil
