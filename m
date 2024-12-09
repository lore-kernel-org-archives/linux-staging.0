Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCE22C9A
	for <linux-staging@lists.linux.dev>; Mon,  9 Dec 2024 16:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733761643; cv=none; b=Mwmu7MYZasPUU/pYWdFLjXrCwd3gFhvFxYTRaujnfA8BmaPvmrIK1D1D9cInqCKCGLhssFVK4XZAFll4UpfErILsB/Avhtc97C4RUCWSprULkWiIZG8VaiJbzh+qht6poYhT21oBwt8GDym6GCJZjgfBjOftruj3AQ4C+Zs2Phw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733761643; c=relaxed/simple;
	bh=nC9hi7DObQA8Xd2weeJ23eDukyxFS1fKJy7v2IrOzi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XmFLVUUuR6YuVbWrYoEjZy/tjZ1X/fIDNi4Sxfml7DlWcvqAaWOlcbVwkqYTVj08RZ/IAzM8JSfUt6MX70CnYe9koIqhcfv8vMCaH51vqYVN5LtP9vABOM4q15sS03qmrTulCUgnk4bgvvLCspLDa+ZmvKMaraIJn8Xd9ZHyS8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4affd0fb6adso287485137.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Dec 2024 08:27:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733761638; x=1734366438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EbIgp/7PNgwmdJb3CXsYquHn1gIukIbIKtWuEk8ZUe8=;
        b=FmSvN22D3RYBSrukmmNUuFyDFDxi/6v22foWDUR8qVd8Js/UNjAHACegtju0OZKTmC
         zS96PbJL8qXMpjyNF0T7ZHlKbDcCYh0Xzbe679X/2AJKt+np6RAW0KCQwVwkj8CHfuHq
         e/FZMV2ekvNevEDR+XmCiBhXmszi4/87xUNurr/Y9INNcNeipb+CQF3R8GiR7oHmserV
         mXSEOE1vAmdfTrY8IuHcC+DJZje6o5pBsEWTr7aWe7F8YqZewQwfNCYi6k4f39cLX+O5
         /SZ1gFqudEuDfpIEbZBsu+qK2t224A6sQPTC9+yb/U6KP62AJBgsKupZZ5EhiqmwwVJu
         rDyA==
X-Forwarded-Encrypted: i=1; AJvYcCU+AMq9eu8qYFdJRZHSVjnCsrfK6+KWezfbkqdOWWJ1p1USeXQfi/7lZHjkswVssTB44YGOwcnfNBxF1uP/@lists.linux.dev
X-Gm-Message-State: AOJu0YzlK1T9KyIWwgcxSg1UwV/OEDc7dY8r3yw5egSjmeq70//rVCTm
	Vo4Ugl5gWeVf+7RQeT+rMxxSSDpc3kR7nGNOBk+n4fcIXnSrJUkIYATuo4XkcM0=
X-Gm-Gg: ASbGncsvYbllXybGst9chD57BOHDtpjZwsMR+NBsm1R7tvzbFWhbbX+xXRN7n6zVkWn
	H0iOKSeO+33OzBtXMxyUYeq9MYJCt5lYGQUNm7NSCzG1MGp6GIYJscfioB4TjKOKyDFW4vpia2h
	t5qnQaP2caF6O9Dc3XVisNUGPaAauv0goi9svZECCvgkUARH6xpEtCRcgo5A+QwZ7i4zGDoeLcl
	kQ/u6qWkfDPRHRHBqisTOkSedfISj9uIvVoo2rL2w5EACsjZ1ijbGbBsMV/7A4afS5PfwJXi/jC
	ZPJldXU8hIY6
