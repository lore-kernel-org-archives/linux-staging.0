Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC8B36404D
	for <linux-staging@lists.linux.dev>; Tue,  5 May 2026 16:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997827; cv=none; b=bYAeG08lMvR5O00Kl25O2hf0cZ9gr9BAN93JjtziHStt0flBzKYOWr3CbukFVm6Gpd7dHFaf4zEycgbyLhkOkk4Pj3hjQJWSSknSGc9I3YYcQY05Utw92WioRH5zy2CS/oDPaR4RXNuDR5aevKqevxdcvi5n4kl1ZAcYi7yoVos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997827; c=relaxed/simple;
	bh=JC3hYS6liihf96hKFXCRKLPQmhVUOWHZUk/IiD0r11M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mymEybHaH3V0hKKWv4Nmclcd5yJMRfcI0WFPNSZZjHBkajB46AvuJUUjU/6U/4+M7vBk0nZwVE8R8URC/lIYLQHoRR1JNLENtOu6RKi+rrqzbYotzmAdudPRAd9tBD+W17jk1I1/owSqJdhcGsE8E+Kxh4bRRaCMGCwwXOwtbp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+0IrwBL; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+0IrwBL"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-67b6dc50b61so8164095a12.2
        for <linux-staging@lists.linux.dev>; Tue, 05 May 2026 09:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997821; x=1778602621; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JC3hYS6liihf96hKFXCRKLPQmhVUOWHZUk/IiD0r11M=;
        b=D+0IrwBLgfSHeXKrJhH+l3SZDnv2dhsJ+IBSybX/AeJMoj2XW8pHOquodtW+iV2XzW
         77F9yWTI9P+1OAZf2pjKH56Uxi+1PNOoBOwj3yAUzCOOlB5E4k3gaVaytuSRdlP15CFL
         RoiWcI937J3WxTjO03EHqUHUAT/UIbdWlzss/ZCTLmjTUckAlBU2uxAlOjgLCGOXMs9J
         dInFJ3yMdP0BJwSn1u5BhoWjwta9xWlhfvyqHkAKV9JgwLTj4d3mv6wHbE8emr5IgScx
         LveqY0tQ5LD9FtYUxbPYSzc9zWVA6KMe6UDJudJJSeqVT3G2ySBuwM51NCuQ0feuzAg5
         6hHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997821; x=1778602621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JC3hYS6liihf96hKFXCRKLPQmhVUOWHZUk/IiD0r11M=;
        b=NA4xt1KXIQGY8jl6nsZBjf/SNYcqGCVu8psMF6oQ+mFfUjDhrV3qWjS/uNXCK0XNYN
         Jq6zt7DWlIQwa8Oxhin9LocETsZbdslFo9270cj02Yu50At/HyKQ2MArX/LPB+eKZW0D
         2c99+PtR9NOYTkhbEuks5cKKz/cFG4TUERo3znJ6MR3QWeqqLPcOe1VsLSdZGtg0Pl6B
         L6e7V8w3zYk39X4u4QmuGYBddeyRUv0xPpIzQWLI1j4JBJzjE6+xZo343QLeZqF2TXzs
         6ClAMViR1RRRIMdTLmgMXejxSCqYSMJEqW4nl2ew3IraymsIhOi7DTnrcm93UbjCct+N
         Gsfw==
X-Forwarded-Encrypted: i=1; AFNElJ8Q69ncHfzRZTDgqoTx33Y62T4qKHTyLF/qFXr7krjk5IEuMbW9meI1Flo1RIFgoWZ8b1WV/zI30T8vyrVm@lists.linux.dev
X-Gm-Message-State: AOJu0YxI8qaJppiXNpXmlZ9El1a1syRwt4WoUaIUJux3Oh0r1y+KJ+Vi
	pLEPxy/7BuDQ9Kcnmu3iOZ1LE0ctDaMKHrGjZLcvtxv9B/m7KA6o5ZHo
X-Gm-Gg: AeBDieuO/wpW1sf9kUfOWzCHZYZgwzpgawJA7RG1Ax/GZ7T4MN1qTTZfGbb65IjyVKS
	IptVG58qLH5WlVLMmzwK3d+FgZNlGl/1u3lxwXwotaXyZV0ZPADAlhL6Qj1ksaffD/a8Vizm6yK
	S070OBDzo8Zb1bZXPcjSaUcTqe8lNjkm+7jWvQLGyM6r13F4B/hEyJ7M/dNW3ZXQIIl9n7253zq
	wYJmK4A8d8udX8D+00btP/DhrAT1kIROkdVRQC1v+3nnqQjRqx/94oiLJG4FAgUGRQmvL14xjal
	Eycs08PglT9TcK/oiHGGC8UPwRw073X3fKZNVjqL2BI/BGOlVLCmtj4+iQBJOdS1Qtu26R61Ieh
	33n7P9tyovW92hJVlparVbJ573T75NnntPZ6xRjl9qqbIfS3MhIvAXRG7ePKIfEGTWnyP7NGW5H
	GhhiirJeyScRgP3lti6IKERE5Ww0xwTV4lk0vGYPCKlkGtOSiDDNt6spF/S9KPe5jOQMDXF1c+q
	1mN3IiD/oqaL5O2sQQ=
X-Received: by 2002:aa7:d319:0:b0:677:866c:6bb2 with SMTP id 4fb4d7f45d1cf-67c1a2e5f85mr5124227a12.16.1777997820593;
        Tue, 05 May 2026 09:17:00 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67cd91d5727sm554894a12.29.2026.05.05.09.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:16:59 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 3/7] dt-bindings: media: sun4i-a10-video-engine: Add H616
 compatible
Date: Tue, 05 May 2026 18:16:56 +0200
Message-ID: <GgrksnDEQem0uehnTU2lzw@gmail.com>
In-Reply-To: <20260505134812.408316-4-wens@kernel.org>
References:
 <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-4-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 5. maj 2026 ob 15:48:07 Srednjeevropski poletni =C4=8Das je Chen=
=2DYu Tsai napisal(a):
> The H616 contains a video engine similar to past SoCs.

Maybe add that it's first to support VP9?

>=20
> Add a new compatible for it.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Either way:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


