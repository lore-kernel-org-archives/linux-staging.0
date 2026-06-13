Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DEF2C0274
	for <linux-staging@lists.linux.dev>; Sat, 13 Jun 2026 14:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781361259; cv=none; b=Zpx4/8eWhSPsBD15lJAmHQvIwMOFn2RPVFOA6aoDfliysa0iej1EAz98pxX4ImTkpaS6H3YoeD7pl1EvIVKo55JL5GfbaQIBKXiT1e2RHiby+DcGB7OVxG4bwlk1ql9pcoPVl6idI/FXe62PogoTXlAmyyVcwHANTcpjx/NFh7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781361259; c=relaxed/simple;
	bh=DQB9eZVmUwCxk+upUfXxnkxbckxPsu3JLjqIaY/Ievk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y3AS9JZfk61i5sLJ9qRzvyy/yoNQTXgJ15q6IzwZEZRjwRkKGlgutCPresyX+GXOuFgcsVFGdEiT1Q1A77UPfd5Let6UbAogAtO9OylswvntynYY6TzV8msaQuGey7L7VTtPe6gqMhCEvtXzM9tHhvXG9scFmYpK16Db5LF0a+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SBHqpKC7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SBHqpKC7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DA261F00ACF
	for <linux-staging@lists.linux.dev>; Sat, 13 Jun 2026 14:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781361257;
	bh=DQB9eZVmUwCxk+upUfXxnkxbckxPsu3JLjqIaY/Ievk=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=SBHqpKC7BREORrxBTVx7sACccSGVw8i23QX7+RIK5eckd2TmCZktg+BuSCQ9ZJ3yJ
	 Kue7h6YyzWJ6cBULg+8t0egR8uzypz9mbNx5wzL4NFxcbQ8UVzR/0I3il5ZaLbmAgA
	 6XI+B9N7r6a/A7QQlC/qWONiroFFhzFCSsIQAAJdjirZrH2xEDS3kjMXfmnYg1liH5
	 WiQuomqBJ91IEiWZgyk7qRvIWJFqHdY7UpLHDvFAt7AjIty+cv7LjeO+94kXT0JuyM
	 nlGvFoZeBf2873j+tyl+fdW1buWoPl5nc6cNVqXfr8kp/8pTAbGJRyfaYH2DP1VGd5
	 pql7mT6lEAkeg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aa612bf6efso1676445e87.3
        for <linux-staging@lists.linux.dev>; Sat, 13 Jun 2026 07:34:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ86kSPWYeUs0IE3AqUhkcGeva0/Yn8OYbgL5NHMid9iYnfR52iTVUhaOQN21jyAjaZFSBjfaMrzoJ175cXx@lists.linux.dev
X-Gm-Message-State: AOJu0Yz34a1WWZw0pJsAOCuo6CkAkhU5fI3wxiNfl8FhZLijYusGGF9k
	yUqe9FXgQlXf70UZHjkgN/Xj8MZ7dAfg71uKevnbzV8ePJURJI+lncbADzRWedo6TyKMJ4UyEYr
	JJljQXTj8lDstJajGDYe33PI9hUwVnko=
X-Received: by 2002:a05:6512:1596:b0:5aa:6842:7a6a with SMTP id
 2adb3069b0e04-5ad30d703e4mr921898e87.0.1781361255568; Sat, 13 Jun 2026
 07:34:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260505134812.408316-1-wens@kernel.org> <JyKk48uGRMGhs1Z-wzq5pA@gmail.com>
 <CAGb2v64wDvLMFn9DYs-kH1S2PpHJat-imxR5eJSQAUYjOp=Xdg@mail.gmail.com> <L1ZJMTqKQbak6NcKbwFkDg@gmail.com>
In-Reply-To: <L1ZJMTqKQbak6NcKbwFkDg@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 13 Jun 2026 23:34:00 +0900
X-Gmail-Original-Message-ID: <CAGb2v677Pi9s3eWC7aXh8j=+eJh7AV5Mucr7SDXMN9Lo8yA2nA@mail.gmail.com>
X-Gm-Features: AVVi8CdvXAQ1C_gR9wE2a9xH-URFH8zH5uSNUhPubBOtyL4bNWe140GF1Ea1p7c
Message-ID: <CAGb2v677Pi9s3eWC7aXh8j=+eJh7AV5Mucr7SDXMN9Lo8yA2nA@mail.gmail.com>
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

On Sat, Jun 13, 2026 at 6:33=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne sobota, 30. maj 2026 ob 18:43:05 Srednjeevropski poletni =C4=8Das je =
Chen-Yu Tsai napisal(a):
> > On Tue, May 5, 2026 at 7:18=E2=80=AFPM Jernej =C5=A0krabec <jernej.skra=
bec@gmail.com> wrote:
> > >
> > > Dne torek, 5. maj 2026 ob 15:48:08 Srednjeevropski poletni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> > > > The Allwinner H616 SoC has a video engine hardware block like the o=
ne
> > > > found on previous generations such as the H6. In addition to the
> > > > currently supported features of the H6, it is also supposed to incl=
ude
> > >
> > > Remove "supposed".
> >
> > I can't actually verify that, so "supposed" is accurate from my point o=
f
> > view.
>
> Isn't info from manual good enough?

The manual says the SoC supports it. Same was said for the H6. Then
we discovered that the VP9 decoder was a separate Hantro block.

So again, *I* cannot claim in the commit message that the hardware
block supports VP9 decoding, because I have not verified it.

> In the interest of unblocking this, I would be fine with "supposed" too,
> but manual and all my experiments show VP9 is supported.

Please give an ack or reviewed-by with a comment at the end stating
VP9 verified.


Thanks
ChenYu


> Best regards,
> Jernej
>
> >
> > ChenYu
> >
> > > > a VP9 decoder. However software support for this is currently missi=
ng
> > > > and still needs to be reverse engineered from the vendor BSP.
> > > >
> > > > Add the compatible for the H616 variant, using the H6 variant data.
> > > >
> > > > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> > >
> > > With that:
> > > Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > >
> > > Best regards,
> > > Jernej
> > >
> > >
> >
>
>
>
>
>
