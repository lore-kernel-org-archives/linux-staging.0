Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED411F9EDD
	for <linux-staging@lists.linux.dev>; Fri,  3 Jan 2025 11:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735903015; cv=none; b=XZYEOyWSZkRlLZF8O48WbkHCBv2na2pVpEPToRCcd0A0EeAklfyE4qKRd6k8AZzZ8mzXpG5+bWGDlBgZAoS/7QC/rqsF7v7FQYTj1lbMSn5cdrO/vhHwcJPkslTAa0m9aYGxPAFPbqaE7SjnVNCv+3rvNUkaEwwrJ58FCHx1gOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735903015; c=relaxed/simple;
	bh=L46r5y3XyXMN/GlccWSjfXZAWkNDi6AOwGcboh8Kgt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k3rdBJ5eDljbhyLHBhGNl2hVog9pss8MUH7v5oVyUy5juTJRNkIf4cmDHhCoQ2Fhiswyu2DcIX6j/K+1CE/1muqr6bvLF4kXo8xwdy7vsjzm8oHGjSgYj9LS8xoHpFwLjGURhJ/3dho33jyxcbFui25sZum8ysSEfJGYILDfMbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-85c4e74e2baso2181250241.0
        for <linux-staging@lists.linux.dev>; Fri, 03 Jan 2025 03:16:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735903011; x=1736507811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmSRcWChTP1b8zCChxx/86+scbNEDzughwHQ+tv0ThM=;
        b=R5eeXwwnv0sTImrleyf/+ljAF3FhxNvi/Rk2kipuDH9to+0kfPTlC15t2bKc6XBxKD
         XdNuvGXTvLecoshsTlOc+lMnmg33Cd4SbVMz++XSbyvrCf1X71fDlFoNM98gfRkTeMMk
         j1xKaisJ6bZaBLBrEh8R8BwqYwpHAw1fv/0gWMM2JcHCMBebzaeaB8VPqmHv64bIGniC
         djh5m+5/kDyBDEyRT2T6RhrekQklibUZBU+g5YQInibMbDKUJ8eGmSTy854+sK7g22oW
         t7h0W8HQxpiYddyjZu9mRRiacNcHtusrs45T2XBgC0G54fq3vr4ZoGWm+HBE9TatnyQb
         ezQA==
X-Forwarded-Encrypted: i=1; AJvYcCVWz1RmKMfOBugVKOhlhRxuprMPICKFbJDtiGSEnd9FEFwG6FuCs0hK7nujV1+Bek9MaQyTtMkZDi75ynhk@lists.linux.dev
X-Gm-Message-State: AOJu0YzTqujsv9gMyjeA85UDPnaI0X3Nvx5WH+B3Jg7fNpGmajJStjsD
	ZoJVfon6V7baNPpEAbQOZtO6rWFSF6YKnJ64iwr0cP/WlaEA5hUw6X5TyQXyoZI=
X-Gm-Gg: ASbGncvZXG/7i9r/sDtAbL7kNyM+p/dN5Lyk27qmCSXXvvLw82lFG2FaKvkOMD1nq4h
	lajoXAnZMHAKzcwScFyrombXTZOOxrgP46v9E868JlR00IeFAG5saIcxB9Iu8mz6YZAfg+hhMDX
	g5376enbZsytdo+VIz6Hw+BU0Wh3PZGv2+iA5LPzT21/FWq5UERlycZUcTHtnR5hSBR1jYfQub8
	SWII3Qa6ZijB1XGuRW5zyPLJYZIWLZa1kLnI0qNe9aO1NNTbdnvrWz7L1jmN0WUJUyN2jiMLGo7
	mbfggwf2oNvwMYggQ+8=
X-Google-Smtp-Source: AGHT+IGi2dEm5oq67C0dMhjeJztFpy7VSQQfL1dyZA5OUse8S/oSnJn4EGiRo5vHpgwX8X55Se3X4A==
X-Received: by 2002:a05:6102:809a:b0:4af:f1fb:1c36 with SMTP id ada2fe7eead31-4b2cc358579mr40656966137.8.1735903010944;
        Fri, 03 Jan 2025 03:16:50 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ac4bce7sm5338185241.13.2025.01.03.03.16.50
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 03:16:50 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4affab62589so3187097137.1
        for <linux-staging@lists.linux.dev>; Fri, 03 Jan 2025 03:16:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU/kzv4/rGcZkdjTjCIHZ0maRKcFkBISJMJS7ioOmWs4AA8scgyRyNNuPFDFBfZDFVjG9QoNeAtgu0DEU+q@lists.linux.dev
X-Received: by 2002:a05:6102:3e83:b0:4b2:af6e:5fef with SMTP id
 ada2fe7eead31-4b2cc35c2d5mr38018549137.9.1735903010498; Fri, 03 Jan 2025
 03:16:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241224080755.194508-1-philipp.g.hortmann@gmail.com>
 <b811d4af6a634d61389dfefacd49853c0e77f1d7.camel@sipsolutions.net>
 <39256db9-3d73-4e86-a49b-300dfd670212@gmail.com> <CAMuHMdVGdpVqkdvoFxu84YgBh_0fsAKeBhWFEg+nDyGLwbruig@mail.gmail.com>
 <8dfe122d-ce0e-4a1d-9a2f-f7585036b989@gmail.com>
In-Reply-To: <8dfe122d-ce0e-4a1d-9a2f-f7585036b989@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Jan 2025 12:16:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX_P9WGBiShm6Dp64Y9GRvESH-Nn=b=rRrsGbwza81VeA@mail.gmail.com>
Message-ID: <CAMuHMdX_P9WGBiShm6Dp64Y9GRvESH-Nn=b=rRrsGbwza81VeA@mail.gmail.com>
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
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-staging@lists.linux.dev, 
	linux-wireless@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Stefan Lippers-Hollmann <s.l-h@gmx.de>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philipp,

On Fri, Jan 3, 2025 at 12:02=E2=80=AFPM Philipp Hortmann
<philipp.g.hortmann@gmail.com> wrote:
> On 03.01.25 09:53, Geert Uytterhoeven wrote:
> > Care to tell us where the fix is?
>
> please find all patches for T2 on this page:
> https://wiki.t2linux.org/guides/kernel/
> More exact here:
> git clone --depth=3D1 https://github.com/t2linux/linux-t2-patches patches

Thanks, but I cannot find a ps3disk fix there?

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
