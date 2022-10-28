Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465557B;
	Fri, 28 Oct 2022 04:56:59 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id y25so1435107ual.2;
        Thu, 27 Oct 2022 21:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HwmBRA+APmiXYQZg1tBoj+t+gqf2adSus7ddCo9oLb8=;
        b=aqK2XIPjlDLtOlNEGgLWQWnUPiTd1vIjnrR0nXxR8DN8msOgby2Ts6ShJhtqDf5IST
         TCGVfCOZhmOK2GoyJ0HnhVDqi1xOrmvWs/GeM6mMORLjIGgsst45LAdZr2rhJ4Bmb6XH
         s1Ka+rF7jG6DpxMrzH4ZL3lzP5k5PWSr8FlTlCCDb+lL0lA2agVyiT8bN1/dvXN9J+yz
         eT2tP3RO8XRggB9xUK6wm7wRyJ6dpCAm5E9VYvzNR9ZZpgRr2vJ0Y51jsuQqeiIdp0kF
         e60t5JJXEKqYYIW2tfAdk5kx/yv+gFaKzOD6XiPLGhjV9gZuYC68a9GnT5FgOOzqczZU
         lzXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HwmBRA+APmiXYQZg1tBoj+t+gqf2adSus7ddCo9oLb8=;
        b=3Fh0+mrclivmGhsLXbFTDZVtKJqGRiQCKsWAGaJUspQCZ9FbAsZioTdMU9CoIRdK8V
         CzZMaLvUfwEGRjBdBlRaW+BV7tI+Vt10gl1tH8KgTWj658qTVLGnahyeEB2zLJX3qtz5
         o6ivtg+fjfMOPqpNl+QO1v9QgtVc0XzM3ilxxppGIVquoxW0OFVU+N2pUjlkoisU1D1P
         fGF80xmSq3q8cCZVI/yp+FetJVHsyaktAG/56sf2zTfM7RwNI9vKBW+7p9u/L7SuUI1s
         p7uuxPJL9LLIN1jdq0jeK26ntfp2DK6v0Fhpzh6XGj2Dw6e67Ym24xxgGjPGXYHY/lMb
         HbwA==
X-Gm-Message-State: ACrzQf0KdPbSLU4oZaiz6QNxoZefSFEb3qe+vOSKTIcj8X8Ti6C6aPPR
	Yi3bwYVWNLxUy30Uxw8ZkG1aWVDR/iOUMFu1Juo=
X-Google-Smtp-Source: AMsMyM4qFN7TWztijVLg7jQodkESQRKvJCa/EbYFVcPPPR4p6coV5T8DX8gRYojFd2IWHg751skQF85nzYEKQjun/u0=
X-Received: by 2002:ab0:25d4:0:b0:3c1:c353:31cb with SMTP id
 y20-20020ab025d4000000b003c1c35331cbmr30171453uan.63.1666933018093; Thu, 27
 Oct 2022 21:56:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221026132838.GA44037@rdm> <20221026171430.GA5592@nam-dell> <Y1o5mktrnE5rbtCO@kadam>
In-Reply-To: <Y1o5mktrnE5rbtCO@kadam>
From: jovial umwari <umwarijovial@gmail.com>
Date: Fri, 28 Oct 2022 07:56:46 +0300
Message-ID: <CAMk1CBNwM3XFPyHVfBnE0K4XWmGX_ZwzBV-sns6Nj7Yutb4YtA@mail.gmail.com>
Subject: Re: [PATCH] Fixed[ERROR:trailing whitespace and braces around scalar initializer]
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Nam Cao <namcaov@gmail.com>, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

well for the start it was not giving an error but after  fixing blank
lines  that is when i saw that
Thank you for the hint i  fixed  it

On Thu, 27 Oct 2022 at 10:56, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Wed, Oct 26, 2022 at 07:14:34PM +0200, Nam Cao wrote:
> > On Wed, Oct 26, 2022 at 04:28:38PM +0300, UMWARI JOVIAL wrote:
> > > Using the checkpatch.pl script, found the below errors and  fixed
> > > ERROR: trailing whitespace
> > > CHECK: Please don't use multiple blank lines
> > > warning: braces around scalar initializer
> > >
> > > Signed-off-by: UMWARI JOVIAL <umwarijovial@gmail.com>
> > > ---
> > >  drivers/staging/most/dim2/dim2.c | 2 --
> > >  1 file changed, 2 deletions(-)
> > >
> > > diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
> > > index 7a5f80e637a0..28259ce05024 100644
> > > --- a/drivers/staging/most/dim2/dim2.c
> > > +++ b/drivers/staging/most/dim2/dim2.c
> > > @@ -987,7 +987,6 @@ static int rcar_gen2_enable(struct platform_device *pdev)
> > >             writel(0x04, dev->io_base + 0x600);
> > >     }
> > >
> > > -
> > >     /* BBCR = 0b11 */
> > >     writel(0x03, dev->io_base + 0x500);
> > >     writel(0x0002FF02, dev->io_base + 0x508);
> > > @@ -1084,7 +1083,6 @@ static const struct of_device_id dim2_of_match[] = {
> > >     {
> > >             .compatible = "xlnx,axi4-os62420_6pin-1.00.a",
> > >     },
> > > -   {},
> >
> > I'm no expert, but this looks like a null terminator and probably
> > should not be removed.
>
> You're absolutely correct.  Also I tried to see why checkpatch.pl was
> printing an error for this but it doesn't print an error for me.
>
> regards,
> dan carpenter
>
