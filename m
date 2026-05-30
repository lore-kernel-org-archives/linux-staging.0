Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5976348452
	for <linux-staging@lists.linux.dev>; Sat, 30 May 2026 16:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780159399; cv=none; b=oYFgfzNb9buG3vZK8JR4+FyF0V84zIObxz+b/JhSkdtvE0HMFvm2OLJATkqFaDTHDcROtEPnOOTPhYwmV9oBeYL6kdO3ac0oMyDJ2VIZTL3kJ+KmT9wku+cn/9IXYFBBT/LMMKexP9kojtq4t5V5hPjA659YTqCZ9UEnpB53ico=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780159399; c=relaxed/simple;
	bh=wXrTrHg7jThfvHpbPuI4wb8lylFg+0R9kOLuU7injEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j1q0niWQwaJmpHXI1qA03dUXw4YA5w7da/6Jzf9D0x7JEAEuSiA57kxtZiguKAGOQYNKaEJYxdmP3nhFIh1Pw5dwglIZ4sNCf3FyJpQtL1Vca0smLkzCjygGSX82fMcblrVwRLbBHXNlcAEknEVUsKXR43moG0Bd7XyG9c4cz44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qtjxk4cT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qtjxk4cT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D341F008A4
	for <linux-staging@lists.linux.dev>; Sat, 30 May 2026 16:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780159398;
	bh=wXrTrHg7jThfvHpbPuI4wb8lylFg+0R9kOLuU7injEI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Qtjxk4cTmrxuyYwRg0Gn/54Zo7PflF3XoWSNhJqxxeEtgel+rF9QJydQjc/Gyy8/Y
	 6UkFPGzspzkdMKLOBH/k1c0T5DyaW9JxWEkEeG7gUz2ctFS8oo2JwJJbEBMKl5n/pV
	 JegRUzdxEElfST3kpdXdyi0/ZoPS3Zo1XmRmJBRoam1hX8ajz1BIiKKJA8SdSJ+PW0
	 9rUUUvbLFl6l/hFnHSE7Ck5KMbsS5B9u94sAoU8T0dWR+CNGqovTthKJYdpbMNWO7O
	 puSXtHwRa5FHLCUYaq7kj3TSIYssDZk1MBoo43FU6gCALFJPo5M5KFAX4Q4GLZvAqd
	 /Ib1a1urHIM0w==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-396775c2720so139091fa.2
        for <linux-staging@lists.linux.dev>; Sat, 30 May 2026 09:43:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/kF6u+gxCzC/+4sHd3z9weTvydzPVEpXMDlNS3ENoXXWrBZ5/8PQjg5a2j+m6vNw8X46v93Z0VeNHST1s4@lists.linux.dev
X-Gm-Message-State: AOJu0YyVdkC20RchgA0CvoTOXmMYreKc9z/GQ44q5plXYfz/mH3Z4f26
	WeZot9UxlErSHY252a4otp8r37NElhmdUu8rO1HS2+jJ7OmFurBRTCXRxO7W7Xsnn7BwVZd5bNN
	rpj7spKJyzTeYO+2GrziwCqf/OLzl/pc=
X-Received: by 2002:a05:651c:20dc:20b0:396:5731:db22 with SMTP id
 38308e7fff4ca-39664edbde0mr9068591fa.23.1780159397154; Sat, 30 May 2026
 09:43:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260505134812.408316-1-wens@kernel.org> <20260505134812.408316-5-wens@kernel.org>
 <JyKk48uGRMGhs1Z-wzq5pA@gmail.com>
In-Reply-To: <JyKk48uGRMGhs1Z-wzq5pA@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 30 May 2026 19:43:05 +0300
X-Gmail-Original-Message-ID: <CAGb2v64wDvLMFn9DYs-kH1S2PpHJat-imxR5eJSQAUYjOp=Xdg@mail.gmail.com>
X-Gm-Features: AVHnY4JPf-OCVxDr7xF6UmPyet8eqBpmFwZfdZsz7_1mZVTdUTpZyn83IUGk-ro
Message-ID: <CAGb2v64wDvLMFn9DYs-kH1S2PpHJat-imxR5eJSQAUYjOp=Xdg@mail.gmail.com>
Subject: Re: [PATCH 4/7] drivers: staging: media: sunxi: cedrus: add H616 variant
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 7:18=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrabec@=
gmail.com> wrote:
>
> Dne torek, 5. maj 2026 ob 15:48:08 Srednjeevropski poletni =C4=8Das je Ch=
en-Yu Tsai napisal(a):
> > The Allwinner H616 SoC has a video engine hardware block like the one
> > found on previous generations such as the H6. In addition to the
> > currently supported features of the H6, it is also supposed to include
>
> Remove "supposed".

I can't actually verify that, so "supposed" is accurate from my point of
view.

ChenYu

> > a VP9 decoder. However software support for this is currently missing
> > and still needs to be reverse engineered from the vendor BSP.
> >
> > Add the compatible for the H616 variant, using the H6 variant data.
> >
> > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
>
> With that:
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> Best regards,
> Jernej
>
>
