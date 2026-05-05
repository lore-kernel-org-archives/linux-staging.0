Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AEE36404D
	for <linux-staging@lists.linux.dev>; Tue,  5 May 2026 16:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997917; cv=none; b=maSR4xF9rkYMMqZlUBbDGdKjwyo9q2QgernSvWYn3KzhHPiib/AztmrYNFWN2QmQiAU2BHuzRyo5K7VpPZQfORINFOEjs3cTaEkfvM0h187Vo2rwjj80Pb8gQPPkZ90zspshSSlVGgM251xT+G7LG/3DFbYM9dlyEXrDKEnLbk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997917; c=relaxed/simple;
	bh=eVs3CfOcVeYDqCO5ry0qkJJJOLsr43VkIKZBYscM63Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e9dbhDEnwyuNcC/8DB9wAgtE8RHvoKeXoRYZu31XwozfF4dWcGaX/6nJ8tYzOx/2xStksxM0Skz8+mmACyV0KUEQpwHTtE01qcvr/RYCKfaZmbfxnwj4lpWThxy6sY//PTB8E2I1wn93Vb6LvKAZ6AlxyRZFYYP3OQn4v1D4xkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lY3XYsrq; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lY3XYsrq"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-448528f4e69so3234334f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 05 May 2026 09:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997914; x=1778602714; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVs3CfOcVeYDqCO5ry0qkJJJOLsr43VkIKZBYscM63Q=;
        b=lY3XYsrq0mo0m2qztRySdF4IK+5VR1iMZTHMOjHk8RseBLdZI/6fj4oKzGsfbt1r9t
         awbWLYWw3zj4526s9RQGcDaPSm/Mbg8VD4mfMlfT+jOpyLGrWWB1K18//K4sUMY7/3M8
         6Wo3DLtVZBzHwQb6ozjoOfqNfcG7XQ1HFkJSpBkb7SW7x4DQkMv0EFc1QwX9bvTUnQE5
         1l5whyr+3kmMgRiS4VRm3xyJV3Y7662e4T/FNYjvgfL4ztL9RlI/fbsG6uZRH3PWFWuC
         FyCrQmMibbVj+wXeExnl4GXK5hWl88nNyQCWaOox3sMzJ5j7rrldLCmRGNcuhzJfoMt5
         zYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997914; x=1778602714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eVs3CfOcVeYDqCO5ry0qkJJJOLsr43VkIKZBYscM63Q=;
        b=E+mbEbO/6SfCkJvKc3lPrHNXAXueCAaggN4LWofH+OXXNh2iMzCffA7XDbYFI4FrC4
         Mivg/cKqqMERztqm/03M0EHq9ZmndDNXkgEa3xgYhMYSYhzo47awsIlwG6AiVzcIO/eL
         mbq18b3EumH+T4RH1yHVoi2SUPWjuI1FVBdECwJghEW8BYxpbXPrrZjzlYF86CmVt88+
         AAQo5X+LSgynEYk+na7hiabwSYenlWBs/A44qGdh0WGO/d1GZ4SMMr1kGYaiVU+0rKbi
         Cd33sUr/RWHEwkXCBSK+TWuR2TuY3eadzw3GXpyi+aL5ZL5xoYSYsuRS+iUX2GfBnnsQ
         vVcA==
X-Forwarded-Encrypted: i=1; AFNElJ+8SIx+TppmYANRb+eVCFXZ2pvl8OllrVHirrWNAy/fag9WpGiVlFguXqaVIKk9gVOA7FUV1l1MMkFbET/A@lists.linux.dev
X-Gm-Message-State: AOJu0Yxkxwq/+/jMqkPZtSTESA4IHR+sP1XPPwXclo3EmXje8gY+OsqR
	+4UfXwHWebtxyZ0bwFBlmpa8pt1ahOpcjYts3mmvBF7JuEE/NPWKHDYl
X-Gm-Gg: AeBDieuQ+Ej4fuQQo6yiidRYK09vmB93Invbim7DiXf4ER+3juTEZKA9fWHVQFblYzT
	DkSocBb77gkqNFkok0rqnJs6tvnBQPlgK4g2rgaYCe+LY1wMBsKvMg2jIOiSRy8t8lreuKRw4c4
	VCM/YTGyUcMBWMkVWIA5CfgtietdqbmumXKZQVflzuvg7TV2b4c/Qipo+E4B3fk9OmtixeGkgJ7
	XZGBQAvWYjLU+Ur3xq1ig+AUNEc66RlKvEjwIqYookfaWCLnyRoPm5iW+PZ6DVb2MjAyl8VPp2S
	c+38vAWWdGW51i6ERfdodlaJuCwbKbSlMCaxO/UtDvaC8RnZmBtW2qr7dMoMavNiibLZHyzvTqv
	b8Ehuf4d3n9V4Mf0PNNK/meJwxfFHTe5JyCyQ9YC/EYEHu24Ah2Hr+HZ5rDckCG3vwKIoM2aZk6
	B9LPsmxQ/dTWoDaS/vQm2XtjT9CI/msapC7l5ibbqfYV6IKLN+LduliedQjdiUilTNzKXYpH9/1
	fRfJo8Eq3p1JP79s2UGWqpffqyW
X-Received: by 2002:a5d:50c8:0:b0:44b:cd2f:a3c8 with SMTP id ffacd0b85a97d-44bcd2fa400mr16334421f8f.4.1777997914315;
        Tue, 05 May 2026 09:18:34 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960aa2sm5411552f8f.29.2026.05.05.09.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:18:33 -0700 (PDT)
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
 Re: [PATCH 5/7] arm64: dts: allwinner: sun50i-h6: Add missing SRAM region for
 video engine
Date: Tue, 05 May 2026 18:18:31 +0200
Message-ID: <0QgbHBOXTsqa8Ms4s4GfYg@gmail.com>
In-Reply-To: <20260505134812.408316-6-wens@kernel.org>
References:
 <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-6-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 5. maj 2026 ob 15:48:09 Srednjeevropski poletni =C4=8Das je Chen=
=2DYu Tsai napisal(a):
> The SRAM C region contains a partial alias to the VE SRAM already
> referenced by the video engine. To avoid access through this alias
> window, the region should also be claimed by the video engine.
>=20
> Add a reference to the SRAM C region to the video engine node.
>=20
> Fixes: b542570e5605 ("arm64: dts: allwinner: h6: Add Video Engine node")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


