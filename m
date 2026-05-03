Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A842118E025
	for <linux-staging@lists.linux.dev>; Sun,  3 May 2026 15:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777820472; cv=none; b=uwG2/AhR5yP2pup8XCU+BbJCp6WDY6VGsaVV++GaVo0JGgLDQQ83rcqy7lAhgEzxuaQ35J1TYB7cR2G7O23JugmcFSBp/fYFDodmn2GfMOEZBXWe8SqvTq84K9jC2UQxct/wIVn6Bhq1KMctnjcVXJmuWJTKVob5Bhtj3J1KxS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777820472; c=relaxed/simple;
	bh=5V7sowEBAW/MmZpxWjMjlubJ9iiDob6wYsOok5AvsRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gxn+H/HpJR7Gy1A9EbLroKBQ4qQIM/2Q6NT72cV1xLBZ2ahsrgY//K5caY4OAUOInMA4LudAk6fG9QEOyeYsdRrtlAt6Q0HdQbjDyn15YHpOVvi963JKYE9qSwC+fT5XvmNcmJDe/Mlyw4qsjFN4wQeX2asKXHBC4OHuqyYMczc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=isxpvhX3; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isxpvhX3"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-836ed29d1e5so77085b3a.2
        for <linux-staging@lists.linux.dev>; Sun, 03 May 2026 08:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777820471; x=1778425271; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cPdyUCj5zFQG1KGlXkDAzMMroAEruqs+f7PQp/GCZoo=;
        b=isxpvhX3EJjiGqLYWoibL7NdpuVJhkZ+OFEaUPTXU70QrhU88AsCohYDueW0hyh43j
         wbnB26vfcsmB2LMazFGe6Th6lweY/1dW60whxKGzQZT858LuHefZH1RqxdGHTiA9IGOq
         m+dAImv7J5H3RdhGQcDWtW4+yAeiBfYL+QvFj+7l/gaU+h3Wt3DLE5vCTSHmAjFaXgl6
         I8X582NF8rLDYDfA5leyU0LsDKpgXaUjdF4e9HebO4EtlAClyE6qvg5rLkIwJ5ku/eMq
         Oo8layi8srjd12Aj677dzS2X39J22XtmP9UoEYja9J04DT15juS2OCIq4Xov1EMSjM0C
         lsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777820471; x=1778425271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPdyUCj5zFQG1KGlXkDAzMMroAEruqs+f7PQp/GCZoo=;
        b=e+OL6/xYg+bBZrSHW56iBHtbOPkNc0ARYbQYfdEpitRzE78zqMZZ0K0itWYZuzuyvW
         n+E+8r/+WJp8GkSLzxl21OiZ4YaaAc5KUgrnC9y+0UBcGXaZhi7nVpjZyfQ474u76wzY
         Jhx8cEqHwO2vy0IlJ4va55ND/M+G5mjUxCWvB/j3NVf1nGeKmdmshQmgvHphDYxfoI56
         aXxetJUGKFdOGxfBISjcn3SBejGG+BhSdxX2ZMCD4tgBWNky+2y+ayMAxcpC/ghjnPOl
         QoLNk3n3kpdVdXTc+J2cAXrXmIlEOd9+dPxW9LjEH/X3zVBH5MZLCvMtYWnPAJIO7Tbi
         dq6A==
X-Forwarded-Encrypted: i=1; AFNElJ/uITVDRKr0dmx04J/fNurgACN2FiwrfWMtEI6rUvsr8ikovsY8B6fSV3O5jQdE0Ptw60NeusT/NvoQ4Kri@lists.linux.dev
X-Gm-Message-State: AOJu0Yx36yS6/IO79jUP63sACTQI+Wah23s6/K8s+IEDwwyrOFGFSt+T
	shQlGuvDDH/IxM4OgRAVMUnUS6yUnIurqI/tLvz1PObj4iZe7+8diCmu
X-Gm-Gg: AeBDievmapYQQMD4a9J42PA5AJNl0X/qTaulWZsT26xMLW+/w6vMwlk/E5Y6jDZ+qeW
	1GTPo82HOp952whgP6nJgjCXC45XortYnimqduAY9wmIrO6P9OgDw8dDfuoCXagS1fN1dLe7Voj
	XUCe8t7+aoED8+vnbW5DqicgBcXzDU2c9qb/gY3OEW6Mp/RciqPhdd50bLvdaOARnjIgUDF7WAf
	HEcFChG/a1d24AJOA1f0EEBBcLStRQaQFdFRs2z/1JCBAF+TBj9u8mpBxQg61tmnae2w7OtUqET
	6GeuB3QZmQpqScT0znH8Rl9vbLnEhls0AkvX6JZ76mcgiUJhLzIRftAWw5CVF/lyPOTISmtM/iy
	x9Up4yabAvvBBUqmIE6n8suT1hxCaR0HbdiC5UQAetyiqjlT1DJtsVfGAZZDQL/6pP+0hEwbOp9
	mr0me62bR0gahpBfHZ7Epffuz8QV9cQDYHPjB34Jptrezu4enhWf0AxV8/Sgw3GStB7B1YADADP
	IKGykjpklm9kCIobVwX0vGh+BOAQE0c6w==
X-Received: by 2002:aa7:8b48:0:b0:835:6bdf:c886 with SMTP id d2e1a72fcca58-8356bdfd657mr1415743b3a.7.1777820470787;
        Sun, 03 May 2026 08:01:10 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.115.140])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8351582dc36sm9699387b3a.6.2026.05.03.08.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 08:01:10 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	s.hauer@pengutronix.de
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: media: imx: remove unnecessary out-of-memory error message
Date: Sun,  3 May 2026 20:30:26 +0530
Message-ID: <20260503150027.107173-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove dev_err() call after dma_alloc_coherent() failure.

checkpatch.pl reports this as an unnecessary out-of-memory
message because failure is already conveyed by returning
-ENOMEM, and the current message does not provide additional
useful debugging information.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 1b5af8945e6b..85b63993ef28 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -589,10 +589,8 @@ int imx_media_alloc_dma_buf(struct device *dev,
 	buf->len = PAGE_ALIGN(size);
 	buf->virt = dma_alloc_coherent(dev, buf->len, &buf->phys,
 				       GFP_DMA | GFP_KERNEL);
-	if (!buf->virt) {
-		dev_err(dev, "%s: failed\n", __func__);
+	if (!buf->virt)
 		return -ENOMEM;
-	}
 
 	return 0;
 }
-- 
2.43.0

