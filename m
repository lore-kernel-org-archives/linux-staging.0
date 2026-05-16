Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA7D2777F3
	for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 15:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778946831; cv=pass; b=Gpu/g+gQmO/3LZVNxJaARkJyGeVAXO5zNbgHKvKNbELrTpWGT4zfkPrnGJVDN/U/8n2YyQM5Xm2t7kLbISxCHJ8w1EwHr9Qy3FmXsDdn+bbuZNtX7hwVLc4f8FX7NpNRHfvdH50QxVi7pDyHzjJzo4PS/etQhcNG0C8NTzjcKUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778946831; c=relaxed/simple;
	bh=SqjTsgacc+GYEdFzVe19LUCP3zfphqkpwn5I1jeJqOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BLWtjsH0PxJSKFKaI8zKxU1B/faznYWNwGIZN1ieE1tewuTy+DCEpygehjoY3Bm6VXvA7EKa/ciw7MDlcrj48n7Eu34DTQgwe057/xhgP8Gcudc66ZhcpOwVELSO7ER/pbBLtlSyqwHzsqE8xHllc7QYVHrOo20auxxB0aF58PY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmNKduO6; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmNKduO6"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-67fd8befac7so2480315a12.2
        for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 08:53:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778946828; cv=none;
        d=google.com; s=arc-20240605;
        b=Kpb4UK/ip+ebAuKP7fmgCRbFXFLTwiwkRxgoOAxz48Yr2BcVk/TFoMyWqkpCJOntnO
         KeOKpGmFwg7AeKHvS/FCtGnJlAyyi4aP3YoL5cmgNV/ACDYxgGNFP3R7BHgfzxiyEbp2
         b/w//bR4A7B/Ivyc1FqKwMJrb4IgCRPovsZiQFwKew7mhNvlXDQ89GN4FDNcmH4dLbYx
         Kb6yBAungEu12KfhK2fl2mhdXtXkPHNUFfA5FzvPMfeC+myfm8qRS47Jbhe68h9BulYA
         V4iwK2/SsioCUGFXbF+8Kcfm0aklHtSISDszR9T9wxBcKsZq378+isKBBY2a1MWllx1m
         hgPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yCN52L2NmBlzlxSl7NrbPFOjQlrOM/A7eQfXS33JlZ0=;
        fh=rTV2zpgVckS4maaU0cvPpJGsch/UVDg1qn2+5GZh3TE=;
        b=B3Bslr2nCIh/CNXDA8QSEYALwo8S49IN2QYUf1xy72Cb8x1iGy1V9kbOlDzmKIKj21
         mJW7PN8sCEY5sNDnCxHcbJqV80MQQ6EOMg1hfxt9/CGkRgKCt8FTDo/F3tofA3sbn60L
         crsUSCHFowuHKQmwLF4qPewtFOWY3DO8PAreP4hmNbTw+TAg0H3UwlwuSEL1LenP/bzr
         KkmJFBd+BDRe8cSExraAbaZBwH/mKBt4Ww80eWzXdzbfh/0pzp9QrdTUhvF+S8i0hmSq
         FVaTnQKl/ZHwJ8Ex8Q326So5dZEEpJHcsRDr2OQzrRHKDCMQamoi5/w4axLvG3NZdPgz
         yXxg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778946828; x=1779551628; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCN52L2NmBlzlxSl7NrbPFOjQlrOM/A7eQfXS33JlZ0=;
        b=OmNKduO6jBjufJd8f06COTcjDNZYei4kf0Qce9Rnac3h1LApfUpsmZyzhCaYINSwrW
         wL1nWfEO+hD3fDQ4+BalCIYTfM+8msnstOj1jOHjdbX9tA7lwnvZC513nii7enjud6rB
         UHqZbXXv+qGfJdqk+aCj1aydC3e0/VXFjt0Z7uNCtCnzMDHKPu/mmTUF6oe6PAIdlEks
         o+ApR1BUOfEekGjbShbIsFBrQw6xKFQw9Lx10xq8EIouvgrWmer3mEv3wmUwAEWJRo0y
         9urhxscL+jaf/zdTk+oMqsOVlz5T6lN97ZjKBO1rfZeNERr5rne6krx3gtJbRVxoFJs5
         fZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778946828; x=1779551628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yCN52L2NmBlzlxSl7NrbPFOjQlrOM/A7eQfXS33JlZ0=;
        b=FJd6OIJkeIqz3MoD0lKFQPogvunBQdy2u+8YsfJF5zuIUxyhhYeDXNhOrQK8BUmzNP
         uTVUeKvyGZn2NI/oFBhdN7wcl6mxjZB5cnlWsfy3WrH/bbxVHS6vylxcRAIigSvlAxZC
         E87dzFWUuvinAhRPVswdkzDg67Py8cg5svy53eVIhccjCqTKnm0cKlfhelKOtn1c5Hw8
         lfYyO6clxoRyxxIs2xO6zrVUNn/c5NjiJkE99tEc3a+/RNubbKjWxgCOmvzccGvVT9mT
         aNM28lPjmVK6RhOsNSHNzcT2/93J4ReE5MlIgYK8MHjASLzuxv74XBdpZXVCC9o3eI05
         D9Fw==
