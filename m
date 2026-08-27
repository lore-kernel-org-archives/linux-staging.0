Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B448E4D2EFB
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 18:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854693; cv=none; b=WlKB9v1f/hfUYbrL6ybDFceDYYIUbB1vs2CbQNhUmkbKFFu8pAoTri8Wzjcd/onbsxZY9s3OQaUeGHWhyRE968kJkQCS4GDiQmpROD4HOOkHj39Ru3aNdi8/hv1XaRblHtb7/cW4qqbiWzBHz3KrQJxyKYnMqsTbAsBPlYcnPps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854693; c=relaxed/simple;
	bh=0W86G1FVyLrH8eCxu7apKBLqbZHmbhKhBk09k3X289s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jUGaR7GWr44L4xXHJOTdgxNm710mjceQ6S+e0DTboxvDIohL/yuB2YB8MULVSQwQwg1Csit0vGpyeahaHdoQZt0wc5YEnzoJyB4B2YH2/5QPNZyz3c3AvENcCjVlGgksOKfPKuQiuPLiB0YI0SOI61g6JXJqAoUlEhhOX7RS37o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOo8OmFP; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOo8OmFP"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso381575e9.1
        for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 11:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854690; x=1788459490; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3oYYPYPZQOW7+2xUgNgawJfoO4cMemnykLQ9bttw7OU=;
        b=KOo8OmFPhdqx3+b1GSu9672g5vG1BGHKsno2B40uar/bK0RKLXLtew5bhwBnBRSejV
         mGqRlSZzRffFLndnTWTPEX8Po32qvlgQeiJtoqP6bJke6shZq0no3C1KR46RYKJDp2FF
         ufHn4u3i2lEREhRzySWBwbKh+f26zXND3Lil5PyH1uJORBpQK0YpJXK5fOBlFj6VOhvu
         ImufVmPsBEFm7eangUjgAtTN/guyjlggn7A/wXy9nVujgv437LweB+mCu9xIgOitA7fq
         y2uZOrdnjXv2TkwQMf6VpC4xqW1c5q/IJY7M5K4Q8GFqcRv56m+zcHYqIm/MOKgw8pHw
         wwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854690; x=1788459490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3oYYPYPZQOW7+2xUgNgawJfoO4cMemnykLQ9bttw7OU=;
        b=advsPzvL3fz9e6DcMov9FmxEZIAMSoLaROLuHAtS9oN8xfPY09J6W+5Dpe+O5ksLUr
         ovS+GUTcHFzvNgjwnrQY7ApNXJtOWHpdgEXa5SanG58U65HH5lg8Kgzv1MpdZZHGn1kj
         i8C43FwCrZQthLXBIwfpryTCCtaBcQ6JJhpPywYK3uXEQLWoo+7sa+bKMFFv7ZYD8IIr
         DRN01dMCXfJ2brXEZtwahrzgBxY0Zl3Mgc7CCd+KFxRwAtVkDNRkfSKvWJSYWgWyhoyo
         o0K0dRRdzhkWhk/tiC26o5Mt9UiPWLxu3qzJNHPgJl+mFa0K4dsRpg6puEKKD69xxYx0
         iIWQ==
X-Forwarded-Encrypted: i=1; AHgh+RrNo4ZWyx9r2DH6lSdlYCBNEz9LKDJH0CcYWJ8j8VL6qICoPNkFKJTKZfqJ7VMDXVRLpsrtDhNfEtIyJ0CJ@lists.linux.dev
X-Gm-Message-State: AFuF++nA7mSY/75qFE44MhzrHtVcCp/tQAKp6tLmwOXRBj8A84IuEq/R
	ifRcSeNbJeLdOYbd7cXMGk01oiv+CPTUTpAULqo0Y2epybljhSUd0UrL
X-Gm-Gg: AR+sD110n1RHjj923+loICMG9Lpy7yk4yVPbeQmoYYc+drFDaB8DJPwfg2C/ZAtE1VO
	IQb2XVRIBi/YG+g5tlCc0fJ7/1qx3YKv2Y0GoI7sSNZ4EA8hPkV4Z+ttmxoe9xZXyiN78Pe1Rtg
	UpiENSfj21x65YHn8VAEkzQ6xa4uUQUAYXVBt8Qb18sf5oH0B1BnOWtCCmwpaWkb8WAHjao/Jzl
	OKszMvlvlg76uPx3pDF/X1lcncKO2F50rPM1uaI5wSEzW5kOZsYmGqnpkf1SMTbv6bXt5ULtCpw
	zAzZ6Oa4SiIbQqX5Pj2bJZcORG1TZljG5yWnax3c1LrxPbBMASRpjFaWTPoYngtATubKWy+YsBx
	FWBE5P9Xt+8XH5PFVFs1mAUOhB1UcroCm0ly5POC2kxPHWql7GAVHbCgBRaTtypWPjJXNCdI88W
	jHywoE0iDoCdaKViH4tHD8RI5DVaAmeF3io4tgukmTrOdUhhI89iAhrtzzzKT2vNg6yTNKrktQH
	KymmmrjfCK/93hOqDhm5vmh0fhpktcrn3dgpz+YV5sZ9bqya3xB3mo=
X-Received: by 2002:a05:600c:3549:b0:496:bffb:fb7b with SMTP id 5b1f17b1804b1-49b91c57464mr10724595e9.10.1787854689919;
        Thu, 27 Aug 2026 11:18:09 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm66270655e9.4.2026.08.27.11.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:18:09 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 05/11] media: ov8858: Add INT3477 ACPI ID
Date: Thu, 27 Aug 2026 20:17:50 +0200
Message-ID: <20260827181756.2430054-6-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
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
index b8c2f0d25505..b0ffc366a4e4 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -9,6 +9,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/device-id/acpi.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
@@ -2077,6 +2078,12 @@ static void ov8858_remove(struct i2c_client *client)
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
@@ -2087,6 +2094,7 @@ static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
+		.acpi_match_table = ov8858_acpi_match,
 		.of_match_table = ov8858_of_match,
 	},
 	.probe		= ov8858_probe,
-- 
2.53.0

