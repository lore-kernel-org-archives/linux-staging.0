Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334072EE61F
	for <linux-staging@lists.linux.dev>; Mon,  1 Sep 2025 12:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756730821; cv=none; b=r/o0QI65IoNkZRm5snknfOmSx7HmQePHRFRaxDAH6O33mhttqcDV1ZGP+QoT3u+7lr1hjLCp0WvGoErjgo8oGu8z9fsc3X3jNM2gbXLWt59aYw2pSLOiLx1+aJdMWIBoUotRDRp9kBbxLnjj6nSMhpeorjvWLB59hbPcQaHscJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756730821; c=relaxed/simple;
	bh=wvRHqi3dScj15IsjLi+ATrCVMUE7d9PpbVx2eGPnx4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jpXUJycJDM+yK/pgYq/fk5w9h/zUwouK7kSQTTSoU+Emh+ewL7wokU0wgYil9iK7a3qlxocA1yJ9mrys8udcjEAJIwGgWE0AAQ9nbCK5BbuxXLemAOxFJeN673T7ujKgSVvSUvJg2mavIXXJ2dzLPi+3WNcuWHYHSLid6sGxCZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1y5LXAwb; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1y5LXAwb"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b4d1e7d5036so1844628a12.1
        for <linux-staging@lists.linux.dev>; Mon, 01 Sep 2025 05:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756730819; x=1757335619; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7y07yor/pAlX2cJEQqvfRVMWVvqV9hnsGNfw0TS32c=;
        b=1y5LXAwbMU+C4fVsIXvuqlGY8/B+tqqWM3iFUahId4GA7uo8qEvo0Kg/4cYNqM6GTw
         RjlAi4SbZNfvhmD9soEPN19lGlJcFNTa3elsHR69tq0JnPpce3djgj8BoljqgNPZLmt0
         1XyOqchjz6P1PGwRhWpknjYU+5oHyh/j0EE4U3320P40eTtN+GcCml3oHgfZqCL41x4c
         7GCP9S3yVRuXgUxp+33BwDW5mOJ8VEcpZGnUvFFre7fPVm1rP7sojk5px8dcC4bqdlpt
         vChZs46VZtkRerPQq1qMrjyUKOfXfg++l8BY3jHtVgl7nIxZtt3wZZF7K2ZzysMMHo+h
         Evxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756730819; x=1757335619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7y07yor/pAlX2cJEQqvfRVMWVvqV9hnsGNfw0TS32c=;
        b=gpNilr+yTrS3iDmzy5+W2VYKDzPflar28Az6n/e8rFJ4yldL6gFTcykktxECeT1mRU
         ZjPIrSnHvzuVp0yC5Iol8UodadkDTo/PKA4+0BBAtNjkStjUFtmqEUPZ32SrwIOX1XzR
         p++Doj0E/jHa8G5hrIEPADsfmmR9JLypNNJsyoV9vyoHjLXrW+JwLS4nHUuh4uU/BwaQ
         PMPTgAxGksNSxqd2L74Fn4rctuinU/747dK8/4csIrfP6MAZVAljT4/BSStpReVelKe0
         +XtTxiR0G5zdyFoxtV+0QmPrbXWgj9DKdh/68HqKRCFmI/9/oZGswAD5GWQRdiaKvVfx
         06ig==
X-Forwarded-Encrypted: i=1; AJvYcCUoSD/6S12LKae6l0Qirqtt7/g0Lj7afxLbElA7OB+1fDoKg8+Xp7w7o7htCs66saTQyiLhxGQ7if6hPbjM@lists.linux.dev
X-Gm-Message-State: AOJu0YxR8afBe5IS6+IINUAQ8hpKa7wdHZwR2IYgMHvz3zqvGb/Rwcwp
	qhEsWvNbD9nw8pSPQObhSYk+RXeBIM3GrEO/goGIyFnWCG/J4d3snAVrT1vitDlcFloLGC+kxRf
	ESEAGydvJzN9KsBwcEF9oIuGYRNTDaetCcyybTK2a
