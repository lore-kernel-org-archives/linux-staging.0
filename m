Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7CEDF59
	for <linux-staging@lists.linux.dev>; Fri,  4 Apr 2025 03:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743736613; cv=none; b=k7G6sqYOW7f0Oy/EQTTRgVof+S4XMr7zwRwMPr6Xh5106Bd0kmERTf7rr9fEbQu4GjoPKfl3OqcyIr//CN5phcE3VIEkrZOaxFszIEENm+2A2Y0NhG4WPM11OvViXHIfPcMB1dy2AKR+3M6zZn59nhCjF/TxImUTLFObTlIs9pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743736613; c=relaxed/simple;
	bh=3MXgIml+EW4PElL/Kwn4VTBpv63yRiU0nx0DB63Rm/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=njjhH6IPkNIoHh8e6B87syBSdbUDGJe0FYbKnvcJliW5DmxBrNz9YFdIt72LE/ttRYrbJLqLzseH8ZQPQ/PjKGLgA3C7m0AjvE0VD0jyWsYwh9qKK46/sXLsVDMuzlXVpltJTpmLF35vq06WhrFYnhEjrvNw1PlqIm/lXY8fbDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6xt+29g; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6xt+29g"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4775ccf3e56so28164291cf.0
        for <linux-staging@lists.linux.dev>; Thu, 03 Apr 2025 20:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743736611; x=1744341411; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsSiuImgPZJSIBkA0BbQR6qiZItpPbtmLSDASH6V+tw=;
        b=b6xt+29gucfly7n6N+elqlbBqrZG/nZuUuptx6Bm+kBBQsSMjt+tfvJmkegne3ZM7v
         cC5O63fBXjyMaFu/24bP04k/0OM4/XoQaR2SSzivpdp5k4JkAw8ZdAC8AmaRCmsQ35jQ
         q6KOC9W7WTuLwYWcFvGl4N9Wj8W4GyMkiZ1l7lxjngV9NAHSzr0mm9uDHCuVsKKJETaY
         kGmtqNcfROZ2tOYxOcdlTLOoTGm6btTLcy+zNwLXAd8B6WikGhFI/WFhiEEFB8l/44m4
         xIpDW6JvNM/8Dg1Jixw2hN82XMVkBGL2/G964WH0QL3lwKH0TySz11Jd0kmVDHpKR4u4
         xylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743736611; x=1744341411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IsSiuImgPZJSIBkA0BbQR6qiZItpPbtmLSDASH6V+tw=;
        b=Hv4ncl/3G1+dC2ifhquIrX2Dbz5EyxKgF2nx+3BNryNExhV9yqBFT+m6R5LMcX/HE7
         6jfMf4kk892B8vHd3jkXImEZm+ZOuXfp0o+23QRm31/uMjnCViqGgxBgqNo/aeQHwe2c
         7dI500eBiTm2JWUAKLOfRujMLY9ixSEtE7YILrsRydao6y0R5k3mRIac6f3LH2fXSVs6
         AT4u2G65OwadoZ7vnjU5O4BGOcU6l7C2k5u04XtLJHzsYfhj58mMHgOXvPJs3IFS7cTN
         DPQ0HiUPObdsai4tNx6Z1byUwDFWdod/NszXCBQz38fUGG4K5PpzpY8Ce1WPPqCWywu1
         MmXg==
X-Gm-Message-State: AOJu0YyWd0dPgDENjOoHJdxdIYMtrfAKCTdgggjOkC4qxNwi8yY7K8dP
	eH7Spkz+2ZwN4JFy2Kl7MMVpwjDXo4fS4fm9g0rIykDhrMoIiFmXEFVoUFiJaU3S/WhmpKdO7T0
	00LUSfRHnx/d+a5oe6Sz1CYD9+8ngcBufpCXR+g==
X-Gm-Gg: ASbGncuZhpKLJsYmcEdYWspSKHmKW8kq3mYjuzISPbwIGg2hlz9YjlDIyq7qssVQmeb
	UGgdLXKMSNGBCUNpC4talUNFHtTSEDG9hm98pT+ot2NM/Ko5p73UhxGrHmhZKM1jU8EYOsk4ZS8
	Tyt5CzYX39J6UQ/wpw7v5uEILVYUai25Z6LuKwPQgaEJaf1o9Z1vnFE4Dz
