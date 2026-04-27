Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08863B27CE
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 10:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284059; cv=none; b=l/xg75FGzsDgTuXz2aYs4T5fh9cZKCMy4o8K41tUhnvaaGxf8dzTeKNpwLdLES0nP5HHTbkgGgMDNpwPA6OvexRTGZoII5hL4rhla0lRxaIH0G2psTMggFTuKxHJgkVA8kLX3zMLAeA+J70Nhz0ePfmRFZGBlSAqg7CsA0Ada7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284059; c=relaxed/simple;
	bh=ZI6ZwXlG1e5ACFzhDMQRxll59Q4E3kZhbdsX1UNQ54c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NH6wQsLFb2FbW9OQtN32N/6YHiLop0UET0x5XV0o3y9Vn+nl2dYO1coP+GU4ZP98EtZ4fT4XNPBAbot61tISwUF1lzxhI3s9xFMfGBereI7BAA3h2VodyUwvzg4aNFzxN7zgZROl0+zyYoxkXopc0Ci8sL339lNsHC5NmeO625M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gql2NRY3; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gql2NRY3"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a871daa98fso65202365ad.1
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 03:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777284057; x=1777888857; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0EvvvHNzTOaXmxdzFUeL0y2A0j/j9spluGpaFZP3FMU=;
        b=gql2NRY30OJLLeOobf4hSGkCc5WqR6XXXPbGgg6JsyyKl6eVta6fyE1+vX5So30UlO
         sEePuHQM+OFebI43KFZcGmnivO8+HsCnJIFgJqct6n6aUWJK/91LthqUJ67sb1Tvjn42
         ZzxixEWh6az1IxRwBMl7GqEA/6xdhF5acJdMiQbH4zAv2wskfXgoEmzgutt15QKi1pOf
         aWMqlXxo6n49YM55cHFa3+r9DKQA+ffW0gZBUbKDZM4efgRQE0bAbzaYyID67DbtAVz+
         +i3dYCuN2pRKiTnpAOdAowt3oZppKtgZCh7PdhMRXKyT6k0ML2bte4zoCHLEkYiKP/Bt
         OhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284057; x=1777888857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0EvvvHNzTOaXmxdzFUeL0y2A0j/j9spluGpaFZP3FMU=;
        b=LqYsQgk8yB2+N0VNeVJqROozTxjwWIiE1QXsH7xQi522Lg6pJ6FaGUkR9aUG6CBDMf
         ylb9+i+SWo1AXDTjvoX/HACyzXmk3g25O3Y3e/OtscKgEyRVrZ6w65wnporDV0twDhe4
         XiKkbxICmKPbqZCKoOBZlKij7qT4foxoe97miCrBhX20cSgPQPFh38seTgLvNAXb7sYv
         NvGhBzf+AVBckdSqDwGFaYdFwdZy1jd+Sd4RYwoIJiigT62tgEwJVTs6WxJtG4HL/7/u
         KkSVSygRbKnzE8g2Pfy8T2UqpaTPlnpqHbOCk5PzUTmVclowGUwxENF4GV4rthK+mvFt
         Vwpg==
X-Forwarded-Encrypted: i=1; AFNElJ8W2HCWUxweProegEIOoPE5up3we93fcHDuHcmV35Vj09/ZQ5/zSUrMf3YUmU7k4W1//l4cCzbuicPq0hDE@lists.linux.dev
X-Gm-Message-State: AOJu0YykQbfxJFnS9Tb/DxJ6cbsGFMTM6sh2nnaYyuuUfL9PLcoHjNgg
	dqTldC9byitPaqKo6Mnv71PJYLLEJuS5EdDOPBGuVZmF+ZmFZecZ4rg=
X-Gm-Gg: AeBDieuqb64+iKjFrwV9Cy+Ymwop0/swY1f2uw3r1FCucDCiVJ+nLa8d5Fo3V8NkBvO
	TCacrUPVSy1cWxS6xL2HI7286IjTESK7ZOc4ALoAC0xNVef1qXSzk1c+ofzOf4FyC6cDtNIivkk
	JVe7ztczT2kjWyTO8RDTiQdkMFLqjH0k2Uz23mVS8uhff47sqDHaV6U/qNurkwI8TBBNcrtin8v
	6shtZ2NhmuVT2bYjwgsIOAj1MJZ6XaXbQITEv7erFqJF9Ve8uOpM9xk5n9R4cOR/ERBIMs2BCrb
	k5TXwg0hRVXsAdKftj8NH4APvvirruzITDOlzmZVf2GCKRlXhSC1OIoIkbymHnk3PEfL6R0DdKl
	8nhab3YD1o8PDCavCSk91fYiW+elWEN3fupa5vvwaezVWMDMpVnBKBzUqx7id9Jn9/tZJpXQZ2Y
	hLwtfpPl8rXhh2xIgnUdNHQRH1vZ5SXAcgbwRV0jrQqAxIUZoT+wODfJ90f+f/9cloW6i0KGxae
	0AMqPurWlAyF0AC1TEaUdcp6MkrFaewr5aJQrjJ3NcJfRQ=
X-Received: by 2002:a17:902:e54e:b0:2ae:ce35:2686 with SMTP id d9443c01a7336-2b5f9e64c77mr424633395ad.5.1777284057141;
        Mon, 27 Apr 2026 03:00:57 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff713sm304240245ad.5.2026.04.27.03.00.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 Apr 2026 03:00:56 -0700 (PDT)
From: "=?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?=" <mhun512@gmail.com>
X-Google-Original-From: =?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?= <pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: cedrus: clean up media device on probe failure
Date: Mon, 27 Apr 2026 19:00:10 +0900
Message-ID: <20260427100049.29034-1-pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Myeonghun Pak <mhun512@gmail.com>

cedrus_probe() initializes the media device before registering the video
device, the media controller, and the media device. If any of those later
steps fails, probe returns without calling media_device_cleanup(), so the
media device internals initialized by media_device_init() are left behind.

Add a media-device cleanup label to the probe unwind path and route video
registration failures through it as well.

Fixes: 50e761516f2b8c ("media: platform: Add Cedrus VPU decoder driver")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 6600245dff..2c25654640 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -507,7 +507,7 @@ static int cedrus_probe(struct platform_device *pdev)
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
 	if (ret) {
 		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
-		goto err_m2m;
+		goto err_media_cleanup;
 	}
 
 	v4l2_info(&dev->v4l2_dev,
@@ -533,6 +533,8 @@ static int cedrus_probe(struct platform_device *pdev)
 	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
 err_video:
 	video_unregister_device(&dev->vfd);
+err_media_cleanup:
+	media_device_cleanup(&dev->mdev);
 err_m2m:
 	v4l2_m2m_release(dev->m2m_dev);
 err_v4l2:
-- 
2.50.1
