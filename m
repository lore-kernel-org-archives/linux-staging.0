Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439B83446DE
	for <linux-staging@lists.linux.dev>; Mon, 24 Nov 2025 22:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764023739; cv=none; b=AOn52WpU8fD7H3S86djsCH+/XCwAm+CQHU/tID0S+eSAFuAa0a2l6a2z5SGURK7Cto6DgG6d7Ge2lg8w/uZtYuif9OeXfQ99GNiy6CEgvOc9vMCY8X6tZJhRwvYtvegmoA83Hpm6XBEyPCRrm5mpR6h7uPJPZ7M7RgLZBwEaLL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764023739; c=relaxed/simple;
	bh=wwn3C6SmwXX7qD1vR5eRR/72OXtljhMYw/HHmwjIllA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tw4CLvFA26p1YDC7d+/efFUamuco6AXOXsJgw93UZFm21AtZAYhuJ948jgTO40xSHUI8QWs1+9EM22Ds+b/HBOPf4jetjo68s8cr7zFYiL8G1gM5SXHdtGTP6zqmfe18e9hC8TGFxuwXbr3wqsiPNh7CW/tECNPtooVXv6VquVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qjhsDTCR; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qjhsDTCR"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-295c64cb951so67585ad.0
        for <linux-staging@lists.linux.dev>; Mon, 24 Nov 2025 14:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764023737; x=1764628537; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rm7sHRT2eanco6NQl01CJ9NC4dDuPgnR1DJ0V4Elc4=;
        b=qjhsDTCRCGiJ1GiyPLPXQ9pfk/F5e5rw3VODnQastxE+ofiexkuLotZ74WIXp/V4Sc
         vK4g1Zo4NeFraD6ZgJJeBT1CnHmnhfjt0foI2Zm/fI7zqCo4iQJMAXTwJbL1uMo1Vuu8
         CWKiUUntBQfzUlrMEE8wD34Vog61GJhFeEEwJJCbq/Lsn8CbRo//cdGymimscxWXRq6n
         mKh4jqCQfkupiPA2UFvT5ft6MjYdDLLDM+N0tGEEessfV3KogEEBxJ7HyS3Mwr3r+z3O
         WtovLOD6ulPoHimKTCcbzTNR9ZySh1tWoTlZfzW6oL+MqHqLDHhV+MvHBrA9/xfCsfKN
         HzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764023737; x=1764628537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0rm7sHRT2eanco6NQl01CJ9NC4dDuPgnR1DJ0V4Elc4=;
        b=L3IrN78+iNh5P2HeXIA1gahde2UdZVlatd4JFbbfHtnhgCGNG6puDx3o71debA9ltd
         ukQoNbCk8/mte7UdAU2RMkx3dcwCJXYMasPONf8IF+Owxsfil47eb61iTs5ojNwu+tjN
         MiOTUCkuhtx2NTcBW3zrOIge6FLvMj8cd4iSdAe1BpwuZ5a69hKr6HtfPXucjlVMw558
         JCIWxoycYgY+cBMcRC+hv5auA1jXcjX7HkFNqZhNzVcLA3QGR/voIONcp2exoxxJ2mDO
         fkisVE4/780GCetSEWrHoFnc58vnUIA0VGVc/B34CNHHHWS7CelSJfUXmivhji2eAd5T
         2xjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWP7S9zIdc0t7gc950dFt/0qNYfeTqHenWm0f3YSRD9R3z3sndCNdBRa/OxKUuReVpLHz7agmcZPBZ787M@lists.linux.dev
X-Gm-Message-State: AOJu0Yyzqi1X1e9skUH2Hc3CWa0AWvRrruWitkBAMdTv7dwfRi7ykc14
	mrwVNAbh3/5Ub/tndT0+Z+VF+VfK/8XkR4BR67Iu/a6MUiqtbae0SmfDLneEyDLA53AGwOzK/ke
	yGu/27GZsCCG6IddmO46ycPbwzvuvGl/EdWAFSEBq
X-Gm-Gg: ASbGncvfSOGdlat3X/q1h0fSaPpnjv4bD2/HKtILQE7h8kQQjbdeQppGSqIhrLXf1db
	m/wf8gA9OwH/knaaH9FkimBDC8sL1NRh8yPCEKo14jVKTeERd1XUxTtgdOyDnu1+r89bfZmKQ2k
	9O/Tott9eWbl4pN1YoGeUiVbUCK5UBanegrLdxBeYdXF0Ypx9E0XJ1KxkqZMBJfzRT2IBLVnYVi
	e0DfEAPmGpFUJ0a9Ozgd5al94A15VBf6LY/l9xBAcGx7P/3gjkYpbeAJJYLcI3ydWi7c7FzwgBH
	un4Hmh3v6giU6usWUFY4yAvTcfex
