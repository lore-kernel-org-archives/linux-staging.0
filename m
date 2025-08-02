Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F83E20CCDC
	for <linux-staging@lists.linux.dev>; Sat,  2 Aug 2025 10:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754128805; cv=none; b=Qug1cAYmETFcB/McvpQV/H0sOH9b6/aOabkB5MKhJ8ap/Xq1bAVvZO7A6lcRVM12pGRwIF5nnV87ElPabFGhqV0I96GQJVlXtdR6E9rlHc9Ra6MmF6FghkKDUG1zUDRPAC2HgQVR8QFJWFi5QQ7ydRlfA7sD4B+53ho0ewUyL+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754128805; c=relaxed/simple;
	bh=WayQJUQgwbK9qbfQNWW80s1Tl3LPJMIe/oqlIJwmTLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jahGfFbRPMRy/vda09O3u6jaUnKBElHh1y425DELpsTSXfKhyqJsX+uEUKk9FN2QEdAcoY6Kiuf1x4umAr3yTAOpERu/Vu0YA19X5c6a9XmqhQ0ZSQ6OiB9UNmQVIcAiNLDllcAHaenaso0UyAaFbuV4k5UP/G/C2R3j7tp6aug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFC8YFjL; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFC8YFjL"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-af94e75445dso55530366b.0
        for <linux-staging@lists.linux.dev>; Sat, 02 Aug 2025 03:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754128802; x=1754733602; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feWlU5UHKzv3UI0KTDbYapRv72T2kY/BmRcgf+kQTWU=;
        b=CFC8YFjL+qhYNXuZY3K9Ywq27ba9vyUBR7Ok/2Y9Qc5Az1iNn73KIoRF7Db3E+TX0I
         9K5wL5EX7nAuASSx2HXThytEvdHPGOoj6RbC23imNqv6Kj3Jlb8MS6qwrATYqBQp9viV
         zhUNqthz3nMAodZxOOflVwTjv3LFDd1Sn3XjoWxTWwf4ZKqyYVYqUuK6NEmdRwS/NmUZ
         iJzdlZjMdzB0o3fg8A1Hsd4e3FKMMqBrtggqZi5NCcMr/ICC3aif+4h0wo04AxfVcaVk
         bqOSKZdXB7If6tA4m6727fPDQvg8oL683W3tNtZIBN9VQFj4/kL6pi+F3BO69rCKxULU
         Z5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754128802; x=1754733602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=feWlU5UHKzv3UI0KTDbYapRv72T2kY/BmRcgf+kQTWU=;
        b=jQd/SCYLPRuaLeJftWDkrJhWNdOT7MJFW9LO1TKjdaQS8Fi0PGf44Heheq7+1Owtaw
         QbdTPsvflWImWT3qwGDBm5e/t+57YTCGUAO0gP5kpYRGK37FAMd8ExWAeFAXNn+6uZyS
         WUHqW43OZlMuw7GV1O04a2d5XZ6ZgC0BBM6Q5LswHj75pu71eFCNeILu1xFP0NOuRt6Y
         E0foWBrLkoouXlNxOgAsPzTmbZVIho84C3SP8JcqRxin6pAcCs85N5kXf8CDgDTRsoyo
         B3mJvkBzSXrVXkIQIaELUygWR+4SUwHsQohtFu9E2BTLUuLf8v8J6I6whsmgMJY/B90a
         H3jA==
X-Forwarded-Encrypted: i=1; AJvYcCW9UXN3NtBVkg1HvYPJp0XaQr/JQKwhJAlCuNA4S/ei03LCHxAAnGmPicqR4L083PrzIl4ADeT0VHE1VGoS@lists.linux.dev
X-Gm-Message-State: AOJu0Yx35IoND62x7rpKaijbL9a0h3FDIM5bZEiC1xz60cLDYAprD9Jk
	K4g1P7Ffc+l5CCfjC3xDG/iL/b6EJht2Y0sCNTqq8TMIsVzBJT8n519sXDCdMnvtk51SMuiThEx
	FR85m2UQgIgFIWsd6jMzefkMwCXWgrvI=
