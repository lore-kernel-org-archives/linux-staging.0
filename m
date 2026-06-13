Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7F4327C00
	for <linux-staging@lists.linux.dev>; Sat, 13 Jun 2026 09:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781343190; cv=none; b=bVfosAP7czp4uRCO5iMnEfYys+2abdCsU76YddrIT9ZqrePh+AuCMZr6SIiOVqNaIqIKo15F+Wxe1vg//8ulL0aJtsekSk483mjDHaGB24dGnZ5j2PeNAwjxXLyAjipFLmP+9BvRzSoM7qJE1Xqoq7getvs/Vn9ZB5EMG1f0F9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781343190; c=relaxed/simple;
	bh=8T+pkFF+lS+JDBAjF8JI0LZg2b8EwfaONvyE7Gy7O/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f3/bg4DUUvr8AoaKBT8O7tkGpvJ47Imy3QzeD2vQlglDHzQZU4Ox3MbdoyXnu0rh855nrWPxdjN4tqr7dKo1CzMjToc6BG7IJfoyUEQAoNPP8TAxgFj1DJW8Nc4CWx5kQ7VR1ffQHae4dS6DdswjV8gBYfxe/s1UWFJzWbyyUK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtkYUd6G; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtkYUd6G"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso21890215e9.2
        for <linux-staging@lists.linux.dev>; Sat, 13 Jun 2026 02:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781343188; x=1781947988; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8T+pkFF+lS+JDBAjF8JI0LZg2b8EwfaONvyE7Gy7O/8=;
        b=BtkYUd6GiqyA+wQs9cWwyc9Glg4r5Ysi4HLPyHCNQRqmRcF/f5vNpXq8c9NbzQzKR3
         LJqyKO7LulmYAd+t6hLJ4Te+Rh8SOk+H6e21VffEtAbW4+DGh9qsu4RtCpyAcLz2aVTs
         +SMXTicSw1qjB0wAvwJovr4TeU3698Dv15xJYwYzT/HlAz5FN1xTQa7i3wIxtUMngBLi
         WOjW4DvUuVRacHGQUdlePNV2NZHzwvJzA6Xb7qeiLS+ZSy40PIMCtM50W9dckoNEOS0j
         RQbJV1Pcn8fk/7mExytmJiVig5DLSsTZFQk37ezExi6B80toqCosILXs9JRKeIVkjGQG
         bm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781343188; x=1781947988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8T+pkFF+lS+JDBAjF8JI0LZg2b8EwfaONvyE7Gy7O/8=;
        b=JXKF1kZROXzeBH+e9qE/EiA15oduaIblgoCJPxWJiNH42gJM9BLYEUgojvwFJ6Q6CH
         pF9q7shp192yzxK10TDiw5/u87Aliz/++AD9LLCJZ/JHyrTFb5ytvhvIZPgROIsTQgHx
         iYjNdOTbnSpBCBUMdW//Z62JYTLlZhZ9isnwKzGphx7UNVXdCm0u2bQwS8LfbgNFV5sh
         Z4JCo331WKw/2h8aKPu9BnIus3/rxXWewJTbJAAsmh9xqz26orECqsGoPeNwnk6LZW9F
         JDUExXWbVrxU6+rump6gx0JGWYg+nRIL82hzdaaLn4VrVC03JY2tggjqKKbrv2duxd4S
         5nmg==
X-Forwarded-Encrypted: i=1; AFNElJ/hUq16zzqMwz05h39+CWDv8O0RoGkGnqJxT211I5dBWo36pqhrVWYPl9ygwXfQCUno4UgIRPxMAvPOQhXf@lists.linux.dev
X-Gm-Message-State: AOJu0YzcRjlKgTBuPFefeRNRSDPqHqeN00KWD/ysOngHAZq866Kre28L
	WORsmMeKXvLJn06Rg2KzlnWcnpKPJRVUVXOHzK+GYV3h9CPiMCMDFGrZ
X-Gm-Gg: Acq92OE8Jn4TIz7z22Okk3ujTZ1beov451g7MoeC/FzZg963EJLoHvH9cwmN60oaVdL
	oz3CHGaR0UhOS5NWZ+D54ZXx71LHppShEYi90JOINvaTqD/IMlhjJ1jlbZtFOMn1whctJpmmVFS
	yFLm3M5qVzM+nMVYFoAA90xVRqa/Wtzv9ote/Afksj3NHVmutgtZb10+qoyb8ujI9DpabFtsWL7
	2s2yuVyYcKC1BsZFW9P7SznlHY+bf9falCiHOPPQnCrFDscmq4mwkjyVBq6r30cNW3q+gZ+fTpk
	gKfZVv5iL0qpCHO31lTzFzYn9LkcivJaD1DM4nkkMBIT/qTG9I/eQ6rR6lqWHCvIp7h88nO42Mh
	6s+LX25y7eph/6ZpdQ3ByfeidYGYWxMOxzfJsQxsTz6Ir8fueQL2AuDRFk2cCxyULbjue/jsSLa
	AziYv6+rN1NkTpa1mPjkqIEXUMQvwPG3Iu875TZDEvJeUWHWt32hQPYyM=
X-Received: by 2002:a05:600c:1f8c:b0:488:d6eb:e63c with SMTP id 5b1f17b1804b1-492200768abmr37382835e9.15.1781343187661;
        Sat, 13 Jun 2026 02:33:07 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26392esm13886883f8f.3.2026.06.13.02.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 02:33:07 -0700 (PDT)
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
Date: Sat, 13 Jun 2026 11:33:05 +0200
Message-ID: <L1ZJMTqKQbak6NcKbwFkDg@gmail.com>
In-Reply-To:
 <CAGb2v64wDvLMFn9DYs-kH1S2PpHJat-imxR5eJSQAUYjOp=Xdg@mail.gmail.com>
References:
 <20260505134812.408316-1-wens@kernel.org> <JyKk48uGRMGhs1Z-wzq5pA@gmail.com>
 <CAGb2v64wDvLMFn9DYs-kH1S2PpHJat-imxR5eJSQAUYjOp=Xdg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 30. maj 2026 ob 18:43:05 Srednjeevropski poletni =C4=8Das je Ch=
en-Yu Tsai napisal(a):
> On Tue, May 5, 2026 at 7:18=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrabe=
c@gmail.com> wrote:
> >
> > Dne torek, 5. maj 2026 ob 15:48:08 Srednjeevropski poletni =C4=8Das je =
Chen-Yu Tsai napisal(a):
> > > The Allwinner H616 SoC has a video engine hardware block like the one
> > > found on previous generations such as the H6. In addition to the
> > > currently supported features of the H6, it is also supposed to include
> >
> > Remove "supposed".
>=20
> I can't actually verify that, so "supposed" is accurate from my point of
> view.

Isn't info from manual good enough?

In the interest of unblocking this, I would be fine with "supposed" too,
but manual and all my experiments show VP9 is supported.

Best regards,
Jernej

>=20
> ChenYu
>=20
> > > a VP9 decoder. However software support for this is currently missing
> > > and still needs to be reverse engineered from the vendor BSP.
> > >
> > > Add the compatible for the H616 variant, using the H6 variant data.
> > >
> > > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> >
> > With that:
> > Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> >
> > Best regards,
> > Jernej
> >
> >
>=20




