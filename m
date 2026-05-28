Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8B026E142
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 13:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976280; cv=none; b=jSvMB2pkE8ZQVQEY7Iv0XYPrAMcNTeUsVMQ++E65aA+v905Y3bBgRdkxl/hqmMkIRCW2l+Ydos3lajhaD9/unV6aXu2pkt8nrr4CucPgP+d6ntgmwOku0ig1n6HneEpTdvHi5dR50SDFXas5a12DGcdJ4oHfcjH/+Hqm1eGBCeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976280; c=relaxed/simple;
	bh=/lCjwMCwIUN6ufAh37kRzYX8caEh602jwuVmDhShp9U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pL3d6McYbuJe2BN1aaiv9AWauXonUItrHjUXAh7Q8fds/RrMH+oj1FJnn8NL1xK+mO4mS58wPpch+EEfzO3eZsWx0B1+lcUbM+ZXm0AQ2kjVE4T8C8ybSQ6f3LHMbqNd2TzxIkeBv1c1cKeLMeeaeXcsStUQx+ANUg/2IsxVud8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rB86h8WF; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rB86h8WF"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c801d732058so5723379a12.1
        for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 06:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779976279; x=1780581079; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A71OUHyyRe1M+VCs+XKSSgTKfIfoE57tMLNWnn+zSKk=;
        b=rB86h8WFizgx9HSGPjZNG4LzZpaycZyArQOq5w5pM13G1rOyYjHkuAhcFje1SmzWtI
         tbz/vBkPp9RTBfxwxcB/hXHO9fdmL7TkQmipo5BnmWCfaANJkU08e7/F6XANvXxZwX0r
         nt0YKPcWW2Ns37INqobjgLVIg9gjxIZn+LyvHk0SKaetNJ9MnHp1+VeQN6cAXSm6B5xV
         Q4tDtX163P4nGnP/J3Z0DNF5YknPrPbKnXNHqRFZjLR2sBLm+n/dfmWT5Oq27yGGmigU
         dP4EXW6Np/bK84RD2WOGsUqG58Kq+bCf53nfY9vs9sIDrr1B1bEwaELvBkm/W1hrsFVL
         cmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779976279; x=1780581079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A71OUHyyRe1M+VCs+XKSSgTKfIfoE57tMLNWnn+zSKk=;
        b=UU5P/l5oLmR65+BLc/n6BC5YrbZHczp1YQtzcYYk+QgyEyBoAGcj6UUmXVG+kUajZc
         1jjBTk6ayWAwzKuKvAcrjEfwPzof/qH0asRVR3Rkmw3mIBkepMc1aF3iakTt+KzAPsHk
         2ZA9ogggkPOz4oOd5KSMXNE5EidOKZL2C+AdIxWCyH+ccJoaFNalG6sl3s87Ga/kn3ij
         e3sOBrtac66HHAmIL+WzzhBL05+aQj8vHCB9rRMf5Pm+bQhlHXyPGTlm6UnU+7oBDDI4
         xzS5kOe4WXqOh+e3s22uxohA+4itDEXTeWiA2YqxzIFrUBeOJp5QtrJtnJc6zwkSY27b
         FRIw==
X-Forwarded-Encrypted: i=1; AFNElJ8W7JsElUS73XxDSo1qh2AHhMjjaz4rPit2+EC+9BFd3NrNLMSeaLV4HJAwexYbRDzpmu6H0TYYb5cweH0d@lists.linux.dev
X-Gm-Message-State: AOJu0YyGDZePPolMqsM61fsmBHceYkid2ffqn+hXYm0L0fft8ByeTy+6
	d8Z0DjBiRx+AjLW19RIApgtEDJKOQrxUqwOi90vTivT3v7MWMhuDNgBD
X-Gm-Gg: Acq92OHodgdvO3EkhulO7xt59LvaXWSs5GUx4s4PULxSX6XY5wjeQvMkbRw6FE0XX4N
	tqIQECYERpB+NbU/cs9v8iExQGE1WDZJ1SxK/EiszSmwP3TlPL9K64ufid4n/8o/DVVbbU6LJAr
	pWVexWi1ymOxPlvH+Bh2t7eIp8ElL57gHKFT2sc4VigOE3bGFoqTN02FDdHUhLaeHiPM26M4AF9
	pkNEJSJME9X8spk1Du1HTtvrnDQFFUmhWDHKiYfOrAEfMg3721AQCh16hGLbinBKuIobMpP+n0y
	tuLemNLDrUFXb87uk3TzGBqL0uguZHH466YMV9m/f3MRSYnseY1XQNCxFVGyBBdzcDBPeCJqF48
	7dmHk2Z+3HRYe4F2d65fiQzo9yRtjOf6+Cflbg8/n1MhK+eOiwHCa0xqKkYMlw4Nxm5Glyqf0Qj
	Iwu2OBuSaGfRTHuNpnrysUYNceNCF0BTuG5KnYJXkbj8ZprTd8HqAutdgjeylESiWqekNJ0mFa6
	JV4oNc5vHnF2ebWOWYdfaLbCbL9oDGePK/EcKrsisqtcfC753TS
X-Received: by 2002:a05:6a21:4c13:b0:39c:2d2a:632e with SMTP id adf61e73a8af0-3b3fed32fd4mr1697534637.11.1779976278988;
        Thu, 28 May 2026 06:51:18 -0700 (PDT)
Received: from localhost ([1.39.75.74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202a337fsm15256769a12.8.2026.05.28.06.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:51:18 -0700 (PDT)
From: Alfie Varghese <alfievarghese22@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alfie Varghese <alfievarghese22@gmail.com>
Subject: [PATCH] staging: greybus: vibrator: return device_create() errors
Date: Thu, 28 May 2026 13:51:09 +0000
Message-ID: <20260528135111.2791-1-alfievarghese22@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gb_vibrator_probe() maps any device_create() failure to -EINVAL. This
loses the real errno returned by the driver core, such as -ENOMEM, and
makes probe failures harder to diagnose correctly.

Return PTR_ERR(dev) instead so callers receive the actual failure reason
while preserving the existing cleanup path.

Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
---
 drivers/staging/greybus/vibrator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/vibrator.c b/drivers/staging/greybus/vibrator.c
index 0ec4d317c..763c234fb 100644
--- a/drivers/staging/greybus/vibrator.c
+++ b/drivers/staging/greybus/vibrator.c
@@ -161,7 +161,7 @@ static int gb_vibrator_probe(struct gb_bundle *bundle,
 	dev = device_create(&vibrator_class, &bundle->dev,
 			    MKDEV(0, 0), vib, "vibrator%d", vib->minor);
 	if (IS_ERR(dev)) {
-		retval = -EINVAL;
+		retval = PTR_ERR(dev);
 		goto err_ida_remove;
 	}
 	vib->dev = dev;
-- 
2.54.0.windows.1

