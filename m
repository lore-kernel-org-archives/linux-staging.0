Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC2724728F
	for <linux-staging@lists.linux.dev>; Tue, 11 Nov 2025 09:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762854333; cv=none; b=iK+ljRswnRFa6lSGmz9ypWRIkXU4naCYx7wz6UNTHVsXdzG7VNUDfeLYphVKVb/fH8MYUzB/P1wXinenbI5YhTR+RnJduuPr8m+d1eKYX2dIuTkoHSE2YgxEhFm7Ir5h4ZEAOraYZYSnRAzPc/y9ogTcLONybeglYouaBpRX8Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762854333; c=relaxed/simple;
	bh=ckFH07UEJ/6Vn75EeCEfpSFArExjv65uHl/yV6y/LG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h/TFFLaRIv0WYAKPbH5zaOGz1adPsxnvWVfvlBy/g7+WjJ/zXraucueXxVAYcu4mvwXqrSqUH+7DroS2jea1m5hxFiapi7E5un9piRLuc/PdEeSPbqlGW+LSb4pkrFYFyBlde5fHIpKu7WOVRUSq76gfWgqB9rzatskY9oS54ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gtNR77hy; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gtNR77hy"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477549b3082so35052815e9.0
        for <linux-staging@lists.linux.dev>; Tue, 11 Nov 2025 01:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762854330; x=1763459130; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nmpwq9Y4K1E48WXNTAOK6Thjd08PZ+n1dzKkwN85Vb0=;
        b=gtNR77hyNAVFIfnJBeEFUOQiFmsq5FCleCr8HjU5vOlb66Be4h4/JEg7XyniUrtatE
         y2XPxIMnQMGbgFvB2MB2z0u48VZxoR5/yzv0SC+OH0xHu2RlSkVZ6hzyuVQQNn2/31Vx
         q2ZKWUJnkBYN9yugKx8JlLEtvIE2cL890LDOxte/rn2sBSU3dSz7SNdC71Q+94KyuXzr
         9aQT/pvMgjokDuBB22Q78JtMJx2A8WtCC52SVDD7ZQC61xqLEoyka8bxbuY1BIsr+ael
         tIGoJTsq6/MmZjdpWA8enMiDm/hoETRa28mYh0YDaCmZai7T63tAo5I0t3GdqIMwy0ad
         0AcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762854330; x=1763459130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nmpwq9Y4K1E48WXNTAOK6Thjd08PZ+n1dzKkwN85Vb0=;
        b=foawTQ9xqiEZeurcjDR9W1xg1a8i+lD0fE4tZeXA+RQNBUENnXiQPUygwHLqoLU09D
         UDkMbCc0O8z4R5EPXWtArrrwtAwv5k14wgKs9jPSj9d5KYoLkbK36svNYWPv59dIm0tz
         8eaUw7o0BT2pzbHCMtDbMEfGryFfZ+yACs+V7YhZ0K5B2TURwAW8EJS8jIxmbH/QJoGz
         rRd3F+2QWS4bn5z6wexjSCTbTVuR2kMS/N+YcU7qF4mrTkO/RvhgAYk+GDaLBUof0AOH
         W75nZToL5kRSpdT0rdiTGihMk151vUbYP1hUEXpue7+ijyjs6+DPnkUtLkNdrlC8b3Z8
         pYRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTmLoDmCCVka0dTJym8CJys3QoYKHuW5xSvZDdLBqfEq6Q3GLe6bq8Hc13DGHSBxE/FOUXNU4Q6giEsboo@lists.linux.dev
X-Gm-Message-State: AOJu0YwBGs5fIASgPqy9p9L33Pv3iLFmFgoC5HxNQaVA5CXLOGFvQrZo
	gg7TiwkAQrpxIa9W+n6oSqEYM83d3ZmNy5uHrUAglDCUA2Z+Wh/omfq6
X-Gm-Gg: ASbGnctMOYqCde4QfX5bIm5wB9OIed0XDo4LF3v3VW0VfAuFR/JKREsGja732iNPMWx
	XfzdtUht3k2oZ0WPunuYZsq2goPLpEtfs7T+dXEMG/smcDuGxc9SVaJrDvP49XcTmvsrlnhusnJ
	UY6LZm6bGkfWuZSCplTxcING1eqlLI3ldMI/K9W9Y0ET5NA1G/q9q251d7cdNLP72UggKT20gvI
	/Zxh/n3ROZZBKAnS0dawl6SVOXcwP3IfCjPbQ7SEk0MyHyBcd1J+EYH4pq+JBHQmYzHXCStGByo
	b0XfIn47tFKmiIa7mRiHpLaXP7M7kd3RAaRfidoT8zoSuYoWsfVoBXT469iXJq3P9m5SZ6LBxzU
	/rHqrrEgh/lD2+4cY7wpvydFWxSQAoabXswO0+VUtr4cp8YxhzyLonOk0GyIKumbB43RExp6+x4
	9TL7GjqLCgYJxy64Vi
X-Google-Smtp-Source: AGHT+IHWpS+03nTt0hf29otrjCs/XZ96klb6JhMRHtFvfD7GKW/VFisxIx4dRvm/W0bepZiBYm05gg==
X-Received: by 2002:a05:600c:458d:b0:46e:59bd:f7d3 with SMTP id 5b1f17b1804b1-4777327cb6bmr86750025e9.20.1762854330400;
        Tue, 11 Nov 2025 01:45:30 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cd45466sm359537865e9.0.2025.11.11.01.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:45:30 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: johan@kernel.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH V2 01/10] staging: Remove gpib build from staging
Date: Tue, 11 Nov 2025 10:45:03 +0100
Message-ID: <20251111094512.6411-2-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111094512.6411-1-dpenkler@gmail.com>
References: <20251111094512.6411-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is no longer needed after the gpib drivers have been destaged.
Remove the gpib Kconfig menu and Makefile build rule.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/Kconfig  | 2 --
 drivers/staging/Makefile | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
index 075e775d3868..2f92cd698bef 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -48,6 +48,4 @@ source "drivers/staging/axis-fifo/Kconfig"
 
 source "drivers/staging/vme_user/Kconfig"
 
-source "drivers/staging/gpib/Kconfig"
-
 endif # STAGING
diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index e681e403509c..f5b8876aa536 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -13,4 +13,3 @@ obj-$(CONFIG_MOST)		+= most/
 obj-$(CONFIG_GREYBUS)		+= greybus/
 obj-$(CONFIG_BCM2835_VCHIQ)	+= vc04_services/
 obj-$(CONFIG_XIL_AXIS_FIFO)	+= axis-fifo/
-obj-$(CONFIG_GPIB)	 	+= gpib/
-- 
2.51.2

