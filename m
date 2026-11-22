Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795339013;
	b=KxnDGaiiar2HX6GGxWNp+t4s/DSCmpORcVWzPWr8E3F3NOk0npI08A94o45Zt0uc7tH8
	 VonFrDFu7PNFD8W9Rv+puLrkdeH7G6koQrlN+zoUPmQP36Bd51QrWNS0zDF4zuy4Bi+zx
	 ovM8SIMBxRqhjrtHA7YOkKUsMN7EiwCX915R3bLq+yqBZEe7yGN9jD2LkABD1pfWQf8J5
	 ALxIA1vrj03mgKinv53m3QddC5n0zv3QqIslzxkqFBtGtiObgTcZeJGzfkNvJSEc39sGa
	 uxbfpSebOYD3kg1AT2ukZ9sFaLD3wzr5F+r2N2LdHQ06PbAARgKTjqATwpaEMMbyeBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795339013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jlk4MoliGvZW1IkxqxKZvX+OlKzVs5YdkLc7yt4n2p4=;
	b=Pyv7yVhHEJtHeCDqyu2PiN7Cs/wpnZ1WmFRBRUwFLbYK4+IzB/p+MdnOXLqQpVITHTPJ
	 y8mxvQ4J9kpCVnbd3DhrQ3tjVH4hwQV4qCi/Y9BRTZ9YC02VQ39WKqDGJnAa1hH6F0AsE
	 5HkgbW/pCyFWfLY39thH6S37Hb337EK9VpDtZ+E6WfCN9QHiGCEjLm4j7upiAwvr9Uie3
	 0ZQTAVyekTE+Ved9shTxzbK7ZOS+Ix79BB2KOiUwnxqoySVt4tzhROFxg5ReXzWsw/Xea
	 yaSiVM+f518Yh7kDXOTmuzKH56w+91UxssJF+k1pqjJPKM48ZuSigYhNm1KGiaerO6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OSGnuEfw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD860606A32A
	for <linux-staging@lists.linux.dev>; Sun, 22 Nov 2026 09:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD860606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OSGnuEfw
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be3dd6f636so185781e87.1
        for <linux-staging@lists.linux.dev>; Sun, 22 Nov 2026 01:16:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795339011; cv=none;
        d=google.com; s=arc-20260327;
        b=mw39V1NDq1u4DQD79CiGs+/vknUXj3jzkBj+jDL/MQ/hmqnaaC45XDVRRIAmWKdS7W
         0QszeUDdG7eCLQ6DbYJrxPNUEHKHJNldeDtExb92S5if6/wOsOIy1FmoiGq9CsbozoKE
         GQIe8RVFvAp8Lse526VaNI8Hvq49MDOVjf959/mBpn1P0Efs2ubXjX1JSy1sJfe60kGb
         46FNUZ1MHXZPjxf/lFwVnXoX0pYgAeVPr8sL7v0GkMVVTRHzLotRg3yE+MTSAmzpgiN7
         7y/aXoPK+LB8FaktvwI1erolEhteP1o6vuAlwlyo+m9mzgs4gaDl1SsSQ6Qafo/SJsIL
         oVUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jlk4MoliGvZW1IkxqxKZvX+OlKzVs5YdkLc7yt4n2p4=;
        fh=fmPgHDdcTlk9byI2+/nELFFCv3k5Wi5WBmQV+nH5vJA=;
        b=hwkRmO6CkaVoNqcWqzmE+l5bIFg+1DgNgTnfMuUoeFHg73qnDvEl1DqR/IZkMJZEgg
         gtVXfCjFYEFSmSa1Xa/XYAn/nLZBVcFrIPhi269cRr4ychiiffMyg8Zf6PL1n82/S5eA
         hnKx/QltVTOLXxeAyrS/2BwTzcTu3V1QTg6augRXgjU9hD8gTXqrdq+A0RVJTa7zL2eD
         0C6YnTWsyfRlKY5n+GiiQR6Il2JBq9GX+d7WnbjP2kf454ZrHVyv/KmGNhp27927E8eE
         R0BgJHdFxC8wQ4BgJ+Yte5z4qHdLCtmkk+XenqHYduhFx6S2UltCoAJLJbwYL2Avgrze
         LHmg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795339011; x=1795943811; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jlk4MoliGvZW1IkxqxKZvX+OlKzVs5YdkLc7yt4n2p4=;
        b=OSGnuEfwLrZQ40ctuC81pGZncUHmL2AeBGWE3lOFxZYTVzquawFGaPIa2IdmDoy7w1
         9Vwu4Av3KIa4dRNsgpI08Ce3hu28u0Mc1GqRmy4KLnXyVZ6wBvZmM8Py31wjZd0xlN7g
         h4f8XNMbXM2eBZxzEAqsQhZzGx/4o9SOb1zVeRtNhBAe+P/LktZNfmYAc+rQXIfja3Ct
         nO4Z1XjfZVsPW/nDDp4hDtgXs0fsrSYuMywbKQrkHUOFlSMexI2+95xdzF241a8U0bUE
         KL+LdJBvYy3ut3upLDKmg2wNw8aLgFOOt+3c/ldkCUGlqBdi8w6rztM7MX3CabaLBBWh
         q1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795339011; x=1795943811;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jlk4MoliGvZW1IkxqxKZvX+OlKzVs5YdkLc7yt4n2p4=;
        b=cnrqgGMAgFBjpPgwWFq7wZrM3/eMhKMEuLrr4vCb7zHaj7VMzSj5yjbU5Q/FR4LhJ+
         0P2T0TF5dPL4p2MNuNPq2PZC69s+0rAv+4QTxi0Q/G8j+AxO5YxU3ZvRnilPoRDiW+pe
         KajquyAcXYcgm9/FLNhp48ZycYKyMzEiRLCJreZnEIqVWc3M2kfyR4aVodRUo2fgYynG
         qWSd8eDyuvItm8qnA8+YUuOZBuVcYCBtrKtxDccLtz7IvBzMB0+4qIDwtXTr/Yje9cTx
         UZ0unvyqxN4tOza6Bp3unqHzkRR6xQEYS0sEVNrEFBSRAPYwnLDlvfMSDgk2l2b8YOQ8
         0yug==