X-Google-Smtp-Source: AGHT+IGpiTixZuIRs+kppE3urPHfFJtlPJdUN9hFNOYrJjnOkr1+zSXc2rpdSynGOjeQZuL+Wsd27x7L1AuRkS0L988=
X-Received: by 2002:a05:622a:143:b0:474:f5fb:b11a with SMTP id
 d75a77b69052e-47924c30da0mr21099711cf.3.1743736610677; Thu, 03 Apr 2025
 20:16:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250402124207.5024-1-gshahrouzi@gmail.com> <2025040350-footnote-fanciness-50ac@gregkh>
 <CAKUZ0zLTCw3HDxmyiPD14TxQk-g90h=-7=e1Zp9ucDXQosPB2Q@mail.gmail.com>
In-Reply-To: <CAKUZ0zLTCw3HDxmyiPD14TxQk-g90h=-7=e1Zp9ucDXQosPB2Q@mail.gmail.com>
From: Gabriel <gshahrouzi@gmail.com>
Date: Thu, 3 Apr 2025 23:15:00 -0400
X-Gm-Features: AQ5f1JpalCZLl5SlsRZLQ88v9o549GZADtvsvlsr_FcvtanpDT1fJqMtiuQkCSo
Message-ID: <CAKUZ0z+iL1TOLbddt5qbqNb_kAG5Ltta7Kw97wO0_S91DrQ8hw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: Remove trailing whitespace
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, philipp.g.hortmann@gmail.com, 
	eamanu@riseup.net, linux-kernel@vger.kernel.org, 
	kernelmentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 11:03=E2=80=AFPM Gabriel <gshahrouzi@gmail.com> wrot=
e:
>
> On Thu, Apr 3, 2025 at 10:22=E2=80=AFAM Greg KH <gregkh@linuxfoundation.o=
rg> wrote:
> >
> > On Wed, Apr 02, 2025 at 08:42:07AM -0400, Gabriel Shahrouzi wrote:
> > > Remove trailing whitespace to comply with kernel coding style.
> > >
> > > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > > ---
> > > Changes in v2:
> > >       - Resend using git send-email to fix formatting issues in the e=
mail body.
> > > ---
> > >  drivers/staging/rtl8723bs/include/hal_pwr_seq.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git drivers/staging/rtl8723bs/include/hal_pwr_seq.h drivers/st=
aging/rtl8723bs/include/hal_pwr_seq.h
> > > index b93d74a5b9a5..48bf7f66a06e 100644
> > > --- drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> > > +++ drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> >
> > This wasn't made with git, was it?  You are "one" indent level off, the
> > diff should say:
> Interesting. Not entirely certain how this happened. Since it was from
> an earlier commit I made, I rebased it, amended the changes, and then
> formatted another patch using git. Apparently one of my other patches
> for an earlier version had the same problem but the subsequent version
> has the correct indent.
> >
> > --- a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> > +++ b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> >
> > here, right?
> Yes.
> >
> > Anyway, because of that, this does not apply to the tree at all :(
> >
> > Please fix and send a v3.
> Got it.
> >
> > thanks,
> >
> > greg k-h
>
> On Thu, Apr 3, 2025 at 10:22=E2=80=AFAM Greg KH <gregkh@linuxfoundation.o=
rg> wrote:
> >
> > On Wed, Apr 02, 2025 at 08:42:07AM -0400, Gabriel Shahrouzi wrote:
> > > Remove trailing whitespace to comply with kernel coding style.
> > >
> > > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > > ---
> > > Changes in v2:
> > >       - Resend using git send-email to fix formatting issues in email=
 body.
> > > ---
> > >  drivers/staging/rtl8723bs/include/hal_pwr_seq.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git drivers/staging/rtl8723bs/include/hal_pwr_seq.h drivers/st=
aging/rtl8723bs/include/hal_pwr_seq.h
> > > index b93d74a5b9a5..48bf7f66a06e 100644
> > > --- drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> > > +++ drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> >
> > This wasn't made with git, was it?  You are "one" indent level off, the
> > diff should say:
> >
> > --- a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> > +++ b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> >
> > here, right?
> >
> > Anyway, because of that, this does not apply to the tree at all :(
> >
> > Please fix and send a v3.
> >
> > thanks,
> >
> > greg k-h
Apologies for the duplicate post. I initially replied only to one
person by accident and have resent it using 'reply all'
