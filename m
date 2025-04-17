Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1040B2566FD;
	Thu, 17 Apr 2025 17:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744910254; cv=none; b=Fpm9TSVaEeUdw2Lqvh1DO5I/NxmsHFADoZGGRExaoARG8SGgLJt6YDJwGCTDOuZsCqW3MoIzvXMd6MeeOnJ5DoFE2WCl0zIYNjgFDUtAw/C8u0RpJkCKoJmBd9LmdrUTBIVoNGPiU/A4EQYiAFO80vYJQr3S5B9pMNX9lD5Cul4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744910254; c=relaxed/simple;
	bh=wx499ycm9iMUeg9/XtG7M5uzQ8E1UILvPtuJmr0RsHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VacDI64ORDFs7OSgABedGfjIWR6S30jjASvyLjl1PEbxUV0laDGZ682hbB+Otauyz63pNPbFjYct60rZ7yEPM/d9aS+y7LhajdKvtFejO7p3fXUt+Y0xel1LUxpsnar+8HpQnCJgSY4GjH0dQebOZB1+lQB3WXMzZu9fLtQRlGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/JYlg32; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/JYlg32"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-477296dce8dso9592621cf.3;
        Thu, 17 Apr 2025 10:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744910252; x=1745515052; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHZpLc6rfjTxqfskBHqOLWs86EpAqWAQaDT3lSIQ988=;
        b=H/JYlg32RnbTLKkvZql+DZdvB53v1qHj9bVURuUJ71aOJ9XZkWweR2vidLpebO5B9d
         zxhI0gpGJRLPLcYA7wLJ3WoY/DuHib7aKJcsvCt6tKb/Td+61AiS2IHvyReeoisdFTK0
         UEEuFWrrykyZKOxhiID78BOR79m9n/n+OqGdY/2GwGaPuU7ipK1/awNpe1le49O9cSwl
         ycxnPIC+qGCPzR2sxqno3Y99e/WlZz63PRxjcW/ru6VqiZpyeK3NUA1wScREeIidr3UY
         jP0H7/VMnamxwz5Rmyei1zp0IfPw9baTLUsW+XAmM718dTNGzHG4LQyj7gf/950fvOkw
         0ARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744910252; x=1745515052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHZpLc6rfjTxqfskBHqOLWs86EpAqWAQaDT3lSIQ988=;
        b=GRu7u+GlcEFmHIT6s7bOnk/GSQOuO4eEA1mT9BtKIMo0CAS28mAa7DCqr41X6rOZHF
         IU4KR0E//2/5i7g/ggT9pyteHLIXoQSy0LloML6OWraNY4Kydkf2jtA5D4N6TEL427rC
         iQPf25au+5w763nDuKy8eLCZO7/7mWMHzamTlv16zXkw0c7WweQlUMymzMh+1I3KC9+I
         h4f4An0GK4pD+8MtNUiOMcm4tGOoge9Qnd461BonFeK3vtVHrg/Tfgurr6e8mCSPFD04
         uCgcdvLs17WIroY+YublcI5AClA0onNJOL0Tqso1WEsk9pAqqY6iXC18HGY5idM6phhx
         B6IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnDKBP1tpCG+v75fn6/oIyU5AtKw0Dwb+vjO1nByDU+nhLivjfegUrA/Z9HNWZ0tZ9prUI0KU+3U5V8tLjTQ==@lists.linux.dev, AJvYcCXW/PLFTeg0RDTWGhwhXzlwMSTmxJ9orqVe9tWmPcpu8jRK0fY8ItIF95HccVKIZS+3Ctt7pRn3tZGfiRDnRaPee5DZ8g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyytUzED7r8XJJIpCXFili/w/OcMJ09G5/pQjzNXB3IHN+tPLAu
	3p0rZbum7gUhCxHv8VuUP79pNGRXLXjmv42+KL6aphQ2gNtM3j5cVnzwiro9w57EQZ/9+Y9rZLE
	0bWP7Fr7MG8vX3U/Kq3Wm8dLj0tWpW5KZpuk=
