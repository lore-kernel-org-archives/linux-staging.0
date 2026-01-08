Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D9E3E9582
	for <linux-staging@lists.linux.dev>; Thu,  8 Jan 2026 11:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767870485; cv=none; b=GzhAS71ueX9rB3GiGDLpTMqyNLQmgPpj8A2dnulZi/iSOQbbfiJn2djNwHmoNAUmdW7Hbb2+UMzqIO/5pk9ryjJja+sn8HF2wSXa2NBSvHPmQshGVOYcfh5jgQ89qW01TaVEikB8tLynfHABO3jKcxneM7iwiSAMBfa/FAMrSqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767870485; c=relaxed/simple;
	bh=VF1Jmsv+ZJKjPzQoy/kwUmvilAG6QCYrQFJ7oGULPrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pdMDKG9QZXBiJU4Zqlvs6C9fTi2Ckxdr5obMaiIquMTu9jmbnudiTWviwF0vmYjE42IfC7fEoUQRo4gezVbMbmVXsn6Do0AzF3M66Ocg7h1z0j1HQv0mEPC3j08QJfadrX/y1mgGpE5DDaSF/ik+rxQ6C5xM/NTDdz7w1VL5Y6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I5HH3iHj; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I5HH3iHj"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-34b75fba315so2104359a91.3
        for <linux-staging@lists.linux.dev>; Thu, 08 Jan 2026 03:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767870478; x=1768475278; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovFL0ZgJ05PmQmmqASFpLTQJxg5CpaLFBPgcpKVwojw=;
        b=I5HH3iHj8ZEOEl1UhLxOEe8XWO/0QJy5/V/zol7UfJoI0EWlqI3vPf0+I076h87b8l
         F7Tc/ooYN4IYcDsFt+5AqTgKce4icyNGCRXtDI/acAzRaihgxRjtXG4l2Wts8FmqdfDD
         P6KFFtTOE046HHF9FfH46GqD3edNBl2TatHyWEicFs+asZqKjXDY8moI7q/pKmmBfAMG
         UEG/ekZC1CS1+xopR5whSnOwVVksuazAVW/+VbW2GnDtgHf7Mh/T11cz7Wzyz2eABSgp
         eYtUqh8ZIdsYQ4LD1XQOv5X3UzMOyHSmkExnjFXPMu16Eqa+3fsoQ0zMS9LueVta+6RO
         /JjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767870478; x=1768475278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ovFL0ZgJ05PmQmmqASFpLTQJxg5CpaLFBPgcpKVwojw=;
        b=mPXA36OIXQX++nrEzHl1zPUNT75OGIWD50+Ynhtm6a6ECBygdBd4Apqn+3zlp1m6kH
         KJV+0aXiU9cvfxji9uJYvMKkvjBLipCNDlS/GhiBAd2y3LqyB7ZLknpnSy/YPhLeCO8l
         v5FtfETypwnXw0lBJRpuAsbpC0dK1PCcgNaybj3kG/xu5QptPcZCcCT0eHhPGrvP/orK
         buOtY4mW7RAZ0zCvrfmV662A65vCwU8SzPtyFUY78tb2U2ZLVuq5GXwqNvmU/lUSccan
         gzMYcpjko1Gai48ZXFHXeuC44HpQKLhJiyuFQT9eCFEWQGs4QEqHjbevRhkBQdfj8PrR
         vvOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5JLwubKWFvgNdX4LhlXSsP+PTFQvdliB1YIOn64Wn1/D4rUApj/THqE3fDEBnp7+pmWUceCyGZfE5jxD5@lists.linux.dev
X-Gm-Message-State: AOJu0YyNhlD13XuDEZF3XS9KvcTq8Nq6YY/R8cRfW6FIV4GtmEOGfATa
	CRHBviOAeWBsg2Eq8y+laMlvaG+xGSOlay1Tiob38OUEdbkuf3+uNRNqkHElMRRi
