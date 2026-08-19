Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336D420010A
	for <linux-staging@lists.linux.dev>; Wed, 19 Aug 2026 18:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787163669; cv=none; b=Da3Gxl99R9Nbk7nv6IHAXlJ6pkB0KaM2g1uIpjkxA+YGJx2QwzePEH/2FdaJgjRX4PZzYYC4HXKcwrsS6OfBFouinqmHqU0vbpkQilOQVCtJcbF1img5mnYLOWFFD4NaK0cE628VtYl6qcWmjZEjklKeeTcQIQ42UfhFrbcJRwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787163669; c=relaxed/simple;
	bh=oVU0lu10u2nFA79Yz33CePdMJP68sQJhCqhyzyHCuvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOzgc/PigY/PUW9xSaO6al/+gmFG6k+qU+a3qgTbpd2mEIjdFPhPgjLjcDi+/MPiFlOZew00ZJXGFOwEJlyS/P2kRBthL73K1uaXMaP0Xvx4oiYBZY4fKqix6ffghkfZUOVeFWENnCSoMEj4lX5ydaPo2vCRyICbH4OOSE4/L8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MrredZMs; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MrredZMs"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a374bea882so2465982a12.1
        for <linux-staging@lists.linux.dev>; Wed, 19 Aug 2026 11:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787163666; x=1787768466; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hThuAHpiuNPzFZaRiSmIoF888oHhxzPaNMpB0afArQ8=;
        b=MrredZMsWWxaI09wm47Pcw6seeygBOHOOhNUCfJeE9ULZxaokk+5Djj1QTltudDnb0
         qO6LdENNT/2Ebw0qreWiK0ukepCdJcTeollG4Dqa5pbA3wVaVwQyG9h3DNOA78tHe+zk
         dx6ynCDReW0bR7EmgKKcllMzIoFiIoUH9NLqVbIC4SlBuuBxZJ4nVHWG0EKWbu67zZDz
         a8YEGEiSMWepr2qyJwOt4CW4+lcn44FF2m8M8xzngu2To4Zijcnfuj/ENjiXjHZ88cuQ
         WMUJW6kEME+P11U+/nGDfwoUerFwjoJgfGn0oPIlTxCLHnvcBkF09T2enPTW8XhfRM0n
         09aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787163666; x=1787768466;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hThuAHpiuNPzFZaRiSmIoF888oHhxzPaNMpB0afArQ8=;
        b=LcPU5RHEzaGHkrjtXgQkc5PBrewEI2CZVyJBJdjcHyexKviul5CFncQSz25EFNcCPR
         WELqR/w+rr4tSeV8MdflLgoPF6UVHsWijmu3nv9JLaV3Mdvbn0XXsdn0yAYC0ZYB4W7H
         rUl4BR1O7pooH1x+qh3cDOlzMsZn9BP7jAN2QdJSmG+ZyLsf3em3CvxoCoopcrHbIAYb
         YrtI839AD0BZfCf+Ydlt143ii8SfqudFC0BAJVN6JaO8/OrPK9csnP25bE8FkPJ0eh62
         4sv6j8vDXvbFDfEn9h8VqPgtUwuXj4rXP2jk6P8/4PyKU+mwX4st4HuBAeovVJ/nLVba
         XiCA==
X-Forwarded-Encrypted: i=1; AHgh+RqyLIctAlY6gcTb+KgzmvfTkXLb0KZnVlYZXUE7BaAQBoxZV17S+6AsU1rpB3E5BpTHuxA5TWybh/2XjCr5@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5/sFZjvt1hra66inz+M/6FhKtsi3po/N/ZsKq0eVTe63ofr42
	Heh6+OjZ+oC2PN49bYc8Y0Itotzg0T5+aEKOua6UVPGnGJpA3TvNyFP6
X-Gm-Gg: AR+sD10qt/rYAzG/+T6ijex14wRFzd8c9qTfj3dcoiEg0tMmUrFHHNNHimIA1hY/25c
	dpOL1ZRE5Ys0qMY+CTDCX0GV3OwFcAj9QQn7ZOw/HXTzd4WL9juc/wxmiKa64+zwTbH0QvnjP3M
	hjUA2wjz/xCmdEhIkiaC+8XaZ5tS4QzM/CF8LkdZMvGic5JaBiMCjpio5qmIUH7xKm5+WRa2aYu
	pc/IVR68SBtLDHN4vhP+lWUfm6SC+NbBF6nYBv6APfEB5bLoSl7DZ+XKOBPn4hfZzAuGSGUiEol
	WGfYfRfQ56YeDTm3xatY91XTnlWwNsBeNqPBVUUqXhWcmdvcaGAlO0mf9TOhtqb94EmGJMHq1/b
	umcZRWUTrfE9lIsLSxIXP3LJ58UAEXmJmkbEzHvpv4mGjFla9209xH5skfdXs4oIkyp8RU+XduT
	a/fR3u+9OrNFtLzE2Banjm3I08owrq09FFbpYJ8F88dSs3csny3NqKXxT7yMh2ZENDqSI=
X-Received: by 2002:a17:907:d649:b0:c20:1c9c:b36f with SMTP id a640c23a62f3a-c23f937aa93mr417904166b.8.1787163666346;
        Wed, 19 Aug 2026 11:21:06 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c5a0780sm112050366b.31.2026.08.19.11.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 11:21:05 -0700 (PDT)
Date: Wed, 19 Aug 2026 21:21:02 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Tomasz Unger <tomasz.unger@yahoo.pl>, Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: prefer scnprintf over sprintf in
 fbtft-core.c
Message-ID: <aoX0DiIcLG4Cxvwk@stanley.mountain>
References: <20260819-fbtft-core-scnprintf-v1-1-842c0603634c.ref@yahoo.pl>
 <20260819-fbtft-core-scnprintf-v1-1-842c0603634c@yahoo.pl>
 <CAHp75VcGmmz6EZYjG871V+sYmJn=iGOFxj+D1oe4rtguWkipRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcGmmz6EZYjG871V+sYmJn=iGOFxj+D1oe4rtguWkipRw@mail.gmail.com>

On Wed, Aug 19, 2026 at 08:06:39PM +0300, Andy Shevchenko wrote:
> > (text1[50] and text2[50]) so the write is always bounded.
> 
> > In practice an overflow is very unlikely here: text1 only needs
> > room for a size_t value from an SPI TX buffer length, and text2
> > formats three small integers (bus number, chip select, and
> > frequency in MHz) that always come from real hardware ranges far
> > below the theoretical worst case for their types. This is
> > therefore a defense-in-depth hardening rather than a fix for an
> > observed or easily triggered issue.
> 
> This paragraph is not for the commit message, rather for the comment.
> 

The paragraph describes the expected impact of the patch and it
belongs in the commit message.  My problem is with it is that it's
1) Wrong because it says unlikely instead of impossible. And 2) goes
into too much unnecessary detail. We don't need to know where the
values come from since even the worst case for the type could fit.

regards,
dan carpenter

