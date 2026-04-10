Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05EC38B12A
	for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 06:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775804297; cv=pass; b=rq2QGhCwdQ5ONIjWNZGjsjGUpsjholUdaDIhoKh6YbaFPtEF6zyt1sJMlJx9MSTNtWfInBhirAE2nvR4Y3AUSca32DE8DEKKeF3ggNm9rFlZloR/FiQjTtcYXfQuMoxjGtP3cWqqUu3c84+Q+NXr/J1UsrmYM3c57fOI/VtJUic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775804297; c=relaxed/simple;
	bh=QL9d7HHZz+ESS1CIPm4LO2dUSyXw6mHBSlOn5wwi630=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jp9EBaIAJpfPgRUbbgXb7r62QiQYBrGRdUbQuhmmNqZC0fK9E8ER03P9dVR6HZQvTKigWxNhknJGvJ1xxrbT5tbIvPx5K1abXwCIN7BL61Jsoz+iqFntyqlVWK/XvsYrQYDTtFk18PfrDFFRK00K6fE2VKAJq6zvMZtmAeiWN14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OsF5pfv+; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OsF5pfv+"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43b8e8e7432so1475737f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 23:58:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775804294; cv=none;
        d=google.com; s=arc-20240605;
        b=HgKIxzxifPq8c3k/VFozAPNezin0Ke2c5aooLwk7iPa8EdrNeCiCfc3qCx77ZmdzAD
         oJmHSc72OY+3oH2DOKqYZPcxNaOZPsw+ckaCdIp+boab3JD69j5jGuDaeggZPYQBkAZd
         zzgVkfNCWg4IykCPq5ob7+XEcwycUsfcTJ8cl1+nNi0seRparYto8PlnPeHB/Q3QLI6O
         fTy2VJ0DfccGwk7Q7mnPP2vRX+yERuQk//zj+0Sf/6y7Aa5ydTijSlYLJt5q+4X4Vu4o
         o8zfSR0EoypAfRIq+RsiBRkoYYgO/WJ/jYbVsEBQhW9sfRE2nJpItBoQFYOCYCMsthAY
         yiHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OElDux2FE2thAXeaVq/Hos4B7MJjORPl7dXwRgj8mbk=;
        fh=jiHMMKFq+Ms5mB8WXKAzlxGqlSxjAjCum5fbCiGdeX0=;
        b=lsWweOmX+BN9T0nbJ2nfZNsU94yOZmlqiFuoUcu/ZuhNZIYbFH4MdZK4h3dBKh0R3E
         fVX6ePxYc3I5zG/07dG08i8Ln50qsIfAw0yafBAC7uZ3gMWckaznka17/aSoF4DnzKIa
         Jd8Yg3vt6iTS0zmT7LcTiEm3mr5KFCihVY8Usy0AXRZUXqNiWDWmdXx6w877733Zl+4k
         zzQa0T5uiQKqv9lmAfzvntrlXeHucFJ6Le9tef/Kw1nM73Fp2p6iP+SYVZgrtt/GRsF1
         sGurwR34YiN4r1QuvXDZFAFd6CbZjB+sgATb5FAV9W8mRHuusi0h/g/J+AhxKImwhW8p
         P/Mw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775804294; x=1776409094; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OElDux2FE2thAXeaVq/Hos4B7MJjORPl7dXwRgj8mbk=;
        b=OsF5pfv+WGHthY3n4tUsQHx449anuKWibrRmercIBnI6Xx7WldvvGNHq7pHJZXfZf9
         DQRPH5oMSrbiwHeYOPbYaNJpSfz1ThmTQ1za5WFpTlrrJvQhaTldjqSja4GiZpeVhXdt
         71dXM95oHwZVaNfvw2xhgQ3OQXZSMw05aMqw8CMNhhkUknaANWu7AOexolTb8LoaaEpk
         DtUwzCYicAql6ZQm4BwUXPciD9gQI26abH3tbBsJDNbgjRdL6+uLJsPWTe5DY7sXmkdt
         XGIy+5tddRRUGZk1wujFaCGoc4j/Mz3h+JXarxztIOvebCmoIt7BBKofBv5moO3O/M98
         cxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775804294; x=1776409094;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OElDux2FE2thAXeaVq/Hos4B7MJjORPl7dXwRgj8mbk=;
        b=noK0MjMWbL7lF3cRnADZbrNNUdNB0GHBA5J7l+RzTzNq514h9fJXhYChaRIiAbVPuy
         9qqv1Sb1owM9XGJSdeSPlr9cXpjSfFtDCsKhOJL23AhzSzVXI573uZQHcxPNTZ6e5F+h
         LQJ7SXqUnWOWU+s1Pj2A22smhFoa7zeesg/ODL1gFg77a0lDWu5igIsTRpKLsTUs+j2D
         OsVzdQvJ9bx15ghKKuL0Uuw4JXyZ8pxzS2WFfCtEl6Z1Jhh7J7io7vfzqj+3sYt1UboQ
         iA2i8MQzUdDdAeM32R3cu+1+6w+LeOGPfhF6O81ui/CQlNmBIzp9tP3Lvnx9SPakUnvX
         Cgyg==
