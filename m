Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A551CD1FB
	for <linux-staging@lists.linux.dev>; Fri,  3 Jan 2025 08:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735894428; cv=none; b=XI/3PwJskX0mkvGhLTThHDVbDSoaQ+dEwT/OcwF1gRb8+B5b67BCrwoxpYaL7oD5hQcuw7F/oaAZisTui3pu+rqK8AXxMHARmrgLwpbiZUBO5/X+LM2tDbQMgLDSDd42Onkp0tAcIDRUnE5AHBhOw0IRJ1jJL53cTQGmgdDnDp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735894428; c=relaxed/simple;
	bh=hnBq03WxBk2PG7EPavzS0kBmjxZJX+qxr5LBLBcNk+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uJTN7tCr0Nbwmm70pI0ZGW7E21m2EgPC0F7RqxfJlTA1FhcmjpxysXaAz/SZ/KgSqb5F9ylkXe72UUtKcSY7xFEngt2fWkUanaiVu5VZD5NU8m9XF6rv90RVahgXUppsOUbKWjnF8+lpf/jYWMovXiKsKKwnBg+8RD7UaqCWudA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4b11a11a4f0so3060791137.3
        for <linux-staging@lists.linux.dev>; Fri, 03 Jan 2025 00:53:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735894422; x=1736499222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j30abThuUeHkj5Ij3LGKLh6rqpnb67GZgQG4O9gJV1M=;
        b=H2zoa6qffBU7my3hhI2svsQP8jvjx/bjfL5FB0IKgW3K8Y3MUUuzrG9ikv5zu/1ZGJ
         MHC+GBdHaDhIoZzOBtnYaRNjU8PhsWV5WcCv4NE6ZI/t71frvFHAa215nnGWPnUg8Hgn
         n3pQx6ZoMKc7mlylQrdp/XVSFfBvLUMKdgt6O2CZ5DbOJs+HWEpKEH2fWGHJvWCF9zzT
         JN60V0bp8j6Wt4VMd19PPXpuRgn/tNUNgRlh8JW5IEVKbUmY3BvJ9BJnKmjN6lquO5F0
         EV7Z7c2zdIZHMvjKDF/LcqvZJdC5gpdL+C+t0eq7I76xOWgLzQ8q+pKs1hSyXNHIaeXd
         ECMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqgiSUR4RomUOX3rvuZz6Ed/gUkMMgO2WsXUsjUlyqVQVLMZb1o4Z3Gtxx2kKmkZAJkJftPw8Mpyyg9Bhd@lists.linux.dev
X-Gm-Message-State: AOJu0YxunEM6zKoZ1Eu8OiPaxioleGX1EaEpq43fG4fe2O6a/i+wMZRn
	TLtqAZkUg9j7+hHptlNfRRA1L8v5yThYY8EEjTPWL+UOOixZgPx72ZlImN7r
X-Gm-Gg: ASbGnct8u//oNIe9UEZkz+/b3rA72QEyP3JrdNlUs4yX8YpB9kWpKptbMKc5jJXDzRI
	6af/512lrlakYAp59kz5xqmyKcTvyRQs2NSXndCRg0QudlSUQSKt7rY9VbRMxUTJ6u5xxz1mAix
	EkKwIvuupE7B/pW37i34NVs94UQckzCc+lk+l7DB+p8eqMNcElkawQ9DTiXCZ3256rRYVADgl1B
	+7dVmRNJT4PXvRfsBbaCr9bhJuTP4F7p14ad3LlXWWnwUzv3PGacImBcTPtW3K8Dsa62puNxsQB
	8HIn1zSL6JBv5SL3tLw=
X-Google-Smtp-Source: AGHT+IFwzhmi6Rv2CVb7a3geYZmxhTmawskMyz3qh/Mjfy0/O5SYTELzLwioIA93DRmBqepmZ5oVRQ==
X-Received: by 2002:a05:6102:dd1:b0:4af:3973:6b22 with SMTP id ada2fe7eead31-4b2cc4684dcmr39373431137.22.1735894421999;
        Fri, 03 Jan 2025 00:53:41 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad575fasm5432449241.29.2025.01.03.00.53.39
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 00:53:40 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-85baea70afeso2437966241.2
        for <linux-staging@lists.linux.dev>; Fri, 03 Jan 2025 00:53:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW6bFaiG+JPXxBmO3oNyXlFuErtO5SWTzAAtVbw0wUIeou1LUmEpXcZNbrt/3YhSMTUV3GTHdmuq7deNC3R@lists.linux.dev
X-Received: by 2002:a05:6102:160e:b0:4b2:bdf1:c1ba with SMTP id
 ada2fe7eead31-4b2cc380883mr40018988137.13.1735894419660; Fri, 03 Jan 2025
 00:53:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241224080755.194508-1-philipp.g.hortmann@gmail.com>
 <b811d4af6a634d61389dfefacd49853c0e77f1d7.camel@sipsolutions.net> <39256db9-3d73-4e86-a49b-300dfd670212@gmail.com>
In-Reply-To: <39256db9-3d73-4e86-a49b-300dfd670212@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Jan 2025 09:53:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVGdpVqkdvoFxu84YgBh_0fsAKeBhWFEg+nDyGLwbruig@mail.gmail.com>
Message-ID: <CAMuHMdVGdpVqkdvoFxu84YgBh_0fsAKeBhWFEg+nDyGLwbruig@mail.gmail.com>
Subject: Re: [PATCH] net: ethernet: toshiba: ps3_gelic_wireless: Remove driver
 using deprecated API wext
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Geoff Levand <geoff@infradead.org>, 
	Simon Horman <horms@kernel.org>, Alexander Lobakin <aleksander.lobakin@intel.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kalle Valo <kvalo@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	Larry Finger <Larry.Finger@lwfinger.net>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Pavel Machek <pavel@ucw.cz>, Stanislaw Gruszka <stf_xl@wp.pl>, 
	Gregory Greenman <gregory.greenman@intel.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Stefan Lippers-Hollmann <s.l-h@gmx.de>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philipp,

CC hch

On Fri, Jan 3, 2025 at 7:44=E2=80=AFAM Philipp Hortmann
<philipp.g.hortmann@gmail.com> wrote:
> T2 is working but to make this happen the T2 Author has an own repo for
> patches to apply. In the following video he publishes his view on how
> well the ps3disk is maintained and tested by the linux kernel community.
> My impression of this is that ps3disk is not tested on hardware at all.
> You can find this in a youtube video: =E2=80=9CI can't believe VIP Linux =
kernel
> developer BROKE PS3 support=E2=80=9D but watch out that you are in a good=
 mood
> otherwise it is pulling you down like me...
>
> The commit that is breaking the function is:
> commit a7f18b74dbe171625afc2751942a92f71a4dd4ba

Thanks, I see no evidence of this ever being reported upstream, which
makes it rather difficult to be aware of the issue...

> This fixes are not in Mainline up to today. So who beside T2 Linux is
> using this? You can find more of those breaking patches... and videos...

Care to tell us where the fix is?

/me looks at the bad commit...

Oh, dev->bounce_size is used before set. Patch sent.
https://lore.kernel.org/06988f959ea6885b8bd7fb3b9059dd54bc6bbad7.1735894216=
.git.geert+renesas@glider.be

> The following points are also in the list of reasons:
> - This driver has a maximum 54MBit/s as it supports only 802.11 b/g.
> - Using this hardware is security wise not state of the art as WPA3 is
>    not supported.

If you only do VPN over such an insecure link, I guess it's still safe?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