X-Gm-Gg: ASbGnctV61dClsCtcDAfk/rx2XIAAW8+wqBxePwfatA3kRRHBahXGv8L8CQ4KM8O5ez
	GReHEuwX0eMMUvJ4Bc2GdYAgeIvMpbqEtypMynlmwoFTqdPAGPQxrrUNYM7Ljl1YE892kaEA0PL
	Iz1sJS5+LkcWoeDQAFc39KXcQ0hSfkeBrkJk6T+TyAHbPq50FKQhUw9A==
X-Google-Smtp-Source: AGHT+IHrN1LAyEaWz4RcHr4w32yDhY2iO7WSexBVoxKjujo9K/rZ/NeNuZdLD3gLh+PjbY6xZ/zuCbgGubE4rAQomjI=
X-Received: by 2002:ac8:7d4b:0:b0:475:16db:b911 with SMTP id
 d75a77b69052e-47ae9ef2e3cmr6254201cf.52.1744910251706; Thu, 17 Apr 2025
 10:17:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250417143220.572261-1-gshahrouzi@gmail.com> <56edfb88d3f31939fb343149bfad436f24671f9d.camel@posteo.net>
 <2cc70f19c1b001ea7f2cf0632618d060f69faef0.camel@posteo.net>
In-Reply-To: <2cc70f19c1b001ea7f2cf0632618d060f69faef0.camel@posteo.net>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Thu, 17 Apr 2025 13:17:21 -0400
X-Gm-Features: ATxdqUFI_-gN5dJMaRrIIgFMyeycwmxLkVpzAmG56fSWNPKwN0smSUOrphU_NmU
Message-ID: <CAKUZ0zK58DgEN6C9U34dyxrVuoq3PoQFQ1_O0ve4GQYy+bUJOA@mail.gmail.com>
Subject: Re: [PATCH] iio: frequency:: Remove unused parameter from data documentation
To: Charalampos Mitrodimas <charmitro@posteo.net>
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 11:57=E2=80=AFAM Charalampos Mitrodimas
<charmitro@posteo.net> wrote:
>
> On Thu, 2025-04-17 at 15:53 +0000, Charalampos Mitrodimas wrote:
> > On Thu, 2025-04-17 at 10:32 -0400, Gabriel Shahrouzi wrote:
> > > The AD9832 driver uses the Common Clock Framework (CCF) to obtain
> > > the
> > > master clock (MCLK) frequency rather than relying on a frequency
> > > value
> > > passed from platform data.
> > >
> > > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > > ---
> > >  drivers/staging/iio/frequency/ad9832.h | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/drivers/staging/iio/frequency/ad9832.h
> > > b/drivers/staging/iio/frequency/ad9832.h
> > > index 98dfbd9289ab8..d0d840edb8d27 100644
> > > --- a/drivers/staging/iio/frequency/ad9832.h
> > > +++ b/drivers/staging/iio/frequency/ad9832.h
> > > @@ -13,7 +13,6 @@
> > >
> > >  /**
> > >   * struct ad9832_platform_data - platform specific information
> > > - * @mclk:              master clock in Hz
> >
> > Hi Gabriel,
> >
> > This seems to be a leftover from
> > 566564e80b0ed23ffa4c40f7ad4224bf3327053a ("staging: iio: ad9832: use
> > clock framework for clock reference")
Ah ok. I will include this in the body as a reference. I guess for
small clean up patches like this, they would have been most likely to
be included in a larger patch that covered other changes but
forgotten. In this case, should they be referenced?
>
> That said, a Fixes: tag might be helpful?
>
> >
> >
> >
> > >   * @freq0:             power up freq0 tuning word in Hz
> > >   * @freq1:             power up freq1 tuning word in Hz
> > >   * @phase0:            power up phase0 value [0..4095] correlates
> > > with 0..2PI
> >
> >
>
