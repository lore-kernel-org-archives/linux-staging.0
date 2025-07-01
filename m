Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7982F22259D;
	Tue,  1 Jul 2025 09:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751361192; cv=none; b=SzUM1UcYqXlZuGN7qUfrINWOWiu3VolX5Kr1IxMWGVBcPElVobxJLs3slxTB2NMqkjR/zOwcBwWPRZzfPOgSQC2RTMLkhMI+Gu5T9lTTjw+bWBDVq/FQfMb0C2XKVLn5YmF4r3lVEsr6FmSe6u/af/Z3fJi/sDz/zKJFf3Rg3tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751361192; c=relaxed/simple;
	bh=BEBCuL+HEVEQiBaCPZ5XvZuKChav6VO2aoDzCzNOkCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IbuJvC9CI3F6KEfBT2YaEmkZ/ShZ07jq0btdnfSpc0hv6EFkFUeAB3fy/9P4FtNcvjnSUzr+n2C26Siu0fjR7Fi+C8LvWVLKzTp9DHLkFU4k+OdAZz9wFG0k5niazlbEhsrhlKJQgJHGJgRWn6wOFXM1MXTEcWfZYWhdne+yFr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lEJFk6NP; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lEJFk6NP"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32b3b250621so50866051fa.2;
        Tue, 01 Jul 2025 02:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751361188; x=1751965988; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROgPEw9PJSV4rDIb9YQpEctVvh6PzqhiH26Y+jXtSJo=;
        b=lEJFk6NP9qXo5zfDAPLhi0gg8Y3SRoe4/mpPTH+2OhspkVgU4POkEdUNHKUJgj4/Ma
         DQtlrh4+cOdrZh+fxDKWws5xHJ8zYDRy9DVRIIkOYL0mbKj7R9Iq19iZz2U2VdX6TcPW
         RdlKTWpNMhMM9G3bbW273wJKumsFmnr2U8nkke+25EIkkXTgX9BNFm+3PE4YAmk3o89V
         TG46NG8ylKnlt1pGRy+IGuKcKcnWYs+3BMO6xg9unVrtgLmJbexmIR0m283KGeXfamx/
         CWg3hHkR2JlPV2H5R+zbJd2DNyLtGrbOex0gX72QHYHQcC0yI2krybA88QasZG2V/Eev
         Hxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751361188; x=1751965988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ROgPEw9PJSV4rDIb9YQpEctVvh6PzqhiH26Y+jXtSJo=;
        b=PoGXOaa61QXm6ekPbG7aeUWb/BmEy3qBPiCz4bKNwfKXxuF5uSFFtTrHtzBN1glrtc
         mTHmAsSVhoO/mLLrPZ4ihuHgY2OprpTTZdnKYBU+sxBe+x/RLpPFeyio/uxB4c2iK9n6
         Y3BnoIj3O2msTHNmeDJPz4zIywIe6uNZK32Pi8No9FFl2tdAIykfqR3iv+0YQLct6LVe
         yHU5uDbDM2wqf/Fbzpqx7sP5+amB+/qntuDFcYe39VIdb2e+zJsq666kg2nrVVYeqXEl
         oPJr/q9+qgc3dzt8djmOK4nshSwBIIxaCAUoGEosTogmJ1O/05rsrLkgNHt+n67xU2FG
         UCBA==
X-Forwarded-Encrypted: i=1; AJvYcCVwR/SwsoPID+Xi8VXvw+kXceN0P6lMJ7qjAzRsJM/bHT+BdPvFfDsirb7r2opMlN0cAbOjYPy8/ixBve46eA==@lists.linux.dev, AJvYcCWTLdJPN1sC6Mwhjoir+ILacGRUxhgR3i0QDqO+L2TcEVskyC4TttD2dxGs10zGgDhqBRWdnHEuyFgqUP6F6fadOpq6NQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ0VAAt4QLriKHzz23F+1Dx/R6sX0nYT6X8BjbsmsfhWOgWSPv
	RO5oG8cs04mZzy9jqCUhkyCPqequ1e8m77VLlVbAveMfYZSJeyO9uwkPRp5Z2cEormQ6O76dfbq
	m360G1+zcaE1HZTx5rRFM1f4QOMhNwHbG59dBbJ0ALg==
