Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9D1306D26
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 18:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772476450; cv=none; b=gmC7uXT8s9AflQuMnGH4XPpSSlfg9RQbZDCDx7pK7ZI/1AWq0xI8gjfd6TvJzz61JBRhVfg939XsPfb1flY4EBFORTzhqmIsH6CTeZMILs8pYqk9IwblbYXuamt4j6z4fx/b27FQN+htlz/juw8TqxV+kKAegcGAtU3iQ/TunJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772476450; c=relaxed/simple;
	bh=ytdxSFVIlfmGZ5JMqynJKQP/WK1r5N/iMXkSdbWkKuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBqpH5+8blGf3ZoeafQlbPwg03ce+rt54FWEG6A65q8uRby6SXnikHWbTo//UneKgNtVepFYM+2EJh2tRUVpyZ2xC9kfxQuZFfODsHgk5bLR8ZUrwrHerPbS8JbXdUjduPXFwlxo6jWx2P6plR/MRr6qORuOQogu9jSADaX3KlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+ai8uJf; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+ai8uJf"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439b7a87fb5so790649f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 10:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772476447; x=1773081247; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yPBSFYnQURCLp+pSBbZ+u+kSFevvmdAlM1k21c+Mgp0=;
        b=i+ai8uJfQx/CDQOCkh5COgJAKFJqvbUU0HXqUopKRM+A/YdDpjvvwx7+sUudRYwc2C
         MAqjP9X+vXvoUJJOumRR1QkD8tkcIUzKNoHKI2zoVag++Se9UAxT+6m/nNCrGD+odjnT
         ukeSSExtXuLakKsWPHptiTs5Er3DtBEz7ryRjxn4xj5fhj2lwPbLVo46RUhQB0qWKDFl
         08MqGFpQzkYQxCSGuig1ANdXOd6LwzARsxgbDBEcMShCNPBGwCuc6YT3uZtmk9kFyiE0
         oDcPrQGacicm2wC6nPxTD31gXQHnb7Wk3tkgdjTssVXUxu5Xg6zfTdp3bWYHJ+n7lmJu
         FTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772476447; x=1773081247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yPBSFYnQURCLp+pSBbZ+u+kSFevvmdAlM1k21c+Mgp0=;
        b=ivudMWD28tQ9bukyrtXW6hUsnGzK0YcNrCItYto0PtE7sa7ou728yi5jEcH0L6kzX5
         HTczkdrF7YGP5Lc2NLV95b11Ft6Kko7nMaEyP9u4MEUf+nJgJ4pcvKfSAYqoULvsDbkz
         425BqnEroh8VCl5gQ5KgZEIIHHbghogAPnkOb5bMbQ0ba+HO5Of8N9WQJW6WyPnnW24L
         M/8fpOa5cbnF0E4J9Z0YQZqQubCTZsbPojLmQGZCpO7piwts8qjuVXuexpOukcl9Eqon
         xAHIFgQ9tmLezXDbbCk7iQbRElp8o57isZKk/focDV3oHiwkyzOHTXT3I+YxRVRXiAf5
         9Ctw==
X-Gm-Message-State: AOJu0Yx02yrEmulWTrENyFc5AhDgDYVCYZRvOKPx0OKpXUQrzf8xRSHO
	iPtQIg6QIVj3jJeh4k+MtUDNoTkAZsxGU3AxsCyKpCCrBf3Tid6404L1
X-Gm-Gg: ATEYQzzScjW0umrOpS4aVS6CV3cs4E+L6tyyouotEZ+3ZYXDb9xtxB7Y7IL84MnJKhD
	Wf4mOOhEqO1FcCzuHe+3PbJVYeygbjdIcaHIWGfIIrZ6Lo5BMxWaNj2IOS7sz9j7Skv1yOawnt6
	fTI8IbwRs+NGORaG7q5JxsBb6QBkNxw7PDCtcRjFDa7tFsJvzHZcm+ciZvMp5N2Lw/d+PF9vE+i
	/ArpHqd8TgYkLf+pNLKijCQIRFcOqVVtPQrfY18/pjL6wJO948BW36vR4Uo5llgkmAHQIvXoAfF
	9f3B2vsJbmyaWRvmL+gSeCBle0P0Pz8WRCEkT0O+javrPBZmtoBYc9ZhS9u5BK4qmi0DZ8gx/Et
	8wUIgX4jklY2tN8Gw6nwZH5SgCyBZmTGIDLDJrlfPkiR7YnkKCxtQAe0DrlLKkk3up7bHvNSFvd
	M3BvlU5b/zhIwu1+JcFNSHyv8=
X-Received: by 2002:a5d:5848:0:b0:439:ac8f:5db1 with SMTP id ffacd0b85a97d-439ac8f6197mr14555685f8f.15.1772476447433;
        Mon, 02 Mar 2026 10:34:07 -0800 (PST)
Received: from gmail.com ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b6d540b2sm9531515f8f.36.2026.03.02.10.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 10:34:06 -0800 (PST)
Date: Mon, 2 Mar 2026 19:34:04 +0100
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: linux-staging@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>, 
	Artur Stupa <arthur.stupa@gmail.com>, Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>, 
	Navaneeth K <knavaneeth786@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix operator spacing in
 rtw_ieee80211.c
Message-ID: <aaXXbxA-K9jgXffc@gmail.com>
References: <20260302115501.31596-2-azpijr@gmail.com>
 <DGSH8799DP54.G74XNY2RDBPM@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGSH8799DP54.G74XNY2RDBPM@gmail.com>

On Mon, Mar 02, 2026 at 11:36:05AM -0600, Ethan Tidmore wrote:
> On Mon Mar 2, 2026 at 5:54 AM CST, Jose A. Perez de Azpillaga wrote:
> > Add missing spaces around binary and ternary operators to improve
> > readability. Also adjust line wrapping and indentation to align
> > continuations consistently.
> >
> > Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> > ---
> >  .../staging/rtl8723bs/core/rtw_ieee80211.c    | 89 ++++++++++---------
> >  1 file changed, 48 insertions(+), 41 deletions(-)
>
> This has already been fixed in staging-next. Please use that branch when
> submitting patches to staging.
>
> Thanks,
>
> ET

Okay, didn't know that. Thanks!

Jose A. P-A
