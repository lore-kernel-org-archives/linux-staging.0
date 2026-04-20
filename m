Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF4315746F
	for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 06:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776666886; cv=pass; b=dvEsbOVIZiU4igeqQVfxCkCZnWMqrv+WJVhKy8BG2Ye7VWxvqyThZFoXzls4SOGT1gB7YHVECtY7EZlISJ50XTC/2C/+j2gCUZlkim43ELvh/XJnEvp6V9b9Y3bZLlxu+DrdmZKnRbKo1jrfQrIh8wZwi+dVBzPtu/QV8qDooJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776666886; c=relaxed/simple;
	bh=81PEkTTgJBxoeay/TLfhpVbql70yqz+B4ECmxiW0Wf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bsS0o+Eqg1FhJQjG9FBtiglBo6z08ud9/SMHoEbybHRb55S6affz415Zk/UMaBPbIxyZIlmveAM4qpTLWPQJfFVLX/qXFlLZ9mT8BFG556A/0+ANqLBO3rrClzmi9FZk4IyrRwomONqgBJ+8r82WXMLa+XiGvvwFwvdZ4PdGAvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Us9WMT1U; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Us9WMT1U"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ba6b39871a3so164281766b.0
        for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 23:34:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776666883; cv=none;
        d=google.com; s=arc-20240605;
        b=FKATLrUKGyFpNmUVWlALvzov2momZLNRCloa8C2QSzqwCMh3HB4QhXnFmHmTW6u2cP
         Fzt3cfidSzXILz5mWULYXLmy9nonZcAcQZsaqYm81wsBzIQnbcrUVg2gKNUFc6PzXXLU
         aVGPQPZE8H+d77V2TWGV75xLTUmnAf3mtJq2mCa6r9JquyY5wdOPDxeH52ylkCxv+KGe
         BmjN8sh/+Su6dKjBaBIaU947pODzTr06EXMf+4Xfv1c+rtJSWt50sWqsFConhzTyLxsb
         yEKSn0+bgCxW/SMT/h5SywJqT30+++ZVKFpJ8TJSIuHKoVJE4Unz+FjUBJWHJCcpZ/Ud
         yfew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=81PEkTTgJBxoeay/TLfhpVbql70yqz+B4ECmxiW0Wf0=;
        fh=IZO2ry3a3e9ZR44ALf+QwNTwGclNWI5XRfMdiPkF2DM=;
        b=du0HpQ09/JnpnXKlTJ6qs/JKBjB+t/rHxKHnM9QOoCP2I7fx9oIwPSx2pA5bhy80kf
         KsfA0nHnsud1Jw0pyYXbT2044V+QAgBARbuZHH7J/doEmLyoSAUgA2YhJ2L/gdq6SMhO
         IualyVuDG8GA+k8GKb82XkMAGO0VEUG5ev8E8I5CSolZh+yuIcfhwcJzAuV873iUoEnu
         5GPl7wSh3dj5UgBpMr0xyfsmqAMjxj67/SbLmkztcmGFekAToVe3eHE0L4FhFeZgb6IW
         hDaOwSP9ZcliwFckE/pwO51dsLZtR/t/vtvfKX3DlJYyMfP03zYkyh6+3E31d0po/sEj
         6Uug==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776666883; x=1777271683; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81PEkTTgJBxoeay/TLfhpVbql70yqz+B4ECmxiW0Wf0=;
        b=Us9WMT1URZ3pWpIW+d32zzd+wVr/8bX+Iyq2Cz+LZpeKqL7+Vwcj4dXQfrIKrJ2Yl5
         BWCDqHcy4BMb7XJG0oz8VzcoIHvoYJbLWTM4Ib8VxLnREEEXhB8Np9rig2G/W80Ejk6H
         KseDUAXwhUy4ZyfkK9eWc+CWs8PfvirONe0Sa9kTavPqAlF7jsT7SPRLdkFk74PN4554
         RYGqSzqs/kWg9iSTtZe2IjCho9u413AhAQirKfFe7m6IuM93CnPbcmUxqiNYVASOmdm9
         ngH/Q/zPZaMVvvuEO5KOy22NnZzuEjhgB/Pu88rZ6wWV7f49oX+rhC5J/pTAGDdpqOfz
         JLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776666883; x=1777271683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=81PEkTTgJBxoeay/TLfhpVbql70yqz+B4ECmxiW0Wf0=;
        b=mO/FuhgcaS1HHtDrCXfsQ9Ic0tcvyLd1108cLZnefbFA5rjO+VuQx0jZQ5f1/gep6Q
         vvg7xGw8c4yE/Syj0Ke3A4nVvkGS27fYzYk2qsvpB9nBU+XjUfzeQgWIwK9brM3qda2b
         kO3KgGGS4EwRobB/bDlwGw8PRYiH5qWQJEm+XYkjAshsIkVsiJ41Lomzd6K4qIzogqNt
         7u2BaWZrmIaUSChVYyzcBZi7V+7Q0Ixl7p8sR5DEvzaDBVVDtqStpBz+P6lM0yfJF5ch
         xFHkNicePW4yzHsdSPc9+omtL1Uo+pMJVLHL8R5A3RyWQfpX72v822Cdpt3M0ndavxey
         DsAA==
