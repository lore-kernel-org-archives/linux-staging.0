Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFEB3C37A6
	for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 13:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781444169; cv=none; b=C6q9Nq8ZhfHuZadw92XRdLhv4yqcI4cLNOAKIfUxYuWn5zTY16W3acCq0Pa/8N6cEPMoj6r8yT6CFDmiivP8rJMJtaQTLXSPDCCoZvyfvg07q3SDKz8umN3OZAN8Tm2u/4Zb7PpbCrLEyejLe41+2e5wVWet+MUsbBJj0Hn5QWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781444169; c=relaxed/simple;
	bh=0G8s6U5ZRStGQ6EJ0KRueHdqdQXBK9+8RF1gLCcr2Ew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dDvHRKPA3ZJfG6BddTRV1AAfVSMNJlTxNO7TjcYyoQ51jFS3UpmMuLWbAemnA++m8/fL3qKHPbRIVwXSWxJufqPK5WkFX/NkkIb2AxUJS7fmuRIgq0109Mcg50ORHypSqJojkjEHdbJJ6lWgtFLvtEvVyujHYe4zVUtDX3ydujw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p6PgiTFE; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p6PgiTFE"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b613a17bso21056105e9.3
        for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 06:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781444166; x=1782048966; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0G8s6U5ZRStGQ6EJ0KRueHdqdQXBK9+8RF1gLCcr2Ew=;
        b=p6PgiTFERR9VB9pzgIzLaJu3Zg28umdJu2pdXgAA0NYyBdHBQzxGK13MEmrE0OXoI1
         EWp7FafNEkFiPErmOjZ/ZpNXVOSqspTrZs9AnZjQ4rFetF0LYsnDNC5+JKZpPcOmP7mL
         /ibC3MKAP1Ge0O4hR7K8JT4bRWI/XdKdqRClZaUhEVVblVffCeXZ+ZoL0hS2eMneFwYU
         IIvCaGCCBY0+RJLoLHTu/ukH/JTd8Da4dxXWy1+x/z1EKz2vz5yzNJjQymB9rJE3xlFL
         2xTid7tqrKDDqUzJRqKkOLX9ig5iRXbuZmrX6ZXs8BhBs+9Kp8eFyfZqht92YJAyDqYT
         fi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781444166; x=1782048966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0G8s6U5ZRStGQ6EJ0KRueHdqdQXBK9+8RF1gLCcr2Ew=;
        b=lGRzGYEhmEAiLkV6/tiSFRrhiH+vsRL89U54XdKx0Bg20/udsvnhrRe32TvDOfofk8
         31aPYi/UHcQdUPHIq5yOCbOO4cUuduxygU7Kfsk8IT2bAU7BxdaDgdp7+sP1AmzK7mJg
         q8jXcGtUD2bWIstYskbD9Hk5FbPpbSZoo+WZmo1QkNwpO0xCT2fuHwHhcyGID6pmeuKe
         m76S1inC6JgjiMnTYx0hmN3QxwqBi4b2+t6XRKq1/SJzSl6Qzcu3ui7RWS1Nd9mngFvn
         TXfIl1jwJ6odVbm2me3f89bRb9aPgbgsV9iN8coOs0vvj1WeDws2npDfzq1GmVjoVN58
         ZJrw==
X-Forwarded-Encrypted: i=1; AFNElJ91YYweHMOvX/8kedzAouvNxWcNm//dmpVAoUwkc3iZkeVpB9QA0mn8YCK3Grbt2NIpRDeFT92QcYVbEfaM@lists.linux.dev
X-Gm-Message-State: AOJu0YyIJhG1mrt+mEtfbemGmzHhkb1HU2cMTGd6GVUO9ScEyi+97lJ3
	rQZPHqXCyRbSBWZRtlVEQYOJtjijFXtZjNvKuoRcP7iWANT25nZ5X+ND
