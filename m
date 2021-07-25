Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54A772
	for <linux-staging@lists.linux.dev>; Sun, 25 Jul 2021 18:51:54 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id mt6so9788596pjb.1
        for <linux-staging@lists.linux.dev>; Sun, 25 Jul 2021 11:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qirs+iLZFGRKsz/ZopqRyNng3+a0VdaNoIeySOmoJBs=;
        b=ryQJ486SrysdfwQYYY2pSFz6x9WPYf3me6zDgsy0m4p2aDx7AsvFubmhNxrWI+j4mv
         nsvVtOQpACYSIKSnrUTMMMUUQdp3SgVsYl0TD7ExOXYMOl9F27ZE/bAU4iYLTFdlttbM
         mgCsWVFzt5OIJaGyyWvVlaXnqOtUUQ3nC2OVhZV1MZ77YP7msKpmtmRPj9vV2BXO76Wu
         DeRSI5ITm7mYKMjdHyrm4wxysMYOQwP9EkFdubOY8tc52aVAyjbKLgzmaoChdQBcBiij
         VHm02K4+SLwTlRDCumkBT32LVccoGk37flJDSBLtEmBt5OrWlE4gDEz5t7dxqImxSUYj
         ZVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qirs+iLZFGRKsz/ZopqRyNng3+a0VdaNoIeySOmoJBs=;
        b=omMZfEGk6Kqp1euOOlPDcDLj14EBm/w0QtHT/HgWFzTuxrV9OcJWyCqOu4V3RUnpBf
         MCyOdA91/NKbrLAn/SKAaaD9MsEx/urImY9GXR0eRGeAilHUQ8CdbD9VhyUpfORaVJAD
         eCS20dk4LkID5E7umXMS2Cy5noJVmeLQGWsZMHD9z7tjSwfbfCkcfQv35OGtReXbHodP
         +qGVBm8zML3Qo9R1c+ace661DVmGVWmCcv3v1rsXZNf7RG04pzl5vvdU2fLmtB/Nn5Yq
         U6dCgpIMFxgkGqpbTcvPDiGTgtLzuzKX4p6R8MN5QLj/bPv+HewRR6i61PcDKKJSYqle
         ltdQ==
X-Gm-Message-State: AOAM5317ikAYZxAHHNqvWbVBov1Locxxu53D/uCK3y9ydUPaxeek/y6/
	JlfHcu+A9WtLU00LFJoM1g+qi6W3e3n1m0Oj63A=
X-Google-Smtp-Source: ABdhPJxHwipVJbJmzeHfWz64SwkxLZVfnnCGACfafL10iji3Cc/k3Num3SbdXCt9DRUt1CVwHIbCU+9rEVCNd+x0eNo=
X-Received: by 2002:a63:d014:: with SMTP id z20mr14700708pgf.203.1627239114212;
 Sun, 25 Jul 2021 11:51:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210724151411.9531-1-len.baker@gmx.com> <20210724151411.9531-2-len.baker@gmx.com>
 <CAHp75Vd+ZM_yO6CU_6oJieePMt00Sp6oKEU2+QEyZxLDg5PN8A@mail.gmail.com> <20210725135844.GA1953@titan>
In-Reply-To: <20210725135844.GA1953@titan>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 25 Jul 2021 21:51:18 +0300
Message-ID: <CAHp75Vd=_qgnaLpAq+=Awf+ggUf9DEm0amNyTE0KkYThxtP=WQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] staging/fbtft: Remove all strcpy() uses
To: Len Baker <len.baker@gmx.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Phil Reid <preid@electromag.com.au>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 25, 2021 at 4:59 PM Len Baker <len.baker@gmx.com> wrote:
> On Sat, Jul 24, 2021 at 11:21:04PM +0300, Andy Shevchenko wrote:
> > On Sat, Jul 24, 2021 at 7:05 PM Len Baker <len.baker@gmx.com> wrote:

...

> > > -       char msg[128];
> >
> > 128 / 4 = 32. So, this buffer is enough to debug print only up to 32
> > bytes. Hence %*ph replacement won't cut output earlier than requested.
>
> I'm sorry, but I don't understand what you are trying to explain. Moreover,
> with the "0x%02X " in the sprintf followed by the strcat, the msg buffer can
> print 128/5 values (25 hex values).
>
> The %*ph replacement can print up to 64 bytes, so I don't see any problem
> here.

Right. That's what I am trying to say and the hint here is to combine
this part into a phrase in the commit message in the next version of
the patch.

...

> > > +                       for (j = i + 1; par->init_sequence[j] >= 0; j++);
> >
> > Why is i + 1 initial for the j? You may rather access the 'i + 1 +
> > j'th element in the array...
> >
> > ...
> >
> > > +                                     par->init_sequence[i], j - i - 1,
> >
> > ...and get rid of the ' - i -1' part here.
>
> Yes, it was the first idea but I prefer this method since we save aritmethic
> operations. In other words, if I use what you suggest, the index for
> par->init_sequence is calculated as a "sum" every iteration. But if the
> performance is not an issue and you believe that the above is more clear, I
> have no problem. What do you prefer?

I prefer my variant and I believe the compilers nowadays are clever
enough to understand this. Have you tried to compile and compare the
real assembly?

-- 
With Best Regards,
Andy Shevchenko
