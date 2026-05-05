Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AA848BD43
	for <linux-staging@lists.linux.dev>; Tue,  5 May 2026 16:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997525; cv=none; b=kJsZHdEpCg5rjIJZIXSc132gmGEYiy6LuAKHPaxOVITwqg74sAZKA2RWBxkMbg3MghVGIZB1q8PNvGFgnwrxbzW2geC1Eek1LNGt6Ig4bVd0LuheYyubL74DjM6OrEKIJgEWVrZBTC66lObYvirOQC1RAsBr9BfWHnjuWWwi0QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997525; c=relaxed/simple;
	bh=/2YwgXM9F3f1htySNFFwNXvypiZD27bWqqyQPFCwZo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=InO8GvWBLXsV0GPxTh3AfnDr2TqvB7AI89qvMbb+6nAZCi5RXp99xABUfaUBupQIelMIGdPzd7edSAnYEtRcq7FCr1uHmow5270mE2Vk4zY1q0I5vpHR1VrXpZIVk8Lxz3SpTIYY01TU/uEc71M2b+ISltJLxRiTS7+kpKwDwLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SzAaLcvs; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SzAaLcvs"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488ba840146so47909875e9.1
        for <linux-staging@lists.linux.dev>; Tue, 05 May 2026 09:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997522; x=1778602322; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2YwgXM9F3f1htySNFFwNXvypiZD27bWqqyQPFCwZo8=;
        b=SzAaLcvsoiNGvQ3lNBxrah/GUFIr1XP9x3Qbz/mV8Wq9OSTc4hjZZd+vaZrqPHyiiv
         RD4VHvxTJ46m7zBPblD/ETydgdK4AMGbJ4diKzKGGlDnZhP6cnkZFVDNQRKbrdvWfqAC
         i/4wWyA1EWNLG+50eboee0745jW1Rsur0uDnl3BCYi7FTuc8W4VGNdRqYCRZWnxaW6X2
         11VI5F0fHkjKf5ksOkkS4Jo7tCVXrF58uVjBKclexrLah0Y3vTls9tPl53avJ79QpzEi
         20OIAUe15TX2rAseG72mv6tc8k1C3xSSaQNu7APhzIf0QCl8NlyDJPdCbjgWTcFZ7psJ
         twfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997522; x=1778602322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/2YwgXM9F3f1htySNFFwNXvypiZD27bWqqyQPFCwZo8=;
        b=AeVabft4FnLG1hbuytHFzOsXVZMcFbGcwDDCfxGy8sfHjrYZ8ArIi0KfqbHt6RkFd9
         UAKPq7sswmV3yZzweX0dXOFwLzMS6fHtJ+4Rr1TRVnBAenk0wPIFlxZHvncQt7LUcn/o
         IeO4fSWkOR+cqgtByXQXFDOsJb5NquDMyKQCjYTQG03HwaCte2ml1Dluxgco3LwMdXvc
         mdYDqEYupNnJ9hI2r0D+G83e+tIUie2SkuaDWKKDiKlKJYnbKW16tZMMBobwgFH6ZRAu
         hbmrrxQgNuBuQLHOvHncwmser/CKCAe/56znR3Wx5aw3wfdrPRdlEAuweJHpg684Q0X4
         9K3g==
X-Forwarded-Encrypted: i=1; AFNElJ9UB5HTaeOtW5mw1LJ9Jw/yKMkiDVjTlXSM1KsR/WPD/RLRA/JL0iH3TFkyHAkwevprHtwGG9DRdZYruMXF@lists.linux.dev
X-Gm-Message-State: AOJu0YyqCDQyvpmmTXsE6jbKQ00oZ4f+RtHshPmlpYoD6nfggq4UToqe
	R9j9uo42diYDO0uDDO7G86XJKyZtjJPYvFt+PinYBCSTTKYnsgbmxhvK
X-Gm-Gg: AeBDiesROJ7EhE9gXTvAlI4AkZmWF8Y3FsBx22bGD7sMROSmYpkEnftsDH556up5Dnx
	9aAtrwioySZEUelN06etGUsLUJJmFLnNdjcwkuJxIxNT6N47V3TtKcUD+3LDsndPGItbSOgficL
	fqpREhAehQmlAJhgif6YussUNJ/iRG7IHodlvAh3njnxfrBccsxa5WvRiA+YIC/VQ2ciCNQ9awa
	xAB+wIa/O+lRyTI0kMaUEw342/lJZTI0I10sGuF/FB0HfqijOZVbL5ejTsgYeG2RneHUlBe9WHz
	Af2q25/Qs4QuNBs3hIxJZmjCKKwNJIhZiBe5JHiRph2mJY585f4SrSZ7MzEwcmNsLfMZ9H0s6/o
	BkQeLuVr/hgIeJAqV0njvCxY3LXEBttwS0MjPV9y4y243I1MZjBdvvk4zODHFFkc9KNv1Y8fNcJ
	emxQ+vP6b2Qfo4nOullCxroZG5b8+tXJm4BFmAOPhTpgNBIRLyw+DgfqrNkrtTH7PavakhiX9k4
	4+3oD3l+9O7vZxoym8=
X-Received: by 2002:a05:600c:4506:b0:488:9e43:9690 with SMTP id 5b1f17b1804b1-48d187daac6mr60424265e9.10.1777997522093;
        Tue, 05 May 2026 09:12:02 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d17710bfbsm26884555e9.7.2026.05.05.09.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:12:01 -0700 (PDT)
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
 Re: [PATCH 1/7] dt-bindings: media: sun4i-a10-video-engine: Fix IOMMU count
 for H6
Date: Tue, 05 May 2026 18:11:59 +0200
Message-ID: <VwMu5tg2Q9-HLmYXaV-qwQ@gmail.com>
In-Reply-To: <20260505134812.408316-2-wens@kernel.org>
References:
 <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-2-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 5. maj 2026 ob 15:48:05 Srednjeevropski poletni =C4=8Das je Chen=
=2DYu Tsai napisal(a):
> On the H6 SoC, the Video Engine has two memory ports, thus two IOMMU
> connections. The secondary one that is missing is likely used for
> reading reference frames. The newer H616 is the same. On the other
> hand, the D1 only has one memory port.
>=20
> Add the missing IOMMU connection for the Video Engine.
>=20
> Fixes: 62a8ccf3a248 ("arm64: dts: allwinner: h6: Fix Cedrus IOMMU usage")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