X-Gm-Gg: ASbGncutWpunuXmKAdt+O6Rpe6pwzYa2AC82XIDO64Ns34Zu520QXrVWNJA/CPv8PIY
	k1ed5bgu4CEmSTmpMQnB3X94FgInE4o2xGhqCLnCpsVCJ5y/g1OJXAEn+cB3jDIh0ly+jV6OuiE
	GfCk4HaJiD2yi1qRCIvPCy+8ezmFM2yJyQVkjuzn59sfjEtx7EDVkDAkreC3ZJeunGUd4kTk7A9
	jXD4Zn8JlZ9YohoPmaPfWTYitSxrA/Wrl4+FW950w==
X-Google-Smtp-Source: AGHT+IG5TgeuLHpNv7s/LemmQexDxqYMgoidrE7ZLMIA81vr/4HVCfPj3/Rb6/9ZIVHsjd2OS5ljDfBbdV7yoto0yPs=
X-Received: by 2002:a17:907:3d9f:b0:ae3:d5f2:393a with SMTP id
 a640c23a62f3a-af9401a6d31mr287570266b.44.1754128801607; Sat, 02 Aug 2025
 03:00:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250801160023.2434130-1-colin.i.king@gmail.com>
 <CAHp75VeDt=1=9epJPQjzfyyph09bov9UWWwpaAXgu01Egf1hag@mail.gmail.com>
 <10626b28-9619-47ea-abad-db823c01bb96@suswa.mountain> <CAHp75VdfZwmRzGAeN7rLoab2oT8eKyUF1mUGj4d+y98jZS7EHA@mail.gmail.com>
 <934c7ffa-1386-45a0-a4e7-f2b93cca6370@suswa.mountain>
In-Reply-To: <934c7ffa-1386-45a0-a4e7-f2b93cca6370@suswa.mountain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 2 Aug 2025 11:59:25 +0200
X-Gm-Features: Ac12FXydITqpLLTnCyxi2yPbs8KHbuNgdyPXStr15pFn8DAEsDgugG3s9wEt0rQ
Message-ID: <CAHp75VeHvGkPf_OHDNfB3aQ-196HHP0hddnPS6DVJsBsiBAMdg@mail.gmail.com>
Subject: Re: [PATCH][next] media: atomisp: Fix incorrect snprintf format
 specifiers for signed integers
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Colin Ian King <colin.i.king@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 2, 2025 at 11:02=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Sat, Aug 02, 2025 at 10:45:49AM +0200, Andy Shevchenko wrote:
> > On Sat, Aug 2, 2025 at 9:32=E2=80=AFAM Dan Carpenter <dan.carpenter@lin=
aro.org> wrote:
> > > On Fri, Aug 01, 2025 at 11:57:43PM +0200, Andy Shevchenko wrote:
> > > > On Fri, Aug 1, 2025 at 6:01=E2=80=AFPM Colin Ian King <colin.i.king=
@gmail.com> wrote:
> > > > >
> > > > > There are incorrect %u format specifiers being used to for signed=
 integers,
> > > > > fix this by using %d instead.
> > > >
> > > > Both of them sound to me like the fix of the symptom and not the
> > > > cause. Can we simply make types of the iterators to be unsigned
> > > > instead?
> > >
> > > Making iterator unsigned by default only increases the rate of bugs.
> >
> > How? Please, make sure this is relevant to this case.
>
> You're suggesting that he should change:
>
> -       int i, j;
> +       unsigned int i, j;
>
> It's just bad advice.

I disagree with this statement. The code varies and in some cases it
should be negative, but those cases are not these one, or you are
talking about _this_ case? If you are talking in general, again I
fully disagree with your statement. One needs to use a common sense.

>  Making iterators unsigned makes the code less
> safe.  It leads underflow bugs when we do subtraction:
>
>         for (i =3D num - 1; i < limit; i++) {
>
> Now i starts at UINT_MAX.  Which I guess is fine in this example...

Depends on the num semantics. The main what one needs is a common sense.

> But it also leads to endless loops in the error handling:
>
>         while (i-- >=3D 0) {

How? Error handling usually takes i > 0. Bad example, try harder.

>
> Making iterators unsigned is a bad habbit

True when use in conjunction with the same statement for signed cases:
"Making iterators signed is a bad habit"

> and it's bad advice in terms
> of the data that we have with regards to bugs.

Disagree. Bugs are common because people do not understand the C
language and its integer rules, wrap-arounds, etc. I believe in many
cases using signed iterators "fix" the bugs due to other variables
also being signed instead of both being unsigned.

--=20
With Best Regards,
Andy Shevchenko
