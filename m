Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D642D4C62B
	for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 02:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729133457; cv=none; b=QlpEhTq8R/8p4bc1BvqKTBOHMnhdeQq4KzOlPPTCQRcjkxU/oPoq7V+ESy1P0LAhH/9gRW+B1uD3VUjNeQTcS5xdHhOug+Xl5s81/YrAvqSB9Rrj0IWQ2kCsxkrRUiZ9WC+0awfK9Q+RaGoNDd/lGIQR8JTQhAE8hj861f8zqPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729133457; c=relaxed/simple;
	bh=Zdwf5BgnTpOZ84F4YflB1huMvcyKYRcc7W+IWgVAZ7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LLGqqeopnUsQelDUDDV90lpnEbw0cqmTmMXsNhOJNjAHFfxhzEbc6+heFliXTnU5AGavg6M7MMzPh9jp8l9baX3kll6A03+bPMFKy9MwybYlFiIxRVxjMRwrh9lqYht5mO6SE1+EInf19ExGebXbe5XuZ5fBe/nzglbHX/Ar86Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=IeHEPGbl; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="IeHEPGbl"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c9693dc739so629139a12.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 19:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729133452; x=1729738252; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIbDMl8gjW1pXQSxx+4reNTL+NZ/14g/xdSwZlsXFVE=;
        b=IeHEPGblO/mYyqQgx94YqBY7bIUwIf5jjP/w+b9lwFx6hz2+2QsJ0qmMWGV9EZ8zfe
         8ooeKK+BHW1BiEg7zL/qWwu+Tu7E/Wzib0ZY4U3WZHUAYhUkWvJC1cuia6Upwc1kki/F
         SoFRNAo5PWmk9MPl5htvwU4uv4dwFiFPtGBqmAvLgETmUixazdu3ewymenPqd7auLn48
         A/ZWT547ZeIMpVzUdUdcyFoItFh1ojGlcI5gqfKKu9nzRuDDtXO+uqQsoxUF+zQN7fof
         zuw6Vd1Nwj9xKrE2jKHgVroBElkGh2Y/XkxdF7mVb6ZarR7+Q5pbfEp9rwHeaBr4lfcw
         MHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729133452; x=1729738252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIbDMl8gjW1pXQSxx+4reNTL+NZ/14g/xdSwZlsXFVE=;
        b=osUTrvp/gYCaZbQ7sCccu4PnAWy5Hvlf5rRhzDN2znXCO9S/oxD4a1WvY+zguLexQ+
         cSY/1FWFiF4oO3PPON56fVTBfqHO5tTMdqL3DYtI4Mn7UgccvUsWyimusmfP2z86ROxa
         VsOui3PlZCzhgusfK+miLm8xwx2gcK25cla8SRYIv8mG8bMFg7EMvMvUpCpxtltjqM4O
         iLz7fr56fiWg93L2n1rP5+7UAm1iJU4u9VtMj5IrReCGtOVZntDigH1A+0Jjl2Em3Owf
         Agl2gedpgk52aso+wt6+/K8+rVtfHXKVbyIuZb0hGoLn4ZLQgp1nIdcEXsq/YW8eW+Qb
         FrZA==
X-Forwarded-Encrypted: i=1; AJvYcCU8ckZqqi/jdp+Yvvb0KzBtU6z/pdWZ3bd7mb+ZhbZ78ocqMCZ0Vvi1zVcVq7wBhtbKSjb+6x7cSGIv+l6Y@lists.linux.dev
X-Gm-Message-State: AOJu0Yw05QlvJ2PuBEIbJPkT9EoJdcSwcuZ/qWXErg8fvpmKxMynad2y
	MfgggaRyvReBilloiwRnHxO78H0/nAYxqyjUuiLfc4M8/wKPvxUxvit4JfniMw8au/SXklR7jRw
	M4H+Sko32nqZh0MtgabXOXY8wJjaSL2bIdNaEaw==
