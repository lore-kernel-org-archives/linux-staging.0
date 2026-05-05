Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADBF48BD57
	for <linux-staging@lists.linux.dev>; Tue,  5 May 2026 16:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997755; cv=none; b=IWpsFuCX+Yrah3cz1RK2ISvgYDTag33/jHYqFmH7P2lvzKvfQQ60W4HT6/yP3/y91G1MeMhV/W6a97J4G5fcJU2hzKldKC8HvHhZ+LeDB/cBF/l22lWGTsW0Ojozq3Lkq8p3bNqYq1DoV7+PDkDnahqhJM0qRW2zI3JNaDYs6bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997755; c=relaxed/simple;
	bh=DOcATmiBxnRGKjoFpcAJ5nk3hnXYfVYBXXI94JUx4Kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UjdhCG+jd9LsjTqN13UfVTFSGmerMgNTYp8PNh99bOHV1yWAN3CK0NlNxp/Oq9LkHZFb+0P6XabhBmBpjJak0mAiovUdZoXtTBukR0l7ASJFo0vTxNjpVJLp9LxGjRLPXQDb0eQxM77Nw7toi813KnbQybdmwHEUZCC2azp+9zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EtwlgZab; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtwlgZab"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso58046745e9.0
        for <linux-staging@lists.linux.dev>; Tue, 05 May 2026 09:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997745; x=1778602545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwCwPqassmdFa5GP4LZDb8M62stClOb1kWRYWVT4ujQ=;
        b=EtwlgZab+xvUFPrVzPdsnguAgESWLCBDNBh5th1xfJo/lOgZgZzVMe0MdbzoT00Qjz
         2VuP+4mguoMQk3gr6oyuE6t5MIU3kSHLcGTc/UyJT334J4NXA49UgPID0DmlQpCSPg+j
         9P1xLzh5Fn8cMdE2gxSM9b5u6bbknwJXVPqsgd+EiFrD7rcUZhMIbp6wJMjNpD/44ALc
         bIgYDqEw9AUyZIp54nRUJuuhyJ8A+YxdHd48plnM+Vz1zgpwOJSmFD4AVio/aTUsQeVg
         4rjBPXp/hBCADs4BvQyDMVI8Ag0ACyYtDFjkDJaukqcWqNpZZqYCRm5wEXoDlw2+Zv1W
         t8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997745; x=1778602545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rwCwPqassmdFa5GP4LZDb8M62stClOb1kWRYWVT4ujQ=;
        b=lKFFcZExK8jRKLsF7KwJudAYJ59l1rmc7ngmMItfFDUbRDPkX+EmkLGjEfaaiBW++a
         EE3cUkEnhdAlI4gChdSMKCC45tnM9kLQs7oiNg58kCElXFR3Ul66F66D762GZIAd2uiQ
         RkqZVi5R4QlmsixNzD6n9/gHkNIsSUurjBlT1tG3mjFVxq8u3pSmeWxbLXiMqYkLXcuf
         s+EuiRFMDc1v7VZY2tAaH3G2GLKjaTs+gsr0B5fDziz7Qaut+Kb9eC+GNPlI+pdZPwfA
         eH4rH5kssnRMci3Dc4XFQXP/vlydZQ9m+iaM2vl8hO+vnVfuJldn0BznRPxRWS/+UghH
         bVVA==
X-Forwarded-Encrypted: i=1; AFNElJ84L9h/gTmKZyb9CxpB1fgiZ1xfjbTJU0T4loVN5agFAH7bEVwOXw3QJHgt6QOLzHfZ4iVvdWA9zz71Ab93@lists.linux.dev
X-Gm-Message-State: AOJu0YzP7MHOzac7o5u9UAi0SV7cALVqFI4RUu6lHCtub3JFPFRbNN7e
	nfEYsahNdp585HVjbZJ0fx94WUF1dX66N7B4pfxPcW7PEmspkivx8UTX
X-Gm-Gg: AeBDiesa+oxEE5wqUz5GCvTZ8v0XBArY0yzwfDrTmlYYMMWpxoXH0nbHNZk2LQn5EH+
	oxfzo6oOHC3sz+cOZcqh+oDzsCwfHxuW4iR1FPsCfqFuealIkzwXeoIw5ipgwBRUTpCHxqycJt+
	LMqTMNOe6UrihYHwD9YMOg13iweoqahYg6zqCwarAYG4ujlBf8ICQzwsuSSZRLCE4c8IKMehIud
	E7DPc6OlzENPR7sYdgS9v6Qf5oAclKS+trHmIAqQwH4JAkLxuy58nKia0eBd13bZSQJ9pbUSiJI
	0shRDqn2MTf9GpPFVCSkprGuQoUZBmdGdfihKCzXb1UoA01FmcuZiXZpuQZGUtJbGEDHzZSJyoK
	9yFTe2U8pGYBVKq6VLjuQRaGQdoOWe4r5rGcHpwv71cfBxtx1hwmRBgIsdENmG/3/Rz1QJkdX0n
	rKyj65vfxh6i3d578OOiZYwqkuOdb9SeCiAph2SGTmqq5ygN75LssqwhZquXlyQ203Ru4kfhbrS
	5s18CWQhebDAyjo9+RVecspC+73
X-Received: by 2002:a05:600c:3513:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-48e51d6c8cfmr1051235e9.27.1777997744843;
        Tue, 05 May 2026 09:15:44 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c8556sm402657765e9.4.2026.05.05.09.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:15:44 -0700 (PDT)
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
 Re: [PATCH 2/7] dt-bindings: media: sun4i-a10-video-engine: Fix SRAM count
 for H6
Date: Tue, 05 May 2026 18:15:42 +0200
Message-ID: <A3ZnAVmNS1uZyanwbLT-hg@gmail.com>
In-Reply-To: <20260505134812.408316-3-wens@kernel.org>
References:
 <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-3-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 5. maj 2026 ob 15:48:06 Srednjeevropski poletni =C4=8Das je Chen=
=2DYu Tsai napisal(a):
> On the H6, the SRAM C region includes an alias of part of the VE SRAM
> used by the video engine. This region should also be claimed so that no
> access happens through the alias window.
>=20
> Add a second SRAM region phandle to the video engine for the H6.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  .../allwinner,sun4i-a10-video-engine.yaml     | 21 ++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-=
video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i=
=2Da10-video-engine.yaml
> index 932043d7f0cc..818d815d4732 100644
> --- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-e=
ngine.yaml
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-e=
ngine.yaml
> @@ -48,11 +48,15 @@ properties:
> =20
>    allwinner,sram:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
>      items:
>        - items:
>            - description: phandle to SRAM
>            - description: register value for device
> -    description: Phandle to the device SRAM
> +      - items:
> +          - description: phandle to SRAM alias
> +          - description: register value for device
> +    description: Phandle to the device SRAM(s)
> =20
>    iommus:
>      minItems: 1
> @@ -101,6 +105,21 @@ allOf:
>          iommus:
>            maxItems: 1
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - allwinner,sun50i-h6-video-engine
> +    then:
> +      properties:
> +        allwinner,sram:
> +          minItems: 2
> +    else:
> +      properties:
> +        allwinner,sram:
> +          maxItems: 1
> +
>  additionalProperties: false
> =20
>  examples:
>=20

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