X-Forwarded-Encrypted: i=1; AFNElJ9d5Ef7qdwQ9JrLHCXRNt9MeDz1mBxelbRTL4xkva8gMbeVRQ13VTtqBgvcALRJYUIzsP8sSJiV1sX3iLBF@lists.linux.dev
X-Gm-Message-State: AOJu0YxNQ0/Rshm8qdsfIR5TBIuFRytav8HsEGMATVesQxoOvGepgtbo
	KYPWyCtG2j72Faj3HH3u/wFofxGWBF3kRvL6RlAusewUn5QwX7Yksr0wERc2aNUtzA84updnqCK
	HG+Kk4Gpie34eCZCCUqY/fs94LMNZLpo=
X-Gm-Gg: AeBDietZktPZJozmzZ40VaORrRLXDDpjs7EaDlNhFyCWBvJYSbdOmJfoAlxetMupOTU
	Oig+3xT++y2pXANrHsG+sceyWDn0nIG92fnVgjTpfu8YqRys82axaXBl6N/JqAG6RSP95mdJFrt
	7Ut63SWFtJAIMDHr6LgJTNd5sRPOMq2wae4rBmVXw+3C/b/DlqeTPM6TdLDsT/2GuOOHQA0e1lX
	fUCY4L3Xfz+5RqZPkfCrhj14XCo2nPDuXS6FgtbjKG0Gfy1mCwKS6HAvuYZ0YQ5lbcbkqQzQcV6
	NGVFzsbKMLa9FAbM4z3I8TbWAf50+FUbKburUEX2tR8RszOkkqttASydYnnQzNaRBUaMBj/711I
	3WQqpHnyufoJxyf6Vhxt1A6BbA8lI7w==
X-Received: by 2002:a17:906:c102:b0:b97:b88c:386b with SMTP id
 a640c23a62f3a-ba4229d7784mr517181366b.29.1776666882701; Sun, 19 Apr 2026
 23:34:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251126190026.37436-1-ayushkr0s@gmail.com> <aeQDxUI8F1b7Hy8s@valkosipuli.retiisi.eu>
 <CAHp75VcyO4rJMyVyUP6aKLugEBik_FPsyO4cgbPkTgnKUzhG+A@mail.gmail.com> <aeTOgEq9X192XPgG@valkosipuli.retiisi.eu>
In-Reply-To: <aeTOgEq9X192XPgG@valkosipuli.retiisi.eu>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 20 Apr 2026 09:34:06 +0300
X-Gm-Features: AQROBzBewWjAdKOSwG5n3rKZavdSyvwChWgRt8qbEPE0icMpjbHA5j266FgrIVg
Message-ID: <CAHp75VcHXFr3PrmxyE7FxvzTwkCrPpHKc+6e=ziXCGFrBY269g@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: coding style: Move trailing statements to
 next line
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Ayush Kumar <ayushkr0s@gmail.com>, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, gregkh@linuxfoundation.org, 
	hverkuil@kernel.org, ribalda@chromium.org, abdelrahmanfekry375@gmail.com, 
	santiagorr@riseup.net, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	kernel-newbies@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 19, 2026 at 3:46=E2=80=AFPM Sakari Ailus <sakari.ailus@iki.fi> =
wrote:
> On Sun, Apr 19, 2026 at 11:32:45AM +0300, Andy Shevchenko wrote:
> > On Sun, Apr 19, 2026 at 1:20=E2=80=AFAM Sakari Ailus <sakari.ailus@iki.=
fi> wrote:
> > > On Wed, Nov 26, 2025 at 07:00:26PM +0000, Ayush Kumar wrote:
> > > > Adhering to Linux kernel coding style guidelines (Chapter 3: Indent=
ation).
> > > >
> > > > Signed-off-by: Ayush Kumar <ayushkr0s@gmail.com>
> > >
> > > This has been addressed by commit 003c2c39ec77c84d704ee8effe170fd8658=
fde0b
> > > in my atomisp branch.
> >
> > Btw, can you rebase your branch and drop "staging" word from the
> > Subject in all current patches?
>
> Good question. The staging: prefix has been used in the past for atomisp
> patches and a lot of the rest appears to be doing that as well but
> definitely not all. I don't really have an opinion but we should do that
> consistently whichever is chosen.

I believe you were Cc'ed to the (private) email response from Hans
where he explained why it should be dropped. Let me find if I still
have it and bounce to you.


--=20
With Best Regards,
Andy Shevchenko
