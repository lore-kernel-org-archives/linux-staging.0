Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBE615A85D
	for <linux-staging@lists.linux.dev>; Thu, 27 Jun 2024 12:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719492266; cv=none; b=RgiFF87YE5X/KxQG022zx+Sx4a4tf4dDi//sbiymko2w3/fx0KBKz4b2EkeROX5MHBaN9EJPMlVrwzfXQyfvx7GSrzAMxjd8ETrgKao/Bgs4th103Dw3SHf6GUcnpdJCATW8gFVVLb8OETT49wy5ene6sQF45RppU/e0QJzMb3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719492266; c=relaxed/simple;
	bh=pi3DHNQCv9R6UCFWH2MdSRk0b7vmsHj+UgIAfiRMFTM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AjjRMKW5VD2Rl5VWI2b0ctGbltEQeFqDH515Y7ciBZitC5BkQUEeM4cGpGsJUmad05OTNGO38lR+kPE+ofCdWPbC9eXXn3PHsg9KHpiqbsiM0QN0K+3uOHe3coBPBbyVw0w2sZ1hcMG24PSIWGSKGV1dHeTRG8WVN8VtE06Z9d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=y955o6s0; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="y955o6s0"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-584ef6c07c2so898546a12.1
        for <linux-staging@lists.linux.dev>; Thu, 27 Jun 2024 05:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719492261; x=1720097061; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AoHL1adqPi6egt2LDvYCmnfXjH4AiRnMDVVthfhiOGY=;
        b=y955o6s0nptPLFTeHAgLHLlXCFh77kH2u/pDhBjUOu5XaLDVTUYLu9/7javdO1K3VZ
         wJVGTWlVHZbdvYXJ4U7qxTrPWhgHi976eNkC4FUsPScrqRTUUMQIwbaCgHfHnBA2hR0O
         CNpNrvKbH/LChPxEEFY0YtPAEDXwQSk/sDkY6f/BTCK6+n0F/BfcYmPnrZ1gGT/Y4PY5
         KNNX3ItCg33sHw5DBql/+nBFeUNMnlb9WLHW3kyHTunYHP8FeRjyCpZhPcKXoHqZtYx1
         dquSf5drktxpow2FpZDdLQhtYaxWpGLSUtLE00aD+LoDkp6kOMKU4Rzr+EZqNJJQCW5B
         2tZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719492261; x=1720097061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AoHL1adqPi6egt2LDvYCmnfXjH4AiRnMDVVthfhiOGY=;
        b=gWjrNuGDBeXezq6wakHEsB6RWadNHVX8BYy0yUv/ixPofkV4HqNrhp9hGc+8RM+zaf
         9jdW+kZhqcgntzkFZbrsXrE43FGuVoI6vL8003sygM7qQuYuOUrKwLm89hsHBUK5s5cB
         Q/FaX+H4Y7uWhc7xedLrEzz+q6iFd2CtLYV+Ycfip1eOnaB4q1AWgRkKp58j5Z58E0Uq
         G/RZgj3P+nT0kJKGYLDTuf/7r/k3BAKUh1AU0DgnCq4q1DwtTCkj6KiXWrjUvg2c22X/
         o+j626Z4CRLIpDk056JduHcqVFFZjwSf0iH49v7p/b5q3VNAHU4tqHYMbu/Tkc7Wpn1N
         NbbA==
X-Forwarded-Encrypted: i=1; AJvYcCUg6o5vAZlNTlQbI+NDiKeHcSTshk8vpveGRl4vLAKeNSAtOtV94iwo0cyA69D8yywbC9UX/TzQOSVBqWGtdvaHz5ayn54ODzYCXEHS+A==
X-Gm-Message-State: AOJu0YwF31q1R3OkKZfUe+zqylEzAKmijQNlitCH1dCjfNqZ5AFu5Bo2
	xAZSikaEd9AU8CwG97OjOGO4nbX8HiFSOZyKYRf9iIsrZNODMvGyZCNvebGDnTc=
X-Google-Smtp-Source: AGHT+IFeaiSpwuIh7g2JkEWpjFnfDJbPJTm3K8sWRedli0PvmQPwA/kwXIvdntky4Hl+GJAwNEAyPQ==
X-Received: by 2002:a17:906:99d5:b0:a72:58c3:2696 with SMTP id a640c23a62f3a-a7296f5d2admr226130066b.14.1719492261140;
        Thu, 27 Jun 2024 05:44:21 -0700 (PDT)
Received: from ryzen9.fritz.box ([2a01:2a8:8103:2c01:45d5:74ac:5265:59da])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a729d6fdf62sm57030266b.8.2024.06.27.05.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 05:44:20 -0700 (PDT)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	gregkh@linuxfoundation.org,
	umang.jain@ideasonboard.com,
	wahrenst@gmx.net,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vchiq_debugfs: Fix build if CONFIG_DEBUG_FS is not set
Date: Thu, 27 Jun 2024 14:44:19 +0200
Message-ID: <20240627124419.2498642-1-bero@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 42a2f6664e18 ("staging: vc04_services: Move global g_state to
vchiq_state") adds a parameter to vchiq_debugfs_init, but leaves the
dummy implementation in the !CONFIG_DEBUG_FS case untouched, causing a
compile time error.

Fixes: c3552ab19aeb ("staging: vchiq_debugfs: Fix NPD in vchiq_dump_state")
Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
index 1f74d0bb33bae..d5f7f61c56269 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c
@@ -138,7 +138,7 @@ void vchiq_debugfs_deinit(void)
 
 #else /* CONFIG_DEBUG_FS */
 
-void vchiq_debugfs_init(void)
+void vchiq_debugfs_init(struct vchiq_state *state)
 {
 }
 
-- 
2.45.2

