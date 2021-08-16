Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CB62F80
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 07:38:23 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id a5so19800392plh.5
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 00:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5VrJu85JawDJ3CQf26LwvcJItsb64t/VJnjpVpHgnxk=;
        b=B1k94xNLEn4C2LuwESfZzOpmqfs3i0/4PQUQEn/2H7HzV2sLehF7kpyB+1JauVOQg5
         c9ykrXyuMd2p4edU/fIdbayrnTil50b1pNU+0gQ6HyQR/Ldsw1syEQYXDZBsAsEAGi0W
         AiRafNwAQAitm20W80EDQ6lxfst9Cdc/8vy/Fh/nTrd5z/Fiz/cilg90rkmuINT6UBju
         iWJHd9nq4rv3MyJB8KP6quvbvMZJ59witkuqTBQLAbGpd+dFhBqfI3yQjiERYzyw0OWk
         erF9cdepqq3kywhmE911Vao6P6CzVLjsxxxriwI05+4fu02QUgbSZjUMtcTkrNSVb8p/
         sQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5VrJu85JawDJ3CQf26LwvcJItsb64t/VJnjpVpHgnxk=;
        b=tKAqouDNtYmm7jU3J79ZwmNWPpBhQEJAAijFNWMjQd2CcXB1tiOqRJg55291hCUezw
         0NrjJBXoXpMlMgKwUGFcfPEZPjq41zB79NaQPJO69WE+sTY11RvvJSD4ORq9huN5Vs/J
         EpWvh1JgAmNjjnckrOe5pvm6XDU61CkIsV0D8H2rGvDjcK3DJRvcZ2Kq/2Tm5VQSlatX
         mYgT4pp13sx9kBptN1rD9DeRDLA6t65cPnFIPXJPf80lYuBkLCq6gefP659iO6ueNTEY
         wnvDoaWWk40GTttDn0dW5jkwxhJ8FFUQHpYPipc6yIJyhYHZ8eiUsxhdEaWMxMfHUyxe
         qidg==
X-Gm-Message-State: AOAM531jSQexeWLww0kMVzxhOUnB1pvk2JA5da/84YZh8KC49xo8Qruc
	vogfNDADApaVbNGV0dmtwWKKKhEArzx+c3wgpo19rg==
X-Google-Smtp-Source: ABdhPJxFAGi2odbOaRgI0K2SQLqyth4cpZO53gpPBvUZNU3F9bPY8RlTxM6oX+DdW3DxJBxlLSKKBB2c0/05WyF9hP0=
X-Received: by 2002:a65:6a0a:: with SMTP id m10mr14833760pgu.82.1629099503333;
 Mon, 16 Aug 2021 00:38:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210815230518.91656-1-phil@philpotter.co.uk> <11475165.p2zfeMNkXv@localhost.localdomain>
 <325822103.EpFXLVovdo@localhost.localdomain>
In-Reply-To: <325822103.EpFXLVovdo@localhost.localdomain>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Mon, 16 Aug 2021 08:38:12 +0100
Message-ID: <CAA=Fs0m4sGcGfWcaV3mVkNigaZZ9gxxEhOZAhXESsHMscRxgWw@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: remove unused variable and DBG_88E in hal/rtl8188e_cmd.c
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Michael Straube <straube.linux@gmail.com>, Martin Kaiser <martin@kaiser.cx>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Aug 2021 at 08:01, Fabio M. De Francesco
<fmdefrancesco@gmail.com> wrote:
>
> On Monday, August 16, 2021 8:55:06 AM CEST Fabio M. De Francesco wrote:
> > On Monday, August 16, 2021 1:05:18 AM CEST Phillip Potter wrote:
> > > Remove set but unused variable init_rate from rtl8188e_Add_RateATid
> > > function in hal/rtl8188e_cmd.c, as it fixes a kernel test robot warning.
> > > Removing the call to get_highest_rate_idx has no side effects here so is
> > > safe.
> > >
> > > Also remove the DBG_88E macro call in this function, as it is not
> > > particularly clear in my opinion. Additionally, rename variable
> > > shortGIrate to short_gi_rate to conform to kernel camel case rules,
> > > and improve general spacing around operators, some of which triggers
> > > checkpatch 'CHECK' messages. These are not related to the test robot
> > > warning.
> > >
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> > > ---
> > >
> > >  drivers/staging/r8188eu/hal/rtl8188e_cmd.c | 22 +++++++---------------
> > >  1 file changed, 7 insertions(+), 15 deletions(-)
> >
> > Dear Philip,
> >
> > I'm sorry but, although every change here is fine, I cannot ack your patch
> as-
> > is. It shouldn't address so many different issues all at once, according to
> > the best practices in patching and the kernel development rules.
> >
> > I understand that you think that, while you are at the removal of
> "init_rate",
> > why shouldn't I address all other trivial issues at once?
> >
> > Even if the patch is short and it probably doesn't require particular hard
> > effort to review it, that mix-up of different works shouldn't be done,
> mainly
> > because this attitude could potentially lead you to add more and more
> > different work in future patches. Where is the limit? Why not add some more
> > different works next time you find some more problems into the same file/
> > directory?
> >
> > If I were you I'd, at least, prepare a series of two or three patches:
> >
> > 1/3 - Remove init_rate as reported by KTR;
> > 2/3 - Remove unneeded DBG_88E macro;
> > 3/3 - Do some clean-up of rtl8188e_cmd.c;
> >
> > Perhaps patches 2/3 and 3/3 could be merged into one, but I'm not really
> sure.
> >
> > Thanks,
> >
> > Fabio
>
> Furthermore, I forgot to say that the "Subject" should summarize with few
> words the whole work you do and in this case it is not what it does.
>
> Fabio
>
>
>

Dear Fabio,

Thank you for your feedback, I shall prepare a v2 series.

Regards,
Phil
