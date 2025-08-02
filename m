Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827F91F78E6
	for <linux-staging@lists.linux.dev>; Sat,  2 Aug 2025 09:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754125362; cv=none; b=atzTdWBYhfZ2oPY62a1AsEoMncjgXquy7rqQ5zGHMaLR55eQtLhwwLjgEQwakld/nQRhZv7I3f+KLH2OlIZwRkIXQXHsuXLkdz7pSuvJdv5Uf6GFqWVd6cBM+PxAn3FC8Y+AopgfMpR7Ia/1EbDgBdEZG43Ednl9UnBm5lLUkoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754125362; c=relaxed/simple;
	bh=tE/ycKV78Xqu6awmy1vGaYwLfvEhozTkRG8Leg5kafA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M70YB0kSTynJalj08J9m4k1FTmu/ZiFsBlUTVz95VF/awKbbEXpTnJBDm/Qb1bO21rbmrb/Yv3w3x0GocgPsNp85Xy3uW+xA3uR3qArTGCDXmVEf4ccjSNItRc3+Zh+c9wh9CJmhtF4OZ/alMqrqWoSqH4DcfWonXRvdvaZzBiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YFLOoCMJ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YFLOoCMJ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-458bb0e692cso1880455e9.0
        for <linux-staging@lists.linux.dev>; Sat, 02 Aug 2025 02:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754125359; x=1754730159; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U/dnL5CfASf7BSwg8zUGgo87QSvNoaNIJBZuuBOd20Y=;
        b=YFLOoCMJ17pLpfr1iYQav8zQrDmlh9N8n0mYetWykty9BMSXxBCS2mI63GeSPtV2m0
         YJigLtpeZk0uWW47y0LDKH6lGHAP1s962ovDtLRjJb8MJesEfUHr0xI+9AJ9thJkUql/
         8e7mdOKJoDZJHcKa0j4mp9oACsimlvupHc+JLerdyvDepvO1ARS5KdOkeJsxQb1TucZC
         5T8iHhcRYEKNWQI08fruBeE70ew3l7neGU7jB7LHHtuONJOWSsZG7xa5ROzOZUUE6/88
         L2zncWJeYC1N54YP9FreVKUQZmZaVKDze8/3sACN8V6PgdkxxEo8o/4lDk360evV7seu
         ap7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754125359; x=1754730159;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U/dnL5CfASf7BSwg8zUGgo87QSvNoaNIJBZuuBOd20Y=;
        b=QIvLar8BqWwu2sbf+pUIJ+eGSITkXFjDaFUBs4oxNNbF+KOhYgUQ6TMshlJMFEjT50
         i37X0jr2P1OOdxldjzE6cLS5WwGoPPnlyKfPHWRjMT0JnKedMeqa6F5RdX/yhcj9IK0f
         vnJgDylVIVofExXIj9gu+IqMVta324yYliQeKAhl4rRSGPIuEK42MGxuInrE7YKSIXtk
         gExKtDWkAzrvRygUFTAIYRW3lSi5FYb9Ncm2eMxLMIAdEokl+h+lzCguRqy4MSSIjmrH
         IB4HEF9QT3DK4kRt6cgzynZ7T4UYhP1uRB54C/kX+Lqf+bfljYFkIR766/UkAKbz8rX6
         8cDg==
X-Forwarded-Encrypted: i=1; AJvYcCWrfOCljtN075PXsBG+aborUECOXyF43rskSPAEwSuwfoO3zBJT3yIRYHn/nQJdMyagtxSFsxwNUjpGTdS6@lists.linux.dev
X-Gm-Message-State: AOJu0YywE7WkynwMlSZAcolT04bVh6guVEo20rHIiLw6PtQGm3bTdk9Q
	WIgWwBArxFA2Vl2iYwUapWQ2CIFJ1JysbZ/5vW8WJ9qPDnW0R818XiiulCFUYVIX+m4=
X-Gm-Gg: ASbGncsOV24eyRswvgb+QjeASUutswIZl9j9AOe/Y77Xy2Tj2UosbwRzkMlRDw3Cxkp
	BdW+YTQGTm3eFo2JpqOk2BQOTJfvaEBITKAAzTGQ0YY2FNeaJo0UplZOAPp20b1q7fSNOHATABm
	/9NC6XsD0CuIupm2dJwyjCgrc3TmKIpRK69x9YpcaJsUCKvsRpE6eORqiPgihQc7GgcYA0oACsm
	FMKB6X6xVNw79iIw9iuFr/u3QgdnVLO2Zp4t9vCt+ZuKfOq5vRplaJla1Xk3gykdKwpx4dLpbn3
	NvMDx49Lk3cDKyTaNFiPr7Ekjw29Th+M9qDOQrhmrcp4JwGYgW8gAzisR99qk4SMloYjb04yq31
	RQEimEto/IipkHCNSbl90bvxONhg=
X-Google-Smtp-Source: AGHT+IGD1hqwEMqQ7r+1+t1Ud4D2Xaj0ub7nD4dO+TqiU68vja/VuwOkDoIJFNO3HEop6/QEYJVv+w==
X-Received: by 2002:a05:600c:a46:b0:455:f380:32e2 with SMTP id 5b1f17b1804b1-458b6b30363mr15584125e9.18.1754125358709;
        Sat, 02 Aug 2025 02:02:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458bd5a1148sm6429065e9.0.2025.08.02.02.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 02:02:38 -0700 (PDT)
Date: Sat, 2 Aug 2025 12:02:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Colin Ian King <colin.i.king@gmail.com>,
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] media: atomisp: Fix incorrect snprintf format
 specifiers for signed integers
Message-ID: <934c7ffa-1386-45a0-a4e7-f2b93cca6370@suswa.mountain>
References: <20250801160023.2434130-1-colin.i.king@gmail.com>
 <CAHp75VeDt=1=9epJPQjzfyyph09bov9UWWwpaAXgu01Egf1hag@mail.gmail.com>
 <10626b28-9619-47ea-abad-db823c01bb96@suswa.mountain>
 <CAHp75VdfZwmRzGAeN7rLoab2oT8eKyUF1mUGj4d+y98jZS7EHA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VdfZwmRzGAeN7rLoab2oT8eKyUF1mUGj4d+y98jZS7EHA@mail.gmail.com>

On Sat, Aug 02, 2025 at 10:45:49AM +0200, Andy Shevchenko wrote:
> On Sat, Aug 2, 2025 at 9:32 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > On Fri, Aug 01, 2025 at 11:57:43PM +0200, Andy Shevchenko wrote:
> > > On Fri, Aug 1, 2025 at 6:01 PM Colin Ian King <colin.i.king@gmail.com> wrote:
> > > >
> > > > There are incorrect %u format specifiers being used to for signed integers,
> > > > fix this by using %d instead.
> > >
> > > Both of them sound to me like the fix of the symptom and not the
> > > cause. Can we simply make types of the iterators to be unsigned
> > > instead?
> >
> > Making iterator unsigned by default only increases the rate of bugs.
> 
> How? Please, make sure this is relevant to this case.

You're suggesting that he should change:

-	int i, j;
+	unsigned int i, j;

It's just bad advice.  Making iterators unsigned makes the code less
safe.  It leads underflow bugs when we do subtraction:

	for (i = num - 1; i < limit; i++) {

Now i starts at UINT_MAX.  Which I guess is fine in this example...

But it also leads to endless loops in the error handling:

	while (i-- >= 0) {

Making iterators unsigned is a bad habbit and it's bad advice in terms
of the data that we have with regards to bugs.

regards,
dan carpenter