X-Gm-Gg: Acq92OGc95bGWgoI0xlbD7xqyh5vSXaCQtWIQxRcqTKLLEdGj0MPzcSyIpivZr78oeK
	mV4WFBTnZGlqg5D00vwYaol2olESDy54V6YJj2kejoxCBfaPJUA+dK704ABcoWTA+G6dlBzYIxG
	3OvpA/Dva5pJpc85Iz1dPE/IteapRpVJP3Ed4IUj2QVupLX/nekDzQLP71VSolOoCysuGb1Z1Ai
	yBETqMOZtnWf7HItyKlkkj2LXoZrnPhMs7eSOS5nOWMuDcCcivttzSYy0+rhgPT60vJrbiGfwwj
	7ISopiO/VO0ecz1PaOKv2w2d0BZeK4dSpBPbkyspWoi/4BVMAH3iGBNANxwJBXAcw+YAmxotpA5
	vF33keympYAvNMlsM+LoKVrmzHszAeMVOoaoHFEhfhaylZBEWBR/zN+9DxRisrdCB6jD0apkpF3
	dsuimtyIy1OSehIJhl1h8Fo8KsVDMsVUxqWhjt9lppQa6r
X-Received: by 2002:a05:600c:58d5:b0:490:c2a2:e91e with SMTP id 5b1f17b1804b1-490ec523a8amr94122335e9.34.1781444165973;
        Sun, 14 Jun 2026 06:36:05 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea9520f9sm148794265e9.1.2026.06.14.06.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 06:36:05 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 4/7] drivers: staging: media: sunxi: cedrus: add H616 variant
Date: Sun, 14 Jun 2026 15:36:03 +0200
Message-ID: <XYko-1bVTYuJiQeSr0cTOA@gmail.com>
In-Reply-To:
 <CAGb2v677Pi9s3eWC7aXh8j=+eJh7AV5Mucr7SDXMN9Lo8yA2nA@mail.gmail.com>
References:
 <20260505134812.408316-1-wens@kernel.org> <L1ZJMTqKQbak6NcKbwFkDg@gmail.com>
 <CAGb2v677Pi9s3eWC7aXh8j=+eJh7AV5Mucr7SDXMN9Lo8yA2nA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 13. junij 2026 ob 16:34:00 Srednjeevropski poletni =C4=8Das je =
Chen-Yu Tsai napisal(a):
> On Sat, Jun 13, 2026 at 6:33=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrab=
ec@gmail.com> wrote:
> >
> > Dne sobota, 30. maj 2026 ob 18:43:05 Srednjeevropski poletni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> > > On Tue, May 5, 2026 at 7:18=E2=80=AFPM Jernej =C5=A0krabec <jernej.sk=
rabec@gmail.com> wrote:
> > > >
> > > > Dne torek, 5. maj 2026 ob 15:48:08 Srednjeevropski poletni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> > > > > The Allwinner H616 SoC has a video engine hardware block like the=
 one
> > > > > found on previous generations such as the H6. In addition to the
> > > > > currently supported features of the H6, it is also supposed to in=
clude
> > > >
> > > > Remove "supposed".
> > >
> > > I can't actually verify that, so "supposed" is accurate from my point=
 of
> > > view.
> >
> > Isn't info from manual good enough?
>=20
> The manual says the SoC supports it. Same was said for the H6. Then
> we discovered that the VP9 decoder was a separate Hantro block.
>=20
> So again, *I* cannot claim in the commit message that the hardware
> block supports VP9 decoding, because I have not verified it.
>=20
> > In the interest of unblocking this, I would be fine with "supposed" too,
> > but manual and all my experiments show VP9 is supported.
>=20
> Please give an ack or reviewed-by with a comment at the end stating
> VP9 verified.

Well, just go with original text.
=20
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
>=20
> Thanks
> ChenYu
>=20
>=20
> > Best regards,
> > Jernej
> >
> > >
> > > ChenYu
> > >
> > > > > a VP9 decoder. However software support for this is currently mis=
sing
> > > > > and still needs to be reverse engineered from the vendor BSP.
> > > > >
> > > > > Add the compatible for the H616 variant, using the H6 variant dat=
a.
> > > > >
> > > > > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> > > >
> > > > With that:
> > > > Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > >
> > > > Best regards,
> > > > Jernej
> > > >
> > > >
> > >
> >
> >
> >
> >
> >
>=20




