Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6281F9F61;
	Sat, 12 Apr 2025 17:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744480392; cv=none; b=G/vMbwzoX8DU6sq6pCrYhLR/S/Bi7dDbfn4ktDcwMofgBIXbQ/0fTxFbfgc0bWNF7sYYH35ykAPAro9cNHe9PSjK1rIQwyXhqW3OdMii07+YmtKwLMkiLDqzkrB3XxNkmoT9wFgDdRqAClw7XlaE+Q4kM8rgpzx4vm3OD4DQ2v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744480392; c=relaxed/simple;
	bh=4/22I0xmiWJyIUEMNmDdSmsIbv7PSPfxkSn00iJPodU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hIjv1tTCfTVKlU1ugeqx9sQ9VQnZJhllLstloQkgkbVu6hk6BM+GsHzDyaHXOHIGBdnleT4qrt9oy54EBKyLdmyFVWPfDfpm5sKVpqJZ5ScYlAvejKgOw6T8IyTIfplgRRfa0AEWLAK+Q+/PZ75wutexOkxiyYT9lmJWtTfJxnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EgbJ28j0; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EgbJ28j0"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2aeada833so587241266b.0;
        Sat, 12 Apr 2025 10:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744480389; x=1745085189; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTIDIk2RD4/cJXZhbbMkMN1ozONXGjfoBcOhKEuE5xo=;
        b=EgbJ28j05i9MzNE4RnxZv3heLWW0G3EjBZowQAZqpkiLInw/AyInJK8ieI1SCini7T
         3ZFegI6AdXsvx9qdJACTnoettsA+M41l3bFCGEQEBHOt4j4IAbUapBFSFXPztib8VBnX
         Bf7h54NWey17cfDEiVEu2tmAmji5OI4SRP29Ltk+iCNU3B5MwMLrrhPbLfnGZYJn3jAF
         U424CSrUodabi6zecYkauLU/iLKccXkbWF39jmj9pSiFKjrFyFA8QCE7RvDOrDTHTbk/
         O1uuwwE8OkXz+QARJJsWsafP+NA5HBsaS60WqBDN6ODdIWDoJr8l+EMT+UB8CSHBNJNJ
         dCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744480389; x=1745085189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vTIDIk2RD4/cJXZhbbMkMN1ozONXGjfoBcOhKEuE5xo=;
        b=TMkpxqid0+rtKMyHmj+1ethCTbAM57/1WGI1OdQXcG4OflJmtPku7h8YXtCKcM+wIP
         ABwzABwV2SHEbT27UadkqrtK03DZgbXkToFkT22e51t8SRaNLhBWx57kcKrS+7s4Na57
         Bk22wlsR0uvLl84eaJ0ePin/fv1zOh7BbUUo1a0aa2/4phXDvqn5BXYy9pHECMYiBSMW
         Mf7E5VK4S2O0NHeww2dYz6FJV/k7I6BYNaPVj/VRfA8I7nmekxoI/xjib0eXuIIAbgE3
         CT5U/UJA1LS2M71FH/3RhDWdIzU6ISWc718mi0kXIDb4/0+bFCr/Ouya5jNlwOuxwUPA
         7tbw==
X-Forwarded-Encrypted: i=1; AJvYcCWrLxEfrSKuZKUFwgvR8/FLLODTnVOSzbS5AKPT9YHq8AYF/tn1do0u1BlNPSSyFfjZ4/vrW4bp0KrIDC3D@lists.linux.dev, AJvYcCXSzuecqVisbyCgQcF12M04nNcf8bef2SNkPNd87qQkU/knr0HgeZBH/fPqwm+lSNBQEMcaZ7cFFhsP@lists.linux.dev
X-Gm-Message-State: AOJu0YzeVUrmMammnYahTTtqFzT5soDWYT9FChWKQ1COokvMRT/d7dq+
	rEriGGOLSpcyEad5GVqvTovgGJGbaK0VkN3g9/8fk6/FoPSv1RrJBcDkPCsjULhSbBtWOiI7vYQ
	8nqqB8fnhwXuyPQeDPkZiPYqUOfs=