X-Google-Smtp-Source: AGHT+IHTbeIrG8cERAkwU5BuaQNNgG6kk3OI9PToqbW9AmPmqNWDjRlt/ug8QbWtGQc7/roHIG8TuA==
X-Received: by 2002:a05:6102:2acb:b0:4af:f5bd:6377 with SMTP id ada2fe7eead31-4b11609a0d3mr2080461137.12.1733761638182;
        Mon, 09 Dec 2024 08:27:18 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85ca76b8277sm39923241.4.2024.12.09.08.27.17
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 08:27:17 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4afefc876c6so444838137.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Dec 2024 08:27:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXN16nCGa28yXel86OTmbLpNfMYJbLREEC9wwk+DBfqTzUXHN3kw2wjqIdjQtEoM9uTT6EBan7TU3OsxHKh@lists.linux.dev
X-Received: by 2002:a05:6102:5092:b0:4af:c58f:4550 with SMTP id
 ada2fe7eead31-4b11608da9emr1985151137.7.1733761637670; Mon, 09 Dec 2024
 08:27:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241204162128.25617-1-dpenkler@gmail.com> <CAMuHMdVUnr4iAZmuy8Z3S+sCYN4P26RdpPwXevwiJrh+KN025Q@mail.gmail.com>
 <ddc720b2-8bb4-4a07-8280-dadeb2de5b26@roeck-us.net>
In-Reply-To: <ddc720b2-8bb4-4a07-8280-dadeb2de5b26@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 17:27:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVsmNqZhqxPu1iMkZUqyGUQqyY1ae01JAkE1-AQbiu5mw@mail.gmail.com>
Message-ID: <CAMuHMdVsmNqZhqxPu1iMkZUqyGUQqyY1ae01JAkE1-AQbiu5mw@mail.gmail.com>
Subject: Re: [PATCH v5] staging: gpib: Fix i386 build issue
To: Guenter Roeck <linux@roeck-us.net>
Cc: Dave Penkler <dpenkler@gmail.com>, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi G=C3=BCnter,

On Mon, Dec 9, 2024 at 5:18=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
> On 12/9/24 08:01, Geert Uytterhoeven wrote:
> > On Wed, Dec 4, 2024 at 5:21=E2=80=AFPM Dave Penkler <dpenkler@gmail.com=
> wrote:
> >> These drivers cast resource_type_t to void * causing the build to fail=
.
> >>
> >> With CONFIG_X86_PAE enabled the resource_size_t type is a 64bit unsign=
ed
> >> int which cannot be cast to a 32 bit pointer.
> >>
> >> Disable these drivers if X68_PAE is enabled
> >>
> >> Reported-by: Guenter Roeck <linux@roeck-us.net>
> >> Closes: https://lore.kernel.org/all/f10e976e-7a04-4454-b38d-39cd18f142=
da@roeck-us.net/
> >> Fixes: e9dc69956d4d ("staging: gpib: Add Computer Boards GPIB driver")
> >> Fixes: e1339245eba3 ("staging: gpib: Add Computer Equipment Corporatio=
n GPIB driver")
> >> Fixes: bb1bd92fa0f2 ("staging: gpib: Add ines GPIB driver")
> >> Fixes: 0cd5b05551e0 ("staging: gpib: Add TNT4882 chip based GPIB drive=
r")
> >> Signed-off-by: Dave Penkler <dpenkler@gmail.com>
> >
> > Thanks for your patch!
> >
> >> --- a/drivers/staging/gpib/Kconfig
> >> +++ b/drivers/staging/gpib/Kconfig
> >> @@ -50,6 +50,7 @@ config GPIB_CEC_PCI
> >>          tristate "CEC PCI board"
> >>          depends on PCI
> >>          depends on HAS_IOPORT
> >> +       depends on !X86_PAE
> >
> > !CONFIG_PHYS_ADDR_T_64BIT, to match the definition of phys_addr_t?
>
> That would be wrong. It would disable the code for all 64-bit builds.

Oops...

    depends on 64BIT || !PHYS_ADDR_T_64BIT

Assuming the driver actually works on 64-bit?
Perhaps people keep an old i386 to control their GPIB gear?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