X-Forwarded-Encrypted: i=1; AJvYcCVNuY8mIwYyEPFZq2hY5lC1QAlVjtwElxeau40p6S7HezzhZJG5Y0xB4YKAuQDxJKPJZ9hMNCCCQb2LvLiV@lists.linux.dev
X-Gm-Message-State: AOJu0YyFduYRn29LVaoTWRQ8+6Zaq3nd2qg/4zCyNkicOIo5vcko19zH
	O8g9wiAOuyuNECqoRSLzQPyr2PxAZIiJgwojZodVuLZj0uF5umZ489Vvhr2G+eIcu+3M0KWY+fe
	RswqHeupjhs9Bb4YVIDjuehTGOHDUuQY=
X-Gm-Gg: AeBDietJGngJDbKlEnN/s4Ij2Kz64PFIPErqzV5OCH0c+ht49ImaX0S2kyL39qZrZxj
	pj7N6bNFLRno8tQbOCMiETdoMedslMFQlBMqoYxI6Ufs4UVJ9LlBsatSS5I7kHtUlTjFFc5oOrU
	EE4f0gofywSxdXRPi1Je19DvaIRQ41hfkRl6l8/9rlr5cSG5HSGlNLfg7eJu748+bKC5jr/GWP8
	RZd7ziEjaE1E86feY5qIgVcC4Ssfrd9ZCf1TLx8fm1wxJLGgO/GWWKQnVngxzSuIoRY95i4pqpU
	cEZTQ5kGu59h33ktOHTlCibaUKODwCeWCjmMgfMnvnsjA84rZK/SDH64n7Uno+yZd4gJdt5dWfK
	QHYzQ9o33rDFmt3QEcuf4LhoBrQ3UpaDh3VZC
X-Received: by 2002:a05:6000:40cd:b0:43b:912c:25c7 with SMTP id
 ffacd0b85a97d-43d642c4f22mr2693360f8f.25.1775804293832; Thu, 09 Apr 2026
 23:58:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260409131823.1289-1-joshua.crofts1@gmail.com>
 <20260409182755.499a419c@pumpkin> <CALoEA-yVCyyiA1gUCj4Z0JcLscpSSssPCPXnUPOciWJOHj3VUg@mail.gmail.com>
 <adh8zOCQDhGwgf0Y@ashevche-desk.local>
In-Reply-To: <adh8zOCQDhGwgf0Y@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Fri, 10 Apr 2026 08:58:10 +0200
X-Gm-Features: AQROBzDDgEHNQvvBzy-gtfuLSSEi14E-Hy-7gsCI_Htvde6Gu6XHxgVfEoH4MBs
Message-ID: <CALoEA-xo04NZoZLboZ_RNg+m8QfCaDMrfNRb0cZwnE1DMp=8ng@mail.gmail.com>
Subject: Re: [PATCH] iio: frequency: ad983x: replace do_div() with div64_ul().
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: David Laight <david.laight.linux@gmail.com>, lars@metafoo.de, 
	Michael.Hennerich@analog.com, jic23@kernel.org, dlechner@baylibre.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>, 
	nuno.sa@analog.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Apr 2026 at 06:30, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> > The clk struct in linux/clk.h explicitly uses an unsigned long to represent
> > the clock value, which is used in this driver. Using an unsigned long
> > ensures platform independent usage without type mismatching.
>
> ...which effectively means the frequency most likely fits 32-bit. Otherwise
> would it ever work on 32-bit platform? This is a mistake in CLK design.

So we keep the do_div() macro and cast mclk to u32.

-- 
Kind regards

CJD
