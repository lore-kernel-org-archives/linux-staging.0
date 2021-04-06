Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79F56D0E
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 14:34:18 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id s16-20020a0568301490b02901b83efc84a0so5897462otq.10
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 07:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZUYbOgHuSAYpzoZRGuGwSjbBeBpiwQiB3xQEQ3O76qc=;
        b=a6C3pD6FZR61u+r6hPwcKK5oPhn2ctxJjsOImJToXfLJYrlNSUeZlN8JXgdtQBIVae
         b9yU843pSLe08l56Q2/hEbSH5fsx8eEr5yWr1T4+EzogfNEIZsPyQ67wOIZkugIg0xlQ
         TQ7VNHagnrdq+1WZq2jRezfmr2+eQIdlYIG0l1tvV4dwwIddjU/Pt2Js8t9ufQcfxCqs
         JvGd4jmKggm7npHfYtd0utBl1JwrfefCX79/TTOcmlDBcAsWQxHHw6I4VdJXpratuhk6
         zYSk/LJHPnzrH20acNB8EAYmRlUGgBzARdDYtfZRncK4jMwIptaogcenWCCjnVgLpQ4K
         xswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZUYbOgHuSAYpzoZRGuGwSjbBeBpiwQiB3xQEQ3O76qc=;
        b=MoqozKVHRcYzyYoNmVFBxCGgnBvWYQfNjEUQI/F2byhIZm1ka19mnjjRWE1m597xj2
         nxTGeB1tqbv6wfdReS4xIxUD4UBy9p0wvTxQylUFP7X3avY5S4ZmYn6HxP9OB+HKJkMX
         C8UN3CeSntWP20+LEsu2ZWdoYsf4v7eLNKppsr6OsDAAIvEcqTGWj5cryO7TPsYpz+p/
         vJvMtXisvbjpBjmSQXX5abjuhH9nTj9mDYtgeVZseWgP5Ey+Ey+dqW+5VFHb98LYiOVC
         l5ovUc9tRk+ObVyplDarVmZrBo6W2lEe9dkocAA1qfmKrgfh8pTRiARJbRP8RBu4gVOZ
         +K3Q==
X-Gm-Message-State: AOAM531y829NGmIla9xmTZP8cs9Cjdu99QvnxF56Ky+qdCw8CXK3xBnO
	MMfBg3l74nqCUQycuUsh+nhXGO9ndo9nDRhFd84=
X-Google-Smtp-Source: ABdhPJw+RpxaUJRD4x+ANKSTuUZqr3U2pPGGzKUXF6U947nHKwYLnjdlgPwqe848FvMQt2dG3B9apfw1P1ldGolMpPs=
X-Received: by 2002:a9d:7f8a:: with SMTP id t10mr26190979otp.239.1617719658109;
 Tue, 06 Apr 2021 07:34:18 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210406130556.1417-1-fmdefrancesco@gmail.com> <YGxsExq2fcQvrN99@kroah.com>
In-Reply-To: <YGxsExq2fcQvrN99@kroah.com>
From: FMDF <fmdefrancesco@gmail.com>
Date: Tue, 6 Apr 2021 16:34:02 +0200
Message-ID: <CAPj211u9MHgtjeZGUPsLxU3HkbJ8cr2EUL0v9HA7LE9-b1uUoA@mail.gmail.com>
Subject: Re: [Outreachy kernel] [PATCH v2] staging: rtl8723bs: hal: Remove
 camelcase in Hal8723BReg.h
To: Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 6, 2021 at 4:11 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Apr 06, 2021 at 03:05:56PM +0200, Fabio M. De Francesco wrote:
> > Remove camelcase in some symbols defined in Hal8723BReg.h. These symbols
> > are not used anywhere else, therefore this patch does not break the driver.
> >
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/hal/Hal8723BReg.h | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
>
> If this is "v2", you need to put below the --- line what changed from
> v1.

It is a v2 only because you made me notice that I forgot to cc
linux-staging and linux-kernel.
So I sent it again, but probably I shouldn't have changed the version
number because nothing else had changed.

> Please fix up and send a v3.
>

No problem at all. I can explain in the patch v3 what I wrote above.
May you please confirm that a patch v3 is the correct solution even
when nothing changes in the code?

Thanks for your help,

Fabio

> thanks,
>
> greg k-h
