Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC511C84D0
	for <linux-staging@lists.linux.dev>; Wed, 26 Aug 2026 13:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750591; cv=none; b=UXY3LL6qGhCJL70uws862UhJvAzSN/bqIcg4F1WOUbWjR0aXP7hZSoOjiTo7oUueQ0k6JQ73G5KCkXa68Z/McUREi6lsR4sclSXa45OqLi3buuCNIeish5u8g3jvj7po0WFI2ISqw39bHyLQjN2HWb3/4AxlQsAHpy7RGZVQbQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750591; c=relaxed/simple;
	bh=Oi/dCIRA/+pshEFx53wMZKN+XEMFr0GqM+M0K4ABDm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eWw4w4jvTqF9TzaQgAq7aXpAccyoi9s3qEzpWCz7DxXLg4NroW9OY+tmDjsOSwaQC47ikKzLkJ5dxJbz5OvgFYPPlJe4vYuHRYrh18wuPZSGrOCqXj/eqWyT8wVHf8u+49nw1+WHDL7hUFtIhTMuGISgLS/6l2y5sqwIME/M6q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A712iY1I; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A712iY1I"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15d3cd51b2so137757766b.3
        for <linux-staging@lists.linux.dev>; Wed, 26 Aug 2026 06:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750588; x=1788355388; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VMc5Fvp4Rfyxekd9+9mnrTAhpeQULh9Pwl9GwGfns1I=;
        b=A712iY1IE05JmK9iVDV41NCBu+q89A0b/QbynLFGlH71MKDJTvez3l3wBBeIWgKuTo
         dAxWKNJkF8D9IY2Hb0VK0TSC76heCoMe3bjXuHf6WFYudsrOo+bzqC1x9L3+XTf/1hQ0
         qoeslUiF3tj9aEcAAPf5kpRLdE1UJofAHiOCnkbqMvygRy90sp+ELsJ+XAMbc0tx+I3x
         943LqUi51GbBAXa/6PVKvtbg148wOJksK/OHzhHl9SYJWg8KcU6um4k5cJ/T6TTKz13N
         vNrN7AGVlxKhLiKMDR/fL9e2qFAujL4mWIXviSeNSzv0++ssPUQXct+HbiuQcpaDOggZ
         ahkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750588; x=1788355388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VMc5Fvp4Rfyxekd9+9mnrTAhpeQULh9Pwl9GwGfns1I=;
        b=pXq9Ku+2qcAFMsi0y8hd3hIzNN5ozUdOXhrxjGIJ8tjoWEduLaWcU8vTcK7GuH49v7
         KFIjY8hNFZSX0kraN++4hR/lWkDrq80mcvv9YRM7Gqn/OVmQQnixwo7rS83bEXWXNW0s
         KYEclAaR5TFtRs3lItMbCjsZmjnhmGv9BTyn18DM3851p8ArwTXd1hejembTjCulpKmg
         q5dUnx06bX77c7wV3bwUOD+GZO+VXISnE7jf7qW3T6AINsFBggzc6khM8n+oFoABPXNc
         66Swvsz67EaqQNZeEDWwSgSYbkFn5OOrMHseIkxR3xLOQFhBVCHQwIWQn4+GMVl/7kXx
         PvUw==
X-Forwarded-Encrypted: i=1; AHgh+RpVbZ//TQnoA6zQXF2NLDkbMv+s61OSihppcmnXSAK16iPjD4Z7bR+2cu7YdDIEE+g9jK6bXHBj3LrN4wN8@lists.linux.dev
X-Gm-Message-State: AFuF++ky57GfCuy6kzfzY8dDIJWPd73OT6iyzCGid9mIAiEq02jc66Wx
	MitvIv3ZkCgyK4KRIR8Zb4/ptdUZqziTCBBc4o1MR/l9hjaenCzvqTgI
X-Gm-Gg: AR+sD10sKXP5/Kc6HEOdF8bVGC6c34tPHyTPkDLl7mdHm4kA3Mi9jOi5+oLVIW7hfZ2
	mtbaGEyvbQTFXskk9Yi7Hh2UwJw/Rm/KKPXI9TJ/iFIHiMGrbldoDtVvi2vJ1vwg8qFcwQWHlRu
	4PdGUKPkRsy+1z/R6PyyIv8RrhpGkKwz3oVlqRPezA3rrcsqzzhqCLOw9ruBBrBOLki1zY/KW/7
	mbg1UOTNHIoqfntcV9aNy0zvAPqlUTg7MzWhunGhDluYYL1PfaBLfmZDgk8FRTyMnrCop7ua2bN
	8AYRFoBHX2rJFzIDU4hokWiWqpPcoUwFTwHunWvVn/l4ZfU35yMQImXed2ipfFVM03k8R2kagSR
	G5WE8jn6H1SmrycHBlem9DX8HOlRkwdhNGQORm88FTr7KZwgaSXukJRAG0bcDmVhmCIaT35Fd/L
	7BuxKDeX4K98YSVp7zaFxWmiWwDS4jW7uqCD71pw2gxgelz1gOkSB+5W3Xn1i0D9iY3VGDhYxdx
	cb0BOVvuh0z1MjSlAFXmBvVTfTr+JD/9e8pVLOt0A8=
X-Received: by 2002:a17:907:6088:b0:c21:35d0:f435 with SMTP id a640c23a62f3a-c250bc0f8f0mr856005166b.10.1787750588312;
        Wed, 26 Aug 2026 06:23:08 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5dea83a30sm3633147a12.15.2026.08.26.06.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:23:07 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH 2/8] media: i2c: Add Yoga Book camera ACPI IDs
Date: Wed, 26 Aug 2026 15:22:50 +0200
Message-ID: <20260826132256.3343451-3-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91 firmware enumerates the front OV2740 as
OVTI2740 and the rear OV8858 as INT3477. Neither ID currently matches
its sensor driver, so both I2C devices remain unbound.

Add the IDs to the corresponding ACPI match tables. Sensor
configuration and CSI lane quirks are kept in later patches.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 drivers/media/i2c/ov2740.c | 1 +
 drivers/media/i2c/ov8858.c | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 39003c1632ad..d85d83bdd203 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1462,6 +1462,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
 	{"INT3474"},
+	{"OVTI2740"},
 	{}
 };
 
diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index f2bed3e88382..5a97f21ab89d 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2017 Intel Corporation.
  */
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -2061,10 +2062,17 @@ static const struct of_device_id ov8858_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ov8858_of_match);
 
+static const struct acpi_device_id ov8858_acpi_match[] = {
+	{ "INT3477" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(acpi, ov8858_acpi_match);
+
 static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
+		.acpi_match_table = ACPI_PTR(ov8858_acpi_match),
 		.of_match_table = ov8858_of_match,
 	},
 	.probe		= ov8858_probe,
-- 
2.53.0

