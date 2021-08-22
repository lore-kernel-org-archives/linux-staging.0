Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D323FC3
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 14:58:22 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id t42so10530063pfg.12
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 07:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZrJiEr09vjMy6mI2+ykFgIl7I69Q/36IiW2OvUK4i3M=;
        b=JV2eL7bMtmTEu9p+NkW2Y+dtmfBXQSZN/f6twwLfwEuZ0awNYucAku/VdQ0BeA55ZC
         LXUk4YnujCrbS7A3SYzgnTzECEgp6cPurpOQ9gBFsUrvV3m9+ujV+ACYAciQxch3l1mf
         E4BI94IO5Xc2BMJwgWJ81JYKRaEsanTlP3kTxSmEmX5+Ixv+Q2DSsIHE3L9gsuwgZ/hp
         blTOeRR9Vxt/QL9PllYE2+chNVI0ZmGdg5SfrE6fxv2EvQ//2nHx7MSRhMzyXs/AfpYQ
         SmR0FTE1phpqfnXSypN8upNPdtJpTKHKyc5O6T/pp04Y0uFxqpzDNNKT7Ui62rktHb8v
         oXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZrJiEr09vjMy6mI2+ykFgIl7I69Q/36IiW2OvUK4i3M=;
        b=lk/16rQUsuyWi7SHekG8T1noU7yBu+LSiZhWDWxokVizeFQQnXnjRdIvgWih+yCcZA
         PuwJB3Zt6dgyy0kqcsEdnpegyV6c2jfhiU3fxbkmK8oOWpCUKdy8AR0P+4GV0ED5hu7D
         sGu+Nq2Su6WfPpjaiml12uJmjI7jP4YR6MVxl8mudFqb0fyYoz5MP/mU88S6Ef298hxU
         AR1yljDV4WitvJUiUT2AiDA6bi90N+5SngpVieY7WJfgXjAnZKId52vVS60r4flcwU1M
         uL5yzYaqj6fVKhpCW8xzCxohvxwI4/smV1i11Qv3X7H7OXZK+rh7BROgAQQrubdPiv1K
         I/tQ==
X-Gm-Message-State: AOAM533EP47nMvpN1r54rjVQaBVklDgNBZ0xmwZ3ErxmVgVi4AFH74Oj
	LkM1weQW4U8Q684SeIe+B009BXnUgSjlne2HoxxIoQ==
X-Google-Smtp-Source: ABdhPJyXKWs7oBUytsfLTRz6W7adqsBqkpsdGnWsMugoiyviBLbLvjl60mL4kUzkCah9Kgx0vmR09o3NwN1E05IQBOs=
X-Received: by 2002:a62:5c6:0:b029:341:e0b1:a72c with SMTP id
 189-20020a6205c60000b0290341e0b1a72cmr29600516pff.71.1629644301902; Sun, 22
 Aug 2021 07:58:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YSFgrLUfXzgcT6k4@user> <CAA=Fs0kByg1NztU+Nf__RUzTHuVh_q2hvcyh+3JqXiVgn+_VeQ@mail.gmail.com>
 <1821445.fzUCeO1EU3@localhost.localdomain>
In-Reply-To: <1821445.fzUCeO1EU3@localhost.localdomain>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Sun, 22 Aug 2021 15:58:10 +0100
Message-ID: <CAA=Fs0mu4m04_Be4-f=W+=_hhGn5oJ2q=KOmZdRrMyGhMgqc-Q@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: core: remove condition with no effect
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Saurav Girepunje <saurav.girepunje@gmail.com>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, saurav.girepunje@hotmail.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 22 Aug 2021 at 12:06, Fabio M. De Francesco
<fmdefrancesco@gmail.com> wrote:
>
> On Sunday, August 22, 2021 1:58:10 AM CEST Phillip Potter wrote:
> > On Sat, 21 Aug 2021 at 21:23, Saurav Girepunje
> >
> > <saurav.girepunje@gmail.com> wrote:
> > > Remove the condition with no effect (if == else) in rtw_led.c
> > > file.
> > >
> > > Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> > > ---
> > >
> > >  drivers/staging/r8188eu/core/rtw_led.c | 5 +----
> > >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > Thanks for this, looks good.
> >
> > Acked-by: Phillip Potter <phil@philpotter.co.uk>
> >
> > Regards,
> > Phil
>
> Dear Philip,
>
> Before acking, please check at least if it applies to the current version of
> the tree and check if it compiles without adding warnings and / or errors. :-)
>
> Thanks,
>
> Fabio
>
>
>
>

Dear Fabio,

An Acked-by merely signals acknowledgement of the patch, and that is
looks OK to the person offering the tag. Please see the following
quote from the kernel.org documentation:
"Acked-by: is not as formal as Signed-off-by:. It is a record that the
acker has at least reviewed the patch and has indicated acceptance."
It is not, to my knowledge, a commitment from the reviewer that the
patch applies to the given tree at that precise moment in time.

I reviewed the patch, and indicated my acceptance - the content of the
patch is fine. Whilst I will often make an effort to merge + build
test many patches, I will not do this with all of them, I simply don't
have the time due to other commitments. You can be assured that if I
have offered this tag I have at least read the patch and it looks
correct to me.

Particularly with a driver as in flux as this one, there are going to
be many merge conflicts. Advice such as this to me is not particularly
helpful, as I can promise you I'm trying :-)

Regards,
Phil