X-Gm-Gg: ASbGncudSJWP+vCtYE+nBm2HqZsjHz83naQcc8d+B1WuzEVNnHduo92C51EjDIQTN1Z
	0WiKStvZaMI9b6Z48VInqw5lO1KG7/cuymTWEDGz6quNAgkdpFjWFyEre7iYLpa9LU2/Q6c3lHj
	Gcvvc4dPZNkktsu4rK+1FN5UJ3xCyGgNS9L2WiGtF5kE2zwglIJXzKkPmFnwrb8KNv0nYRRPvpO
	WpM6dmezqmfs1Y=
X-Google-Smtp-Source: AGHT+IFaRimBXwf+/UEtRyiC+KK+xadzvj9nmalX2Tk87W6sIlFV3Hdmxz/NSxN6EDVUMGJK6IRPijyU9g+dPjzrzUI=
X-Received: by 2002:a05:651c:2205:b0:32b:7614:5745 with SMTP id
 38308e7fff4ca-32cdc4efdf5mr57485841fa.20.1751361188252; Tue, 01 Jul 2025
 02:13:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250628063121.362685-1-pranav.tyagi03@gmail.com> <2025062945-prologue-plutonium-870f@gregkh>
In-Reply-To: <2025062945-prologue-plutonium-870f@gregkh>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Tue, 1 Jul 2025 14:42:57 +0530
X-Gm-Features: Ac12FXwHc8lXS26tySAKuBhdyhXYJyZqD9JrvOV0o15Dkdc9IcQXg0PK4LpxJM4
Message-ID: <CAH4c4j+yh99h3V0Ody5yx8DnC=Ee4J0kbEKL85k366FdTyXSdA@mail.gmail.com>
Subject: Re: [PATCH] greybus: loopback: remove gb_loopback_async_wait_all()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, pure.logic@nexus-software.ie, johan@kernel.org, 
	elder@kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 29, 2025 at 3:17=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sat, Jun 28, 2025 at 12:01:21PM +0530, Pranav Tyagi wrote:
> > Remove redundant gb_loopback_async_wait_all() as connection is disabled
> > at the beginning and no further incoming/outgoing requests are possible=
.
> >
> > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> > ---
> >  drivers/staging/greybus/loopback.c | 7 -------
> >  1 file changed, 7 deletions(-)
> >
> > diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greyb=
us/loopback.c
> > index 1f19323b0e1a..9d0d4308ad25 100644
> > --- a/drivers/staging/greybus/loopback.c
> > +++ b/drivers/staging/greybus/loopback.c
> > @@ -1110,13 +1110,6 @@ static void gb_loopback_disconnect(struct gb_bun=
dle *bundle)
> >       gb_connection_latency_tag_disable(gb->connection);
> >       debugfs_remove(gb->file);
> >
> > -     /*
> > -      * FIXME: gb_loopback_async_wait_all() is redundant now, as conne=
ction
> > -      * is disabled at the beginning and so we can't have any more
> > -      * incoming/outgoing requests.
> > -      */
> > -     gb_loopback_async_wait_all(gb);
>
> How was this tested?  It might be redundant but I don't think you can
> delete this just yet, otherwise we would have done so a long time ago.
>
> And your changelog just says the same thing as this comment, shouldn't
> you write something different?
>
> thanks,
>
> greg k-h

Hi,

Thanks for the feedback. On checking the context, I found the FIXME to
be trivial and build-test the patch. But, it definitely can not guarantee
runtime correctness. I will also try to write better changelogs for future
patches.

Apologies for the noise.

Regards
Pranav Tyagi
