Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FD92367A3;
	Fri, 11 Apr 2025 12:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375700; cv=none; b=mN9YyjZdv2bUMcPxpPOnZ1Y6vjAnL/6sOfF/h0oPfsDZpf4NKyVPeTb6w/J77sMBN7j4dFjeHQUelz7WB05RADju38sMFyjLbuxqGv7c1LQhRZUyQ41viVCE/xkbcc/go1iMqqHbBPUGC4Fs00mF8sYi8Zvt93Ohdj6suLj+3yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375700; c=relaxed/simple;
	bh=iIXhUTuTMVRtBV6akmIRKiVFuAsKIeKfSEx1kF6Jb8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tMxbehNzlg36GBqBGPPBRJ+mC1mZYQbRM3vRDFuS62qVbZmoOO5ubZSiiQjl5CDhS9hlVIQ6lPwwNRfSFfJzG678K9PE9sXHtTLvVGNmHDwplW7F0c0cgeGG1tyxabi6689qymr6FQ0pJGHhZzSWH7BDwKzgoMU4pNv2WwZMXoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PV/urfa5; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PV/urfa5"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2963dc379so316934866b.2;
        Fri, 11 Apr 2025 05:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744375697; x=1744980497; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uUhACwZlOE2GToixSeEf4eAlE3fOBpPw4pGGk5hedw=;
        b=PV/urfa5zJQq92bpn9VePHo8xsN+FCAjx8EmNKQNXQxynbGuRsmL1rBPZ9y1CacElw
         U/uye+m5P6U6mCCo3RmJ2GvwVdzlr1dHPU1zE9tUtfrQwexBcbQ170XBMRUGMgamMsU8
         4q8Jun4QHZ44vXe/CikdAhav6J0/ZSxGt5JYQR5Vox+wgBGOGLEMpzX9nt8on/wWPVlP
         /COh4B/+kdCT1ib/Zj/rLUBxkHhEMDDTrGaMRHNW4NyhYv0GISAfmZmaPHX5JvLMNOGY
         EUGfncKRhxzYL4laG3cl5NWXnrzlasSQ31yrjw6hHQMiysHmxmwGNcGARSx4nx/2xATR
         NVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744375697; x=1744980497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/uUhACwZlOE2GToixSeEf4eAlE3fOBpPw4pGGk5hedw=;
        b=nzbVvWUQp3PsUCglM/+qr54qU2OnESTbCAUxUSk8gcPR3VY8MVjUSjTjHMsl9pQM76
         gPo6Po8Ks6Y2uN5Kyjs0oiVrtxGWzXCqLikMdJngBkvrlDoIQvF9bCO2TRSSWWuuMJf0
         cEvWGeNiaUPJP/bmjd/VIFxKnyXgUwaUDZrl79B2bMXA2GYKxZJ6U3xevn47ihJ5WsY3
         RZdsQ3Pz55eqVE3lT6iEkJFZMVJbg9iyWdtSPsGMFTESB4m4+wXROVpqB+HD8CSgSxLo
         DdLd0a7zYHle45yKq3T1n+K7aUZjRx7q+f7QemCyeMoZluQwP6/MHJCUxRKBOxzPqiHH
         rcvg==
X-Forwarded-Encrypted: i=1; AJvYcCUaNpil2O9ZH2BYtbnc8I7R6WkNU5YX6q2HEX9BmBw9+kE196mgUu8D0hk6mmwgOzESY5TzQKY2AfOst5rg@lists.linux.dev, AJvYcCXMV9/7ROxSJjuahzoDpCSLAb/LLHitIcx2AFRyQYFjMFPFFwUElkZ6g2SiDg8mkZF+aDAfJ98qkVRP@lists.linux.dev
X-Gm-Message-State: AOJu0YzYl+V6Kw9hL6Bp0hYbcL8DnlPTMsudfxlth7bvu2YlOExPIicT
	p5EfgZPujQ9HnvVDcWeQRd4RULXdlFFJBlYU3X3cpo3tfyWcKHpF1MjksFx2Z8cGqyFwPp4wvjV
	SqGjdFj7wbm5ekybYHIr2niVKkWE=
X-Gm-Gg: ASbGncsP8hWkGKT6g+9fzDL/10HdztFM3pHvDJoKa5l15kniX4ZVd/f2djI94p+Ev9H
	Y5MvKQusZyypgfAQtUqcHrny512qRD1dZ/9PIgVC4jgPRVTv6TsXxT6UklbCtuuL7ofiNJRqifN
	GTh2CfOv7yjOKxivf0kmgsww==
X-Google-Smtp-Source: AGHT+IENqg2TMgVvXnFD8HPwGEygChGNKLbwW1vPhSEy0Hge9XMVbW5fpxQYCipcWET9fpnnP8CwQ0J5aummKNhaga8=
X-Received: by 2002:a17:907:6ea4:b0:abf:7636:3cab with SMTP id
 a640c23a62f3a-acad34c6e2cmr210546066b.29.1744375696469; Fri, 11 Apr 2025
 05:48:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z/bA4tMF5uKLe55p@ubuntu> <CAHp75Vd0PUFv_tigmKp7MEiOOuHpFhB_i8u42jZdQ1jajjq0rw@mail.gmail.com>
 <b4904b21-0a41-43f6-b386-dea4e27c7a27@stanley.mountain>
In-Reply-To: <b4904b21-0a41-43f6-b386-dea4e27c7a27@stanley.mountain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 11 Apr 2025 15:47:40 +0300
X-Gm-Features: ATxdqUF-_H-8QqtApbiHgqOdbAIohEab_xD36YpEQTHp3CadLWW5d2dKWwCOkD4
Message-ID: <CAHp75VehJd4FUXBJSJh35a6KF3Qr2eBG6PiNogZ1m9SzBph0Ow@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Replace `& 0xfff` with `% 4096u`
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>, outreachy@lists.linux.dev, 
	julia.lawall@inria.fr, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	david.laight.linux@gmail.com, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 1:37=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
> On Thu, Apr 10, 2025 at 08:43:53PM +0300, Andy Shevchenko wrote:
> >
> > > $ make drivers/staging/rtl8723bs/core/rtw_xmit.o
> > > $ cmp rtw_xmit_before.o rtw_xmit_after.o
> >
> > cmp is good but not good enough in general. Here it shows the 1:1
> > binary, but in some cases code can be the same, while binaries are
> > different. To make sure the code is the same use the bloat-o-meter
> > tool instead.
>
> I don't understand what you're saying at all.  cmp shows that the compile=
r
> was automaticall tanslating the "& 0xfff" into "% 04096u" so the resultin=
g
> object files are exactly the same.

There is a possibility that the compiler changes the code to the
equivalent and cmp will break, bloat-o-meter will check at least what
happened to the size of the *code*. object file is not only a code. It
may also contain debug symbols and other stuff which may break cmp,
while the code can be *the same*.

> ./scripts/bloat-o-meter just looks at the sizes so it's less useful in
> this case.



--=20
With Best Regards,
Andy Shevchenko
