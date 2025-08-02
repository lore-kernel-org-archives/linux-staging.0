Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5F6188CC9
	for <linux-staging@lists.linux.dev>; Sat,  2 Aug 2025 08:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754124390; cv=none; b=ShDTvfUrRLtVeMIWxz4bPb4pPkdKFJ7CwVUz2eB/YsMn/EkjbEWCuC1lNOeibTkiB3bUfDMNwwXAtbJe9dmSdqJ9/HLtuK54NQMywW81qt2o8AqzOKaql/OyQuDA4SmzDu/J4qC2tQhQvqDO/C0M0mvFLGl9GFDtSHPlcQV9Esg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754124390; c=relaxed/simple;
	bh=W/seSpZTBVa7pglaInZylODcwe9zQfbQrQVk2UFXQJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dKnXWijd4m7tYjLky0XNroPanYm1u5x3YkZ//MJDuSbhSOAyYb/MhTvqQHgrEd61nnJWZO+6mfLOiHTeJnbC/hqqw7kVmV85ZFQLQpmlnJRZcg4ngskjkZ0K3q+rZZeD9XO4Q1ymcWphaXp2jth+I+MCxd0f4myrx43+lUXx4fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhJdAeW6; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhJdAeW6"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-615c8ca53efso4056223a12.2
        for <linux-staging@lists.linux.dev>; Sat, 02 Aug 2025 01:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754124386; x=1754729186; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/seSpZTBVa7pglaInZylODcwe9zQfbQrQVk2UFXQJc=;
        b=KhJdAeW646K7zObHI0L0SfV4oyDX6eikLtZI5nioflYgtPiL6GOYMKgbHJv/OMGhHs
         m/NXwMNPlrsuQrvdGZZ+xNIFJEyW32Q2yDYxVv9urwX42fkKcOLnyYDnjKcdpHHSs3zu
         RNWeliUFIZcalblxkgYasg5siyPaDSvUWWx6UMvCW+BbVHHw/mBYd4DW0FT4gkcWRWmW
         WA0lh9SGStHBc/hcCt1OfWiR0B56r0q3IFWeT6QemMXbJqa6cgjrkq+laiRetbeimsD1
         /TO+Ab8ZZdF8ukLRwpYZH0n/Bll+L4sZZ8rjA1ItMwOSflz6y4/AHmzuOXhzZIfQIsPT
         ECVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754124386; x=1754729186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/seSpZTBVa7pglaInZylODcwe9zQfbQrQVk2UFXQJc=;
        b=viSjCaw1gPGW02FxX5qbIREWP4JauP9q6nQni7h2b4SsXVE/3w6A/vt0dGLIElGwxA
         wp9NPq3JLpYQesmh9S9tdhLWOK3Eg0CdmzyhRTyGhdQLw+/jqscmxH8E6mgk69MEs3Cw
         0+9eUkglxstv5xgDdefg7bdXsu30dm+OR4VTzyTYLqs7zwyzxKz7aFsKMfxf7ImzFhqn
         wj01oAFT4XK9Jl+/+5Cedeza1w/WAR406/sdS9OxP59vRxVxg44ds08ShSwLGja9LNGm
         BuE6aEPkFr5MkJUjxgALBqjjxnhx/7GN9pysIqmWx3G4hdlrHsXdmp8LPXD5ivOYSUr4
         XyoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQuKWBIbXuJti31TTasq6jQ3io3A3/r56b+d1OP6YM3WWZLVCrKjJL7PugRRb7dF8fzDg161jZtMDMpX49@lists.linux.dev
X-Gm-Message-State: AOJu0YznnpdonGehoq7LAdnzwMaG8sthA4Zr3T+h5xxIBX4RSQ9v94Wu
	7PPQs7/gHhWdjDtD+f7u/ntv8MUaEDjnnj051I/GqQYZ0Znw+y2PLrxf7W8z/lzyFFN5RNMI8O8
	iTz9P7TetfbkrdXnBc7Y9hEBhRLRnUhA=
X-Gm-Gg: ASbGnctK+HwivkO/Y6ETWON2+QlQz5dshpv8aLpf0Eqj0ZvD+R693eMsOp5qphSKWOl
	qrJjeGTrYwF2mYIQxwBsPnn98LM3dtq7Ah5/3UyZ1cdV2me8sQw11goyNH+3Tsa6UzxEIOLVszb
	WOVmu4uoRhKxMLxtIpgFWRF4RBEtJJ6i4Qr9F8KUVQ5O5XDi4yylu4UFGL4HWPy5ieU8s16obpx
	k8qLf1qyBgVigQBQRMx
X-Google-Smtp-Source: AGHT+IFu7ym4AUMZiJIN3syKPFo3cqCsRFpYw7GOJNxNkgh8WX2my/t+Xi67EUC0xDbQJXheV+tUvHXzsan6KbmLLn4=
X-Received: by 2002:a17:906:c102:b0:af2:54db:4dfb with SMTP id
 a640c23a62f3a-af9402098c3mr282037866b.40.1754124385470; Sat, 02 Aug 2025
 01:46:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250801160023.2434130-1-colin.i.king@gmail.com>
 <CAHp75VeDt=1=9epJPQjzfyyph09bov9UWWwpaAXgu01Egf1hag@mail.gmail.com> <10626b28-9619-47ea-abad-db823c01bb96@suswa.mountain>
In-Reply-To: <10626b28-9619-47ea-abad-db823c01bb96@suswa.mountain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 2 Aug 2025 10:45:49 +0200
X-Gm-Features: Ac12FXyFGX3atCqQQpsJizBgqfX9oK5Ez4o3ld-fUNoQAxHXhH_DqHe0kOWLi7U
Message-ID: <CAHp75VdfZwmRzGAeN7rLoab2oT8eKyUF1mUGj4d+y98jZS7EHA@mail.gmail.com>
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

On Sat, Aug 2, 2025 at 9:32=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
> On Fri, Aug 01, 2025 at 11:57:43PM +0200, Andy Shevchenko wrote:
> > On Fri, Aug 1, 2025 at 6:01=E2=80=AFPM Colin Ian King <colin.i.king@gma=
il.com> wrote:
> > >
> > > There are incorrect %u format specifiers being used to for signed int=
egers,
> > > fix this by using %d instead.
> >
> > Both of them sound to me like the fix of the symptom and not the
> > cause. Can we simply make types of the iterators to be unsigned
> > instead?
>
> Making iterator unsigned by default only increases the rate of bugs.

How? Please, make sure this is relevant to this case.

> (Although, my stats might be biased because I'm only looking at bugs I
> can detect through static analysis).

In general making a variable to be signed that is never negative at
bare minimum is illogical.

P.S.
FWIW, it is a common approach in the media subsystem to require
iterators to be unsigned when they are truly unsigned.

--=20
With Best Regards,
Andy Shevchenko