X-Gm-Gg: AY/fxX5UpcQwFT7c4a7/sAmhFD5wOJ4jjK25zDjJFn9ELD1YVC673eD5o6k7G4uqaO5
	IcCw0OC19zZ0DtFLftwvt6RGw/CwDwUR1qBPSEM2cjrnw82lyu0HfelazA7QUr5WJ5qy1l4uXtC
	G5hj58rWBx3jw8r/zxSOwTNFjgUyxn03BaiVWJsFGxa9EgvgsCquhxLGezAI5AttAM7yO/NpnKL
	mRiYA0CShrMaHM/2MoYIlRJRgDkLAsXtZ6AqYTO72KUIjJC+PYMQo7P/577bRVY7/4k/40p7/dn
	hkVFhqGXFlzHGWL1dIRI4K9RzERzst/PXF/HdeFUK3PGRlqxZRGP5cP0uiYzvqIxZ8ahMLXfmCS
	YhKMw+f177ktbbHrNF1121WEBUMB03tmhb/NeHowImxML4gHSA9uX6rbM792r0l7eIsNu+nKA2B
	OQ31SIqhUMD+LiLOK3dC2N8RvfLV6enkRtnlBI1zhcFwd7mgLZtKmAcNEWTrI=
X-Google-Smtp-Source: AGHT+IEZGNq/qjuxwRs95G5htBzgGzwouoNNR9bUa0QHpgSKCZ7OD2+N2vgHG9VLs/ENE1zoFdn6zg==
X-Received: by 2002:a17:90b:1802:b0:34c:a015:9cb0 with SMTP id 98e67ed59e1d1-34f68c91343mr5167636a91.22.1767870477529;
        Thu, 08 Jan 2026 03:07:57 -0800 (PST)
Received: from localhost.localdomain ([2409:40e3:44:c9c0:8d34:cc3d:a8c9:1a48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f84ef1dsm7712096a91.0.2026.01.08.03.07.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Jan 2026 03:07:57 -0800 (PST)
From: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
To: rmfrfs@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chaitanyamishra.ai@gmail.com
Subject: [PATCH v3] staging: greybus: lights: avoid NULL deref
Date: Thu,  8 Jan 2026 16:37:43 +0530
Message-ID: <20260108110743.28579-1-chaitanyamishra.ai@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260108104947.23767-1-chaitanyamishra.ai@gmail.com>
References: <20260108104947.23767-1-chaitanyamishra.ai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gb_lights_light_config() stores channel_count before allocating the
channels array. If kcalloc() fails, gb_lights_release() iterates the
non-zero count and dereferences light->channels, which is NULL.

Allocate channels first and only then publish channels_count so the
cleanup path can't walk a NULL pointer.

Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
Signed-off-by: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
---
Changes in v3:
- Add version changelog below the --- line (no code changes).

 drivers/staging/greybus/light.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index e509fdc715db..38c233a706c4 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -1008,14 +1008,18 @@ static int gb_lights_light_config(struct gb_lights *glights, u8 id)
 	if (!strlen(conf.name))
 		return -EINVAL;
 
-	light->channels_count = conf.channel_count;
 	light->name = kstrndup(conf.name, NAMES_MAX, GFP_KERNEL);
 	if (!light->name)
 		return -ENOMEM;
-	light->channels = kcalloc(light->channels_count,
+	light->channels = kcalloc(conf.channel_count,
 				  sizeof(struct gb_channel), GFP_KERNEL);
 	if (!light->channels)
 		return -ENOMEM;
+	/*
+	 * Publish channels_count only after channels allocation so cleanup
+	 * doesn't walk a NULL channels pointer on allocation failure.
+	 */
+	light->channels_count = conf.channel_count;
 
 	/* First we collect all the configurations for all channels */
 	for (i = 0; i < light->channels_count; i++) {
-- 
2.50.1 (Apple Git-155)