X-Google-Smtp-Source: AGHT+IGZEg0rLJYeX//oZKYgP/RbQfMH2yo0BvVbMr1srtnJ+sdvJuPzjemXqjvKuUeHeLhINhFyM+fo0g3gBQ4Hc2M=
X-Received: by 2002:a05:6402:13c3:b0:5c9:218d:7071 with SMTP id
 4fb4d7f45d1cf-5c95ac1776cmr13943290a12.20.1729133451937; Wed, 16 Oct 2024
 19:50:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241016075319.4092-1-everestkc@everestkc.com.np>
 <2024101654-jasmine-ransack-7190@gregkh> <CAEO-vhGuJUdbBhchbga33TNWvZXTXHWbd4=M8xeWkHAi1rnw2g@mail.gmail.com>
 <2024101625-activate-gluten-3547@gregkh>
In-Reply-To: <2024101625-activate-gluten-3547@gregkh>
From: "Everest K.C." <everestkc@everestkc.com.np>
Date: Wed, 16 Oct 2024 20:50:40 -0600
Message-ID: <CAEO-vhGM8_x4Teqt7D8d=3KJcLPAgd2rWpkEDsZw=h0cS_7BLQ@mail.gmail.com>
Subject: Re: [PATCH V2] staging: gpib: Remove a dead condition in if statement
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dpenkler@gmail.com, skhan@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 9:12=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Oct 16, 2024 at 06:54:00AM -0600, Everest K.C. wrote:
> > On Wed, Oct 16, 2024 at 2:04=E2=80=AFAM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
> > > On Wed, Oct 16, 2024 at 01:53:18AM -0600, Everest K.C. wrote:
> > > > The variable `residue` is an unsigned int, also the function
> > > > `fluke_get_dma_residue` returns an unsigned int. The value of
> > > > an unsigned int can only be 0 at minimum.
> > > > The less-than-zero comparison can never be true.
> > > > Fix it by removing the dead condition in the if statement.
> > > >
> > > > This issue was reported by Coverity Scan.
> > > > Report:
> > > > CID 1600782: (#1 of 1): Macro compares unsigned to 0 (NO_EFFECT)
> > > > unsigned_compare: This less-than-zero comparison of an unsigned val=
ue
> > > > is never true. residue < 0U.
> > > >
> > > > Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> > > > ---
> > > > V1 -> V2: - Fixed typo of comparison in changelog
> > > >           - Removed Fixes tag
> > > >
> > > >  drivers/staging/gpib/eastwood/fluke_gpib.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/s=
taging/gpib/eastwood/fluke_gpib.c
> > > > index f9f149db222d..51b4f9891a34 100644
> > > > --- a/drivers/staging/gpib/eastwood/fluke_gpib.c
> > > > +++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
> > > > @@ -644,7 +644,7 @@ static int fluke_dma_read(gpib_board_t *board, =
uint8_t *buffer,
> > > >        */
> > > >       usleep_range(10, 15);
> > > >       residue =3D fluke_get_dma_residue(e_priv->dma_channel, dma_co=
okie);
> > > > -     if (WARN_ON_ONCE(residue > length || residue < 0))
> > > > +     if (WARN_ON_ONCE(residue > length))
> > >
> > > No, this is incorrect, now we never notice is the call to
> > > fluke_get_dma_residue() has failed.  Please fix that bug instead (hin=
t,
> > > Covertity is giving you a pointer to where something might be wrong, =
but
> > > this change is NOT how to fix it.)
> > I need a little guidance here.
> > My best guess to fix the bug would be to make fluke_get_dma_residue()
> > return an int instead of unsigned int or size_t. But theoretically the
> > maximum value of residue can be UINT_MAX, and casting it to int will
> > result in a negative number, which in turn will cause  the error check
> > condition to evaluate to true.
>
> Look at the code to see what it does.
>
> > The best solution I see would be to make fluke_get_dma_residue() return
> > an int (-1 for error and 0 for success). Then pass the address of resid=
ue
> > reference to fluke_get_dma_residue() to be updated.
> > Am I on the right track ?
>
> Close, yes.  "-1" is not a valid error, so that needs to be fixed at the
> least here, as it's obviously not returning an error that gets caught
> today :)
Noted. Thank you very much.
I have a question though. Since, the file I had previously fixed (which
was incorrect) and the file I now need to fix are different. Should I creat=
e
a new patch that would be of version 1, or should I send a V2 ?
I went through the "Submitting patches" documentation but it does not
clearly explain whether I need to send a new patch or the revision ?
> good luck!
>
> greg k-h
Thanks,
Everest K.C.
