Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC4422B581
	for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 09:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733821360; cv=none; b=u81R2qbBEX764PVit6WzCsAMT3irUSFXGX7b7I2j5GUr/3zeJiQobPnQX3+dT29oci8zH45keWpObI6Z4s93uMWLxqJ379Lj+aMTtwO3OwVH2vNz0KZyjMPnK45XGIJY2PqTIgrNjuZ/fltah2A08ro+MjdkFIiRob46E+Kl8qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733821360; c=relaxed/simple;
	bh=gU/nJ5teQLO8Yr0g3gfN2+SqWjZBr2rh+zUl+DWLrVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D5pvDQj4ex50Ryggnrb8491sil6lM2ZVHfqWVo+gyAYKwHP2EzSo+D2TuMOCygFMQuO5tyFRAaSBZvkKmMSGJ/EizJUk/1PnOeQrdZB80k3n6yXYASB5pQDrnvYBP3QJK9Rgh8YbSAamSxvOREviAGjC7X/kpFN5pj1OfS2Jolg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4aff5f862baso941604137.2
        for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 01:02:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733821357; x=1734426157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0u2asYMwtHNjmsewIhDxVhemB7gjctoxb772Jm7kqe4=;
        b=aFBfOUVMl1vj4+d3nAqq6nTzly4H9ns+vgVUA9rg88n/YU5zYdbZO6G9JVKLYVXEVS
         hYpUPC9AfmE2vmjYDe9662bkpVes1jVXH4QoLAPoOA3I7vQVIqDncNg+dvyARRzOr37l
         +fhtafeZBoJ3i2/ECux5bWjrPWAUkE3d1AWpfCUZpx47V7Z/h0HZ9D+2cn7PlSPBvER2
         MP/e9AnTkMcY5pTE+bSYNTK6YYDxAV0HGHxgqaDqW6UfVLhV2Ua85QxklGutvEdk3U5K
         BY71pF411Tn6ix3Jb/bGqSrXJxbUrYdh7a8j9icjlI33jOKi7Gbo2/H9eSCW4DHzODn+
         Mkgg==
X-Forwarded-Encrypted: i=1; AJvYcCUIOtmSuPkXHAXYGcQZGN+59wS8H4wG66O3KzNwp0TuPPOUSQvieCA1fDQV7oas7A4IppFaSWExk3cJ5nH1@lists.linux.dev
X-Gm-Message-State: AOJu0YwlLYfI0cwwtB6lhtQwqD6xlkwQENzdJ/8h2Tq9wFXs3OS7RgGo
	IxaC3IdgqFGBtOEi7K8U9QNHLGEfqUUfcQn54B5CVEMGk7U6W0CiqpBSWuGo
X-Gm-Gg: ASbGnctGCliXLGydaF2u1H01Z3l7B1iZi85LmF4ECAtKXOT4fB6Djd04VQbt9csaPXT
	pDVaUdAGPdw6i5GFBoT8SWcHMJRyl5ckEU2FgyIJup2XW1zlhWwpjsSFTqE7dO6qvGJNElPZonN
	X/Ne+Zc4HzruyhiUIyuyaa1142AeLaRW+XfVqpGq46krA23P+2dP6rn7TD4h+xZQFQgti8hB6I2
	MW9HGI9KwV/xF0ORDN3KwW+OptRn+twPawgxUwGEGeF1t6BxE0yRKVCnfz7AgwoEYAJUjnwd8V8
	lGkot8KFjEMZ5pUt
X-Google-Smtp-Source: AGHT+IGJ0tI/Nzvb6S20X8LSOXB0cSSBp2fRZHTjQpHqFtgXMZevgqH99q+1koAdGMoSsDcP/bkXxw==
X-Received: by 2002:a05:6102:3594:b0:4af:f275:e73c with SMTP id ada2fe7eead31-4b116069570mr4118140137.11.1733821356599;
        Tue, 10 Dec 2024 01:02:36 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c2bd4fc5asm1370340241.30.2024.12.10.01.02.36
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 01:02:36 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4afdf300d07so1666774137.3
        for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 01:02:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWtSfdF/G4bjGRCbuOyGwwoHUpes5KRVJ/MklfFyctxsnpkXXWdh96bOXE3Gs5lTG3SrkCOQyOicEgiJZCw@lists.linux.dev
X-Received: by 2002:a05:6102:38ca:b0:4af:f5bd:6378 with SMTP id
 ada2fe7eead31-4b1160555f1mr3406114137.9.1733821356202; Tue, 10 Dec 2024
 01:02:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241204162128.25617-1-dpenkler@gmail.com> <CAMuHMdVUnr4iAZmuy8Z3S+sCYN4P26RdpPwXevwiJrh+KN025Q@mail.gmail.com>
 <ddc720b2-8bb4-4a07-8280-dadeb2de5b26@roeck-us.net> <CAMuHMdUb-tpmTiKV5BFopCWoY96D_HYNG60Kv+wVRKnDFF+COA@mail.gmail.com>
 <2024121051-snowiness-sampling-2fe2@gregkh>
In-Reply-To: <2024121051-snowiness-sampling-2fe2@gregkh>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Dec 2024 10:02:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV2Nh6ZZ-0tW0dCt5OoBH5_OrcpON32X1YJBQYgF=eywA@mail.gmail.com>
Message-ID: <CAMuHMdV2Nh6ZZ-0tW0dCt5OoBH5_OrcpON32X1YJBQYgF=eywA@mail.gmail.com>
Subject: Re: [PATCH v5] staging: gpib: Fix i386 build issue
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Dave Penkler <dpenkler@gmail.com>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Tue, Dec 10, 2024 at 9:39=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
> On Tue, Dec 10, 2024 at 08:52:08AM +0100, Geert Uytterhoeven wrote:
> > On Mon, Dec 9, 2024 at 5:18=E2=80=AFPM Guenter Roeck <linux@roeck-us.ne=
t> wrote:
> > > The underlying problem is that the code uses a pointer to store the p=
hysical
> > > address. That doesn't work if sizeof(pointer) < sizeof(physical addre=
ss),
> > > which affects systems with X86_PAE enabled. I have not seen the probl=
em
> > > anywhere else.
> >
> > I could reproduce the build issue on ARM, with CONFIG_ARM_LPAE=3Dy,
> > which is not enabled by allmodconfig.
>
> So does that mean this patch is incorrect?

Purely from an arch-agnostic LPAE PoV, it should be:

    depends on 64BIT || !PHYS_ADDR_T_64BIT

However, that assumes the driver actually works on 64-bit or non-x86.
Perhaps people keep an old i386 to control their GPIB gear?

The drivers do not use ioremap(), but just cast the PCI resource
addresses to void * pointers. No idea if that works on x86_64.
It will probably crash spectacularly on non-x86...

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
