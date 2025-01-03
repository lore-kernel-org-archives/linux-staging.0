Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29BD1CDA1A
	for <linux-staging@lists.linux.dev>; Fri,  3 Jan 2025 09:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735896702; cv=none; b=oN4IMdQFeQGycYuPL0IURuP9oQJs/B2W0bloyoYzhHI1e7Qc57StBP3bOf0j9MANlUxI4viDmzbw2ky6e9TAllHO4TDskO0lP5JPEovmTH2SvbtQdDmbUvRsktYnarG+dEqOCuS8u79mSx2jY4vqmGW3Dx1Sdndb3wLkOUJ9JW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735896702; c=relaxed/simple;
	bh=GEfzkV0EtIyjRBocsE1C64+YgnJLZHuYD/FZvAzNRK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GjTNuj1kZtMn1pSWU8EWgAPxFgGDE0PIpOfn7h+px9r2A+7if5LXiEs/xs3L1LJtoWAxC/r7MBNempUJQrlQ4LvXq0B6y6melCiFaQJGuMM6Bd80oE/mKaTru82gRSttHHs6LiW+EyYdgFbiWjx4xuYG+u/Hvuvz8AX8Ogk4nyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3eb98ad8caaso6783544b6e.0
        for <linux-staging@lists.linux.dev>; Fri, 03 Jan 2025 01:31:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735896693; x=1736501493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjhYyamqLdDEJy3N4MKnSa94M/Zio7ELm/v+tKn61jg=;
        b=Axz5/yOOx3Mb92qU9FuIOKct2I4Movbbz0Ah9CfJv1+3xTW3pJ8W0SU5kq0MvP4EKn
         Ay3ZjpD89LeALYXX6pHscUuNZC6YbNLYNuFEGVw53i1mymNpRvzli0oewANCFMj/WnX0
         Wnh0EYi+3345LisbtTFs1lM/77I6sj/fxAChkcEbSBx5i+iO/H0zMr5pGD2b+g52/8LW
         eh64/yGnHSAUPp7m0AM9+wmX5+PGqmXiqkSWDlrkUfr5wCsy0bAoqqVcd3Brl0Pc5q5f
         1I00tqLCIrYcWlGBlL/5O1LQ/0qMfFDqb4OweUq/W68QTTvRQYJh9QYJlnyYailo2MEq
         rERA==
X-Forwarded-Encrypted: i=1; AJvYcCVY0a6mIVBcf4OXLxmYlS5mQ0qQfAGWb1WtdOE+K7WQBllH1TqbwYJQCu4e2kpii7Q4R87mLY8Mp5SS1KRM@lists.linux.dev
X-Gm-Message-State: AOJu0Ywe59RXyBFKS9ziarkOgkhUM/2cIb1NGmHZTeUEIfFVEcGHlJUI
	0TYliQa+B7R3hq5XtBOn+AqFQ8Ll9erXnc3eJgyLDDn57vsXg2OjsuTLUedk
X-Gm-Gg: ASbGncu0oO4Tl+QZITQqC+uuvl2BhkQHXExJC2OQjVOLlU3kOGdqUHJyFkkz21QsAMA
	4bW7wQE5bGTLB5t7pdsY5EZdH8l0gdJa0iBR+wJ0f6Zc+rWM1+N0sERNeMSMTlUdqH2mlN83hve
	AUcv6mA651rXcntm/0M3/n25i1cL+ZbFzRu1KWPXRLnklbUclACG7gNs9Wtgi8D94dj5f2DwlVn
	AgyTEwLOcDBnV7DSrWVANKJEREnScPJ/FfIvDfH1LofjlJJI4En0ixK1PslvGc3hEn7l/iiOQiR
	WMRRVR52obGZycHYwv0=
X-Google-Smtp-Source: AGHT+IGThFGtd5mwXKc6CBe/Rahjx9Nqt540A1NIC5xG7txNgqvWmfQgZ7L0vOjjlxBUQslzCUNNQQ==
X-Received: by 2002:a05:6808:13c4:b0:3eb:938f:4b73 with SMTP id 5614622812f47-3ed890a69d6mr25675888b6e.32.1735896693279;
        Fri, 03 Jan 2025 01:31:33 -0800 (PST)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com. [209.85.161.51])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ece244e2efsm8132463b6e.10.2025.01.03.01.31.31
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 01:31:32 -0800 (PST)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5f2efd94787so7351268eaf.2
        for <linux-staging@lists.linux.dev>; Fri, 03 Jan 2025 01:31:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUP04L1fH6kjZOElESS7C55LYV022NS/blECAMEpL4h2/IrqfOSVNUy72jgyobv88TKv4IjRwGABvJOLZ6h@lists.linux.dev
X-Received: by 2002:a05:6102:50a7:b0:4b2:cbe5:fbc5 with SMTP id
 ada2fe7eead31-4b2cc462478mr39231786137.20.1735896368688; Fri, 03 Jan 2025
 01:26:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241224080755.194508-1-philipp.g.hortmann@gmail.com>
 <b811d4af6a634d61389dfefacd49853c0e77f1d7.camel@sipsolutions.net>
 <39256db9-3d73-4e86-a49b-300dfd670212@gmail.com> <CAMuHMdVGdpVqkdvoFxu84YgBh_0fsAKeBhWFEg+nDyGLwbruig@mail.gmail.com>
 <11ae0b7362284d4828021068b05b38a280a9cee5.camel@infradead.org>
In-Reply-To: <11ae0b7362284d4828021068b05b38a280a9cee5.camel@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Jan 2025 10:25:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXPSK-6_bMoiJyAsV4nhfW7HytZpOpf7Odg-4YKYNZfEA@mail.gmail.com>
Message-ID: <CAMuHMdXPSK-6_bMoiJyAsV4nhfW7HytZpOpf7Odg-4YKYNZfEA@mail.gmail.com>
Subject: Re: [PATCH] net: ethernet: toshiba: ps3_gelic_wireless: Remove driver
 using deprecated API wext
To: David Woodhouse <dwmw2@infradead.org>
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Geoff Levand <geoff@infradead.org>, Simon Horman <horms@kernel.org>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kalle Valo <kvalo@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	Larry Finger <Larry.Finger@lwfinger.net>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Pavel Machek <pavel@ucw.cz>, Stanislaw Gruszka <stf_xl@wp.pl>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-staging@lists.linux.dev, 
	linux-wireless@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Stefan Lippers-Hollmann <s.l-h@gmx.de>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Fri, Jan 3, 2025 at 10:14=E2=80=AFAM David Woodhouse <dwmw2@infradead.or=
g> wrote:
> On Fri, 2025-01-03 at 09:53 +0100, Geert Uytterhoeven wrote:
> > > The following points are also in the list of reasons:
> > > - This driver has a maximum 54MBit/s as it supports only 802.11 b/g.
> > > - Using this hardware is security wise not state of the art as WPA3 i=
s
> > >     not supported.
> >
> > If you only do VPN over such an insecure link, I guess it's still safe?
>
> Why VPN? If it's public Internet that any you only use secure protocols
> such as https/ssh/etc over it that's just fine too.

Oh sure.

I was also considering it from the side of the wireless access point:
if you have to provide an non-secure access point just for your PS3,
an attacker can not only impact PS3 wireless traffic, but also connect
to the access point.

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