X-Gm-Gg: ASbGncsyTQI2yAbjzOj2O4P7XiF2d2UPqhsAfCpD9+Wc5nw4PWd2Ff3GjF8q21/AgrV
	5FQJSep8RF6QmFQuvNJ/EklakWYvLw2yF+70W3ZRyGg7es6KmvJPKZuF/sl/6jl0H5qa2UbvQmZ
	Uz6iHKiNZFIgEdT902SZfOdRF6b+2KvZub2nJgMTdGfHzSf+kKyINrSTMRwboy3sZP4cXduGJ7Z
	U552uj8MSM1Eo5um6FyncpXuy7oinu95NESI7r4l/D2msUk2pcvlw==
X-Google-Smtp-Source: AGHT+IHzcBc4YYJpeDDugGdalUGLmOoVhyxPLPgnjb0HlKXSlALfB0fjTWzTMuWcnleuXqTacq9sgKTJ1OxjVOmND00=
X-Received: by 2002:a17:903:4b0d:b0:24a:aedb:1915 with SMTP id
 d9443c01a7336-24aaedb1b81mr55675215ad.9.1756730819298; Mon, 01 Sep 2025
 05:46:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250901091050.1935505-1-abarnas@google.com> <20250901091050.1935505-3-abarnas@google.com>
 <aLWQSAX1ZKg6IiTb@smile.fi.intel.com>
In-Reply-To: <aLWQSAX1ZKg6IiTb@smile.fi.intel.com>
From: =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>
Date: Mon, 1 Sep 2025 14:46:47 +0200
X-Gm-Features: Ac12FXyc3n7Z0qCXdSTjDfMBIr2AbkPj7jLdgKKqBvKbDUlmPSbbyJWBW9Lvlfk
Message-ID: <CAATBrPHpLnsWb-Ua0z2Nmv7To_yXeosoV8+nGzcWfGUVPFq1Xg@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging:media: atomisp: Whitespaces cleanup in vmem.c
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 2:23=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Sep 01, 2025 at 09:10:50AM +0000, Adrian Barna=C5=9B wrote:
> > Whitespaces cleanup to conform with kernel style and improve readabilit=
y.
>
> Strange...

You mean the commit description? Should I reword it?

> >  /* subword bits move like this:         MSB[____xxxx____]LSB -> MSB[00=
000000xxxx]LSB */
> > -static inline unsigned long long
> > -subword(unsigned long long w, unsigned int start, unsigned int end)
> > +static inline unsigned long long subword(unsigned long long w, unsigne=
d int start,
> > +                                      unsigned int end)
> >  {
> >       return (w & (((1ULL << (end - 1)) - 1) << 1 | 1)) >> start;
> >  }
> >
> >  /* inverse subword bits move like this: MSB[xxxx____xxxx]LSB -> MSB[xx=
xx0000xxxx]LSB */
> > -static inline unsigned long long
> > -inv_subword(unsigned long long w, unsigned int start, unsigned int end=
)
> > +static inline unsigned long long inv_subword(unsigned long long w, uns=
igned int start,
> > +                                          unsigned int end)
> >  {
> >       return w & (~(((1ULL << (end - 1)) - 1) << 1 | 1) | ((1ULL << sta=
rt) - 1));
> >  }
>
> These two were just "fixed according to the kernel coding style" and here
> again. This is odd.
>
> Note, the style after the first patch is okay. I dunno what's wrong with =
it.

Those were not violate the kernel code style indeed, but it looks more
consistent this way for me.
Should I revert those?

> ...
>
> > -void isp_vmem_load(
> > -    const isp_ID_t           ID,
> > -    const t_vmem_elem        *from,
> > -    t_vmem_elem              *to,
> > -    unsigned int elems) /* In t_vmem_elem */
> > +void isp_vmem_load(const isp_ID_t ID, const t_vmem_elem *from, t_vmem_=
elem *to,
> > +                unsigned int elems) /* In t_vmem_elem */
>
> Please, (re)move trailing comments somewhere else.

Those comments are also in header so in my opinion we could get rid of
them here.

Thank you for a review
Adrian Barna=C5=9B
