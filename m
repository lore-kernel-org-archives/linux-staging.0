Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D334A0EF3
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 19:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289490; cv=none; b=qcOpGc6P+z3okDTNKI7OAdv6A25fUE9y1gAW1NV/X2ByBaX0U9ZlHgCJdpbmmKQh7wqe/0aE6+ZWKBLMKAtuE1TQkAFwEQZiqjF/zJrBLM7IiWCKoT72wGkOCyrdw8Uyik4XR4gn7EfBGztn6p4T0R0J3sPrl4tobopKrT2Ey3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289490; c=relaxed/simple;
	bh=a4oCgSJxVT+Yvyj6OvJRra4F7RQTRxH4QG/o8/Ybv3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gn4qLp0Svc0pB3h6fe11St4/paDzAnm9nwrmKLHudz8jPpR5CsV0+RCuvYuALs/p9ouRB5Th/2HaUAJ6/pWGdN7Zp7A812+ph8+3XG+DQPPTZXSqZJKOiHID55EyZUUmRQs6/od/unXyA+L+V7CR67zF2j2wENewV3KniZs7yK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pAtxb6DP; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pAtxb6DP"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso1077075e9.1
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 12:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289487; x=1788894287; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mENIAbZRTvAZLCBtejhgUDs7AYKS8queXWQS6mtdC+Q=;
        b=pAtxb6DPn38G+lI7sWMoppS6YPFjHr5MCOmqg9M2d0rIDKmPWWpS2Z/mXLYHMpb31m
         ukSotcOX8gUhBlSyZO2MYmQQGmpIC3Dizst923SMWm6fkOl6aBrKgZIXmZQKNGA+HSRt
         EbPR4qGEb646b6Q8teCW+eM7yKeWqrjQ2n7rIX1khukLugb1Rs58vPF8Wbrxb2GSvY8H
         USJZtpsw5Vl080ddRTrsPjqe36mbU7Yd/aSNblgp6y9fi+XRdjgFUbdCTbFMnSU8PAAC
         ntHv83iYySHnO1t1t+EuIV0EZkqP8gJGRgZjw6OiwBSEFu2bLPu9QMt9MxvYPnBCPeY7
         ZvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289487; x=1788894287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mENIAbZRTvAZLCBtejhgUDs7AYKS8queXWQS6mtdC+Q=;
        b=VfL0kr9pHYx577THylABjXmKSZq2uj0U1jQXsSb8XUWr1yKlPJHauSSDaUwrWiCiLF
         FIURl9FjDRvXKcw0X63yHOWhHWKHnt+sMhBtSNUxKzfFyt6eb288CHzpc6wZVq7GANbG
         CTvVmYMZuS1cX3gmzUlzprq0RIJtgdnvZBcOrezCW9rQUcv4EhFchD0E1mlbBDwkHJBQ
         Jyp7x7T7Zt7S5XnOCRwSIsUy32jv1dql3Ttk4R1dflPQoQx/BtN10kvfmPt7u1kviFgd
         JAuruy8vMeRZ1GbCL6zrAYyynbav2E5YctwchsvLIOkNHhzjXpPgfppZAyHwIcFpp8pE
         Xulg==
X-Forwarded-Encrypted: i=1; AHgh+RqUmCPVEJqUYBDgjvZg8JHrRfah+jqKcxH1KwNP/dvhhzrnGwke6QUUfs9hUj+GB4yxjCMiYn27szC6aOC6@lists.linux.dev
X-Gm-Message-State: AFuF++mKAQ157jLXbJS0WbUMHrGeNU7Y7HEqKb03fvTkRyddengr1b4M
	51PDOoHLXs5hr3x9yP6TSQBLvsAHspTjT4bodP4ELA/S5GTFAkgoGiRT
X-Gm-Gg: AR+sD12GKnE+aqlqihW+PYD6QQaLOVwNcvu9/cCP4r10WWMI9KYcENyveievxNsC5qu
	eZkY6nbl2Oxt2n2QvS5I/D+ca4VLvSAeO2mEKHRjcRMqoHsvsBAiCWt85idBzZjwLDVc92fT9ma
	MzKxDM7Q5y1wtbptMxvhoY+OH2ITMawdC3ATsAT3H6fe3p5OBrceNr+lKyL8IsMKgqhNusPgCXE
	7a9ffCU/hc8/47ynUFYoEgHYFgDvJ2JlpUU59V4Z7vO0ZNxIT2tk2qMaExEeYR2a2SC49oJs6P9
	Metwp1uaRFFucpsb00H5+c2CxWpZ8Rfb/qmcRyb/xhVAco9lgdfe5xjbq468HIOOSBezETzlzGF
	Iivu73H4TLRhw8hgC3GaJtVu8VImJYvJ4rZNwlSm7KYDXIF0nxCZqiiraPSjyI/pK5sWyq6NGcH
	wS/AZ0b1IEvDWRZXfwIe8iKmWFnkO7kUiUi1NRPqwrRXIr1WitFSRYT/iA8mvUlznjoBm8lcREs
	Z67Lj36q6a2OVG0Yme1HVnrXjYZgqbL538jdTzQog==
X-Received: by 2002:a05:600c:870e:b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-49cdc43f461mr233470195e9.12.1788289486489;
        Tue, 01 Sep 2026 12:04:46 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:04:45 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 03/16] media: ov2740: Use C99 initializers for ACPI IDs
Date: Tue,  1 Sep 2026 21:04:25 +0200
Message-ID: <3071a34e3cfde59e408390b6056dd551d5639162.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use designated initializers and the standard empty sentinel style
before adding firmware IDs.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Assisted-by: LLM sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 39003c1632ad..8f0ad5dbb245 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1461,10 +1461,9 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 				 NULL);
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
-	{"INT3474"},
-	{}
+	{ .id = "INT3474" },
+	{ }
 };
-
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
 
 static struct i2c_driver ov2740_i2c_driver = {
-- 
2.53.0