X-Gm-Message-State: AOJu0Yxve8qrfInnVyMgnFPVAX19/vney7StxuZJxQDIpFGe7gAo86XU
	sm+xgkwynfhoybOB7p6yEHksOhmAEOJ9acwC1rD8L1sJfNI9n/70wVUAeMUErFHMdjw34GGZRZW
	3h4CCQy3TWhiMhpRKLs8t65qaVsxBqXBQqvLM
X-Gm-Gg: Acq92OFshwCvx+JXyDuUytydlZyi+4dgxiMFtQfdcofjRxPJ5qCw/xki52Wqo0HM6ws
	V6Mwu5k51veWczFsxNhAvxrlWB/jrBV7Eqd34warWf5hdO2teJPvUYuNGyH6vcObuljIyoNwQIV
	8Cs5nK4TlprER0mLBu6S7uIpMJGt38JhgqHxh8tDMle8Utcod2EEg5UYJP/pywJy0NV+onaEjBc
	RcUPIcYYz32d3QCuqNnyzBPGvVYZ5hrpTqIABZy/5xiFN7YFFy8V1DM7Kgn3Pk/eeL/wessK0U/
	nvp5ElZZmmzwdDDbqTdHcJq1VWkLjvM1AWFxrEkR/saQt4sBEp0nQ7kRTDKQNTifu6ZzSG8z+gG
	JV17X43nd
X-Received: by 2002:a05:6402:4342:b0:672:bdaa:3e75 with SMTP id
 4fb4d7f45d1cf-683bcc9e48fmr4956411a12.9.1778946828254; Sat, 16 May 2026
 08:53:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516095103.12727-1-mokshpanicker.7@gmail.com>
 <20260516095103.12727-2-mokshpanicker.7@gmail.com> <aghEK3CCbfhYQ-T8@stanley.mountain>
 <CAK0z5OmNfPf_zS0RpmNBJtusN_Mxavs7UeUOjV7j7wrqb6hwow@mail.gmail.com>
In-Reply-To: <CAK0z5OmNfPf_zS0RpmNBJtusN_Mxavs7UeUOjV7j7wrqb6hwow@mail.gmail.com>
From: Moksh Panicker <mokshpanicker.7@gmail.com>
Date: Sat, 16 May 2026 15:53:35 +0000
X-Gm-Features: AVHnY4L6OjZMrhvfM5IqfT2M-1jpHpbaFlE_CebeCk-XkD0AvjuzCI-ML1nKg1E
Message-ID: <CAK0z5OnertKZVyXjP5PX194PgyUfOmGNoqyEDmhExM8=y313xg@mail.gmail.com>
Subject: Re: [PATCH 2/4] staging: rtl8723bs: add braces to else clause in rtw_efuse.c
To: Dan Carpenter <error27@gmail.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI Dan,
I have made sure to compile test it before submitting.

Moksh

On Sat, May 16, 2026 at 11:39=E2=80=AFAM Moksh Panicker
<mokshpanicker.7@gmail.com> wrote:
>
> Hi Dan,
>
> Apologies for sending it twice. That was due to a mistake in my
> send workflow which I have since corrected. I will make sure to
> compile test before submitting future patches.
>
> Moksh
>
>
> On Sat, May 16, 2026 at 10:17=E2=80=AFAM Dan Carpenter <error27@gmail.com=
> wrote:
> >
> > On Sat, May 16, 2026 at 09:51:02AM +0000, Moksh Panicker wrote:
> > > Add missing braces to the else clause to satisfy the coding style
> > > requirement that both arms of an if/else statement use braces.
> > >
> > > Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
> > > ---
> > >  drivers/staging/rtl8723bs/core/rtw_efuse.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/sta=
ging/rtl8723bs/core/rtw_efuse.c
> > > index 987d05816c5c..2be74f2d4ac8 100644
> > > --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> > > +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> > > @@ -73,7 +73,7 @@ u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u=
16 Address)
> > >                               break;
> > >               }
> > >               return rtw_read8(Adapter, EFUSE_CTRL);
> > > -     } else
> > > +     } else {
> > >               return 0xFF;
> > >
> > >  } /* rtw_efuse_read_1_byte */
> >
> > Always compile test your code.  Also why did you send this patch
> > twice?
> >
> > regards,
> > dan carpenter
> >