X-Forwarded-Encrypted: i=1; AL+hErFtXt8mmRlqpiO7KJyeCrWfRnXtmHNdEEDBKDr8QMR8thOG+fYDVb+DI6qvRndW37x3hwH9SeTZ5xcqhqtE@lists.linux.dev
X-Gm-Message-State: APuU4Z+MxtekqDtvJgLF4Y5Mq+I9G+W4o/0OY7KyeDATCVimrq2+M3WB
	xEUsae7hd+uQ1Kle+zgfL+WXlhePrccWKuHrozr2kQG4O+cmcAmoUYPuTw4xFXsLmBNjaGBf+1+
	I13lTRdpuKHfcMcbQvSWZcp3nhlIXnlQ=
X-Gm-Gg: AZFdTZdmvt3nZJPTSumHN9p0RgssGWNNGTBA1UQJe1QXeXwgeycluERM/OWOyu88T2H
	qSfk9E17CM7jzJRHlYmxyCSfj+ibSEEzZbOqWN2F/6Ho3ulOLfNHZdC4zomAH6xSNsugbG08DnM
	DDOMWObjKHYn8qfbeuQejVULGh7qeUCyyND2gGtfoDYhQify41caMoXcRVtrSVNbZjtabLAtBlX
	OsC4jxUo89TDOyapJhVV9U1tusUj7PTLj8Dhf/3EPPVT8MxlcKulBosmVjE+Xr/moPUIJvsvWLG
	w4K4bB44aAMKDO9DJCRS46ClFlplP5z/24xsAXWG56Dfe3BMxGU6t/w8d20zoC/MRBmGDDa/QhS
	IFSULAdYa0KePrgqTN3BX5NGbXA7cbj6jMupQ83sowVMdd1wyYeTfqhCi1fOfoVOCzXsEuOg=
X-Received: by 2002:a05:6512:6719:b0:5bf:ba43:fa67 with SMTP id
 2adb3069b0e04-5c1bc935c91mr2187197e87.6.1795339010786; Sun, 22 Nov 2026
 01:16:50 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119-b4-cedrus-mpeg1-v1-0-aa5ba1192822@gmail.com>
 <20261119-b4-cedrus-mpeg1-v1-2-aa5ba1192822@gmail.com> <1a1f912f033.2efff015191157.7190884739957848478@collabora.com>
In-Reply-To: <1a1f912f033.2efff015191157.7190884739957848478@collabora.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Sun, 22 Nov 2026 01:16:39 -0800
X-Gm-Features: Aa3M54oE-VNyvNZaxxRREWe_L_ECyiIpVpQf2rmUEBWZs2-DphbG3Q0KscfmLqc
Message-ID: <CAEy9hNVXZvfbW6U=Y7aiONidPKee7npGWpWuR2yQOeUu4aOVfg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=C2=A0=5BPATCH_RFC_2=2F2=5D_media=3A_cedrus=3A_mpeg2=3A_decode_M?=
	=?UTF-8?Q?PEG=2D1_as_V4L2=5FPIX=5FFMT=5FMPEG1=5FSLICE?=
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: hverkuil@kernel.org, mchehab@kernel.org, benjamin.gaignard@collabora.com, 
	p.zabel@pengutronix.de, mripard@kernel.org, paulk@sys-base.io, 
	gregkh@linuxfoundation.org, wens@kernel.org, jernej.skrabec@gmail.com, 
	samuel@sholland.org, jonas@kwiboo.se, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, ckoever@outlook.de
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Nov 2026 08:08:50 -0500, Nicolas Dufresne wrote:
> MPEG2 requires MPEG1 support. The new format simply add noise, you can
> fix cedrus with V4L2_MPEG2_SEQ_FLAG_MPEG1 alone.

Thanks, done in v2: the format is gone and cedrus selects MPEG-1 from
V4L2_MPEG2_SEQ_FLAG_MPEG1.
https://lore.kernel.org/r/20261121-b4-cedrus-mpeg1-v2-0-95e4decf03fa@gmail.com