X-Google-Smtp-Source: AGHT+IEvA8d/tes341pYVwfvG5w7JYfrKXszTFNpK95gXKemJVaDaZml8nzLkZsHA7yM8KvhAf2HiKyxbQ9t/OMpykg=
X-Received: by 2002:a17:902:dac1:b0:271:9873:80d9 with SMTP id
 d9443c01a7336-29bac26a085mr212105ad.7.1764023737246; Mon, 24 Nov 2025
 14:35:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <176398914850.89.13888454130518102455@f771fd7c9232> <20251124220404.GA2853001@ax162>
In-Reply-To: <20251124220404.GA2853001@ax162>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 24 Nov 2025 14:35:26 -0800
X-Gm-Features: AWmQ_bkxc4I8qhn5g5WZJ0gfV7C1dK0WPhgr9qMe0bfuYOJKDNVyUvJJdliHFtE
Message-ID: <CABXOdTfbsoNdv6xMCppMq=JsfNBarp6YyFV4por3eA3cSWdT7g@mail.gmail.com>
Subject: Re: [REGRESSION] stable-rc/linux-6.12.y: (build) variable 'val' is
 uninitialized when passed as a const pointer arg...
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernelci@lists.linux.dev, kernelci-results@groups.io, gus@collabora.com, 
	stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 2:04=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Mon, Nov 24, 2025 at 12:59:08PM -0000, KernelCI bot wrote:
> > Hello,
> >
> > New build issue found on stable-rc/linux-6.12.y:
> >
> > ---
> >  variable 'val' is uninitialized when passed as a const pointer argumen=
t here [-Werror,-Wuninitialized-const-pointer] in drivers/staging/rtl8712/r=
tl8712_cmd.o (drivers/staging/rtl8712/rtl8712_cmd.c) [logspec:kbuild,kbuild=
.compiler.error]
> > ---
> >
> > - dashboard: https://d.kernelci.org/i/maestro:5b83acc62508c670164c5fceb=
3079a2d7d74e154
> > - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-=
stable-rc.git
> > - commit HEAD:  d5dc97879a97b328a89ec092271faa3db9f2bff3
> > - tags: v6.12.59
> >
> >
> > Log excerpt:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > drivers/staging/rtl8712/rtl8712_cmd.c:148:28: error: variable 'val' is =
uninitialized when passed as a const pointer argument here [-Werror,-Wunini=
tialized-const-pointer]
> >   148 |                 memcpy(pcmd->rsp, (u8 *)&val, pcmd->rspsz);
> >       |                                          ^~~
> > 1 error generated.
>
> This comes from a new subwarning of -Wuninitialized introduced in
> clang-21:
>
>   https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd09=
1d441f19b319e
>
> This driver was removed upstream in commit 41e883c137eb ("staging:
> rtl8712: Remove driver using deprecated API wext") in 6.13 so this only
> impacts stable.
>
> This certainly does look broken...
>
>   static u8 read_rfreg_hdl(struct _adapter *padapter, u8 *pbuf)
>   {
>       u32 val;
>       void (*pcmd_callback)(struct _adapter *dev, struct cmd_obj *pcmd);
>       struct cmd_obj *pcmd  =3D (struct cmd_obj *)pbuf;
>
>       if (pcmd->rsp && pcmd->rspsz > 0)
>           memcpy(pcmd->rsp, (u8 *)&val, pcmd->rspsz);
>
> Presumably this is never actually hit? It is rather hard to follow the
> indirection in this driver but it does not seem like _Read_RFREG is ever
> set as a cmdcode? Unfortunately, the only maintainer I see listed for
> this file is Florian Schilhabel but a glance at lore shows no recent
> activity so that probably won't be too much help. At the very least, we
> could just zero initialize val, it cannot be any worse than what it is
> currently doing and copying stack garbage?
>

Or backport the patch removing the driver ? It is in staging, after
all, so I don't know if there is value in trying to keep it alive in
6.12.y.

Guenter

> Cheers,
> Nathan
>
