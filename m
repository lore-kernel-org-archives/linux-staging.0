Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EE54A3D2E
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 14:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360843; cv=none; b=ayz+z13qPQCW8K1T7/BjEl7RkLtqAWdkYBmWTPl3UvgRbnXHX6xjx6zHfXCjvWdgRsw2GFOxME3+moPFDSHX3sCQCDFWMQfMK1TZgn7IE8cjRG9cYSXOLTHzu0LKE2IfXdy1fy4MGJkuG5S3KhcFDYNjErf0MfZRhNdZSByz+5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360843; c=relaxed/simple;
	bh=TXh1grcukppVIGRq/jtRuAjsCenqoiHsQqtjG9cBjkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rQH3VEeq5CDNo0GkRNGwKK+ZQqkn2he5Mvgb6u896EW7ijHWIEer+8MtnKmuGru05owltr4+ykHGFYdF0IAASQfpL3uvrfNGNAlB4tGmGSjkMhOQ3X7nvPQVHW9njLyET94N/9wV5tkgVMAi8K/P7UpVjEUgHNrP3MZEbu/z9F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRjprpIB; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRjprpIB"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48441fa5c37so807822f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 07:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360838; x=1788965638; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2f+YxbIheZwHZGTF63Z6dyP3lfK44zOBXHl5f5gYzlI=;
        b=WRjprpIBD7SOCqokJvQfIn9uigmgCAbH86R0cvYFFpaAU4iLqz7h7k0xk2fe7VNILK
         Hjxk+VFUEGFN/rEa/RvLVm1aXg2oZjU8IC5Q77wtQU7CHXoKEa2Uui5y0oWwJCyeFjHy
         uB8uYv7vmUaVHCMcFWDunYIaBaFagCGk5k0fYeMlNK4+yOc2Gk2r/RDVkCFoxmNX9KVk
         bToRbWRGSCC+t1CcPzOId91V8ClyMrbqf9PTGIoU/mv2ScMXP5eK/1M2xGCR/mlGantP
         YHFGY/qf4Hh53ITYmFSfKTD0wsHS49DyLksZa2BI3GlkWilV5V8C56B06HYyx/vtLBIC
         Yh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360838; x=1788965638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2f+YxbIheZwHZGTF63Z6dyP3lfK44zOBXHl5f5gYzlI=;
        b=FVj3XuBSnqsV2osjqvKj3OdrQRnPbOULsC1C7zP97v/ermbXDt4sBsumQO/Z62xDIt
         lJEBULZQpkvZJtruzkPOqHYaLGlMJ4Tz+3iIGL/zqbjSJ1IdohAopcSCprPCJB8EUewd
         MF8cX60l+sp91JalcxLX6mLrl78WIlrafDqOKdhs8xidlYkdiAZ0xy0Emz6DcZpSvBqn
         GVXb0pFtfwpz2yBoca/ETzZQg77gEclSU1NFpg63coIziiGngujlnSeQexGVPf5lnISg
         dV2fPHPm4c/VrYDAYzeSqzL306h42wLdgBXu0hcGtG/FDpZuWG2GvFuDTpErboy0J8tO
         kK4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzP96JDPc14RadEyXnrJNO4xXsI5V8qtnc+cb2o9KZsMfaf5gtusmcBdrWXmZTPcFK2OT7ygF5U+DB6szz9@lists.linux.dev
X-Gm-Message-State: AFuF++nqwirhjIOcT5Sqe+zdl5wYaHUcHmc49QZz1vQG3KB2nvUnkNdW
	hZjgRLUy8cbJoCbea6/cCwyRIfqqSJ9mSGw6jaXHQcnfYHKVqYbefC0H
X-Gm-Gg: AYBFou02FeuMoxjo+J+FRg0uuZan15JiMuR5mG401CjIPkEO9pwMTq9J8HHaVWcacXR
	C83FpsF8LEcq+WhWGA3Bv8rGPjX+HwuF6ap+OS1+Dz9rjKlbez3Ec3AQC4vjCgjbElGF/Xx3ShO
	S8k9sfXPkrvaAIW9KR4soh7aL7jDKXoMcGhCF816S6YBhhGDFMotkeoyDYR6+/IC+TfRPZOtcbN
	bJRwkhZT/NJYl+PhS4apg3zX2+jBxeqR2+9qc2U2VfnEIBqQgoU5yLSgPSnY2zu2c62lDWygRIH
	q7BiricncxI5GD3fHQYRVkYnndl493uHwetpE3FFVQu9gFeOsylDWwk2Bfbc2+SLOTPALgK5lqY
	+I7ulGs167ku+0bj0dSlbyF+N3rpmT6inKLviWJxiFuANZM3t650b3WBS1FjmoepJRyewX9DxjF
	phRgkISaXewfgWj5UB2GcfGSlimGsVB+pm20Yc8f95/UzocyuZEhEMQgY4XFzq0vpQ/swar4ZLj
	GOZD5qet6yD+Cfm7S+8SGMd3JA7mhhSZkTGvKm6I28A
X-Received: by 2002:a05:6000:288b:b0:482:f09f:b262 with SMTP id ffacd0b85a97d-484913b88a9mr8501885f8f.20.1788360838300;
        Wed, 02 Sep 2026 07:53:58 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:53:57 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 05/16] media: ov8858: Add INT3477 ACPI ID
Date: Wed,  2 Sep 2026 16:53:34 +0200
Message-ID: <3cd0749fa48afa1aa89781867bef49d3e6dd4e30.1788360629.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788360629.git.mauriziocasciano7@gmail.com>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware may use INT3477 as the ACPI hardware ID for an OV8858 image
sensor. Add an ACPI match table for that ID.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov8858.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index e040c1fa0a94..f639d2664d81 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2017 Intel Corporation.
  */
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -2091,6 +2092,12 @@ static void ov8858_remove(struct i2c_client *client)
 	pm_runtime_set_suspended(&client->dev);
 }
 
+static const struct acpi_device_id ov8858_acpi_match[] = {
+	{ .id = "INT3477" },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, ov8858_acpi_match);
+
 static const struct of_device_id ov8858_of_match[] = {
 	{ .compatible = "ovti,ov8858" },
 	{ /* sentinel */ },
@@ -2101,6 +2108,7 @@ static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
+		.acpi_match_table = ACPI_PTR(ov8858_acpi_match),
 		.of_match_table = ov8858_of_match,
 	},
 	.probe		= ov8858_probe,
-- 
2.53.0