X-Gm-Gg: ASbGncsq8ZzGD1A7lBEBBmCQtT7UyyVPi5O97u1GSqd10mv1likQq8guTIkNdwYLza6
	ci7YDUjnJeUjn+9xO9uEvXU5VIxFUWR63NgKZDC1eyQnm28NnXoGiIUCcIZdhwEZ9R/ITwooa9e
	Z1Q27HcPGRgAFTpZYceCzg5rvYbZCknYSk
X-Google-Smtp-Source: AGHT+IGXxYy5GLEYPwhASMJUu7WvBGCB7hCpf2shHnOJpdkQ69BTD1P8Oi264iRYwSIR+Z+qGF/uXPzF4wK1YaliPgM=
X-Received: by 2002:a17:906:f597:b0:ac8:1bbe:1a5b with SMTP id
 a640c23a62f3a-acabbee7e6cmr876592166b.9.1744480388897; Sat, 12 Apr 2025
 10:53:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z/bA4tMF5uKLe55p@ubuntu> <CAHp75Vd0PUFv_tigmKp7MEiOOuHpFhB_i8u42jZdQ1jajjq0rw@mail.gmail.com>
 <b4904b21-0a41-43f6-b386-dea4e27c7a27@stanley.mountain> <CAHp75VehJd4FUXBJSJh35a6KF3Qr2eBG6PiNogZ1m9SzBph0Ow@mail.gmail.com>
 <209e5330-a4d4-4ecc-8d56-199f4a190c3c@stanley.mountain>
In-Reply-To: <209e5330-a4d4-4ecc-8d56-199f4a190c3c@stanley.mountain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 12 Apr 2025 20:52:32 +0300
X-Gm-Features: ATxdqUFSwpWNfzAo0ElmV_5q1MvPxqlaMq7WQ98tAioZ7pVSAamB26tknu9iyQk
Message-ID: <CAHp75Vdqnk_qNs8Rc4M-Rh5-AXCi4uV+iw6sbHXEZiaBaFoRyA@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Replace `& 0xfff` with `% 4096u`
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>, outreachy@lists.linux.dev, 
	julia.lawall@inria.fr, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	david.laight.linux@gmail.com, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 5:19=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
> On Fri, Apr 11, 2025 at 03:47:40PM +0300, Andy Shevchenko wrote:
> > On Fri, Apr 11, 2025 at 1:37=E2=80=AFPM Dan Carpenter <dan.carpenter@li=
naro.org> wrote:
> > > On Thu, Apr 10, 2025 at 08:43:53PM +0300, Andy Shevchenko wrote:
> > > >
> > > > > $ make drivers/staging/rtl8723bs/core/rtw_xmit.o
> > > > > $ cmp rtw_xmit_before.o rtw_xmit_after.o
> > > >
> > > > cmp is good but not good enough in general. Here it shows the 1:1
> > > > binary, but in some cases code can be the same, while binaries are
> > > > different. To make sure the code is the same use the bloat-o-meter
> > > > tool instead.
> > >
> > > I don't understand what you're saying at all.  cmp shows that the com=
piler
> > > was automaticall tanslating the "& 0xfff" into "% 04096u" so the resu=
lting
> > > object files are exactly the same.
> >
> > There is a possibility that the compiler changes the code to the
> > equivalent and cmp will break, bloat-o-meter will check at least what
> > happened to the size of the *code*. object file is not only a code. It
> > may also contain debug symbols and other stuff which may break cmp,
> > while the code can be *the same*.
>
> So far as I can see bloat-o-meter is only looking at the size.  I
> deliberately introduced a bug to see if bloat-o-meter said anything but
> it said the size was the same.

Not "size", "size of the code" is more specific. That makes the
difference to cmp which may lag even on the same code, but slightly
different debuginfo, for example.

--=20
With Best Regards,
Andy Shevchenko
