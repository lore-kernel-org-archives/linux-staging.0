Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D3334750A
	for <linux-staging@lists.linux.dev>; Sat, 27 Jun 2026 06:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782542334; cv=none; b=C9717Wcj9MtbTJVG5HlbxJUOy2shW4+mH8htHlNr+N51GqbgigQU8sVlkom/HiX2aorS5hvjteUlN8DqkXEAgiEGJwqhDPUMiMsYqFsTpllJTqwDRINPaLCxUY4AXcLK8SIVXSRKgSRo+ITZp0guucj5SHS3QdMGK80bIZrs/uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782542334; c=relaxed/simple;
	bh=ParnwBExfgSuCvGNbbNh3YhRq5Zw4wfCqZvmdKMow3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K2s2cQDyewT3i6MpsFZCwGIrwa+u7T871yk1wlDJCru/gPV/i5xVrd193ISNJeJsRUNk8vbdrDH69fK5UGh0Uek3JDogv6fZ6ZIDHKslHuT+v6Z1sm1J0PgSUM9qhXRVsizB9Igsq4btaqElHhpLJdU+QU1aTLUtCjD0IsRVdcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+1UbL7A; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+1UbL7A"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49241dbf9c1so14534275e9.2
        for <linux-staging@lists.linux.dev>; Fri, 26 Jun 2026 23:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782542332; x=1783147132; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ParnwBExfgSuCvGNbbNh3YhRq5Zw4wfCqZvmdKMow3E=;
        b=i+1UbL7AIrMVtfTBobUQDaHwGnwl1RNtCJXu0/CnhvaHCXrbacYjgHLqW1xe2NuZC7
         2vOzWd2RqtmHK+zWgXLCLcvEB5Mqreicm6EaFFDdfCS5j/f52jUZxHu3f8wDP8PJICLX
         KZzVfKEqQrchFoMmWGP6cYLZDJ9bIkVIjw6FtIKBYxe381NTADttxyLf8+aRbP76su+F
         V0TpnL30zTugXATEmZrX4vnxXDB8nGQPARJtX7SK4Ld1dQyUAAPR598aewFbbOnpbBg6
         jOg/2+lQr5w1lXwYCHP5iE6ZrHmJUds90gwOcarBin9tmhyrxlIhvdaPmPwP3Dsf1fpT
         VaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782542332; x=1783147132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ParnwBExfgSuCvGNbbNh3YhRq5Zw4wfCqZvmdKMow3E=;
        b=dnzI19Y8cyZ9p3D8XSJP+AF8gCjn4QcEXq719ZM0Ge2xN9TpD50+UX2ZoO3JAKaW23
         f11IOcW7OxqmhGu1kSkz6Y8ZRNEHPZ1tk5GdEGUdue8P9ANWnSkI428bmEWTNr6tek4b
         k0sVRm7yXjjlFrrx4XZTV1bfBxLBp66yg3wiVXRonYzm+qupUHqeguyoBsvbJOP2U9WY
         vwtwZ0NeKlYpekhjI14io4bBqisZhFhCCLQXa9EfegN38qFxgiouddRGMpZp4VE+1hht
         mDw0OaCgCyZPO3Lqv3ny5gzt1K85dhjehexRdP+kuCDpsPOb1B3z5awg0Ia2M+kMma4X
         Qoig==
X-Forwarded-Encrypted: i=1; AFNElJ/Vh6mq8GpncdeE7MXw0Yu7EU+/CU+jj7jWyRoE3q1+AcP9VEuVrM2ympbFE363rFJj3xF4PqFrM4ljC4CQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyQbxpHEEwO3GS70i0Bis0wFxw2ZywuvmYCM2LIMGSuBfuHJJjC
	Gv0e6thfWE35+X+lGT8C0x1zBADgU35osjKnMhdqdX8j60BhCIRlRutc
X-Gm-Gg: AfdE7cnSgSlHmM6gGI2ehRxyTmuuAnjrCAwkG2EYHbPs467DFpzOPguzytZYVC0O+q1
	D8F+T90m6v1ofQ9AoPlLIfWVzkFAraCNBUZe9InqM4jCPpZ6i2GtzhHhlqq9tOFnxhJnTugdxh2
	R2oHBMsHKCb/8gjH+/rZ2/MxYQRm6rOoeLPbyfC2EucTEfvFKeBNWUS7L+AFCG67QRN6D+TNna1
	D+nySGiFkASSO/wcv414G2vYmsS5/LLDofGoRrcsbMorSJUiMP06N3kgp/9r/GQas2kyoSmY+zj
	za7Qb93yNcGmy1OsLrVNH/PeyMAIWqWqXO1pMWds9G3QkBEu4VGGepY52kB/dIchViUlU67lTlk
	nTwXKS66kSD3b3RnxTHiZdGmyG2NZphl3c5GV2HESoL6NoQFE7KNclYP1isMFJBNJraa7pIdhVd
	GYU/iVarRMFqXtoM31hbTtRRtmc1BPTO2AgOXBOv1KdFqk1dQVOayiBBRTl0HF/D7mGA==
X-Received: by 2002:a05:600d:8499:10b0:490:e196:6574 with SMTP id 5b1f17b1804b1-49266864b4cmr108469495e9.13.1782542331948;
        Fri, 26 Jun 2026 23:38:51 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4927038578bsm67964385e9.4.2026.06.26.23.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 23:38:50 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mripard@kernel.org, Dawei Feng <dawei.feng@seu.edu.cn>
Cc: paulk@sys-base.io, mchehab@kernel.org, gregkh@linuxfoundation.org,
 wens@kernel.org, samuel@sholland.org, hverkuil@kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn, zilin@seu.edu.cn,
 Dawei Feng <dawei.feng@seu.edu.cn>, stable@vger.kernel.org
Subject: Re: [PATCH] media: cedrus: fix memory leak in cedrus_init_ctrls()
Date: Sat, 27 Jun 2026 08:38:49 +0200
Message-ID: <3HodGaD_QKy_OLZfdyJ49A@gmail.com>
In-Reply-To: <20260624085920.578446-1-dawei.feng@seu.edu.cn>
References: <20260624085920.578446-1-dawei.feng@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 24. junij 2026 ob 10:59:20 Srednjeevropski poletni =C4=8Das je D=
awei Feng napisal(a):
> In cedrus_init_ctrls(), the V4L2 control handler is initialized before
> allocating memory for ctx->ctrls. If this allocation fails, the function
> returns -ENOMEM without freeing the previously allocated handler
> resources, leading to a memory leak.
>=20
> Fix this by calling v4l2_ctrl_handler_free() on the ctx->ctrls allocation
> failure path.
>=20
> The bug was first flagged by an experimental analysis tool we are
> developing for kernel memory-management bugs while analyzing
> v6.13-rc1. The tool is still under development and is not yet publicly
> available. Manual inspection confirms that the bug is still
> present in v7.1.1.
>=20
> An x86_64 allyesconfig build showed no new warnings. As we do not have an
> Allwinner SoC or board with a Cedrus VPU available to test with, no
> runtime testing was able to be performed.
>=20
> Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


