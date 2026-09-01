Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104F34A1DE6
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 19:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289493; cv=none; b=OqGH6+3mk2wYnOa4JCcGOSzDxPuGF9CPE6jonlKESCOtEYI89Tse9OSmv644oOXroZw5/h2BDY06AtL6FzYs/cjIuzADW2yqR+GtEJNsGZU++iI0SwZLdCpNdXol038lIhPdZYevEyFclRUi5JRhBz0Q3Cm4Q06X5HyfZJ9fShQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289493; c=relaxed/simple;
	bh=EXysUx/Mi2yYPLl4+sT6qBbUBxeUlVBGr4WTyCR2voY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NnDZkZorfK4OlNC/LWTcxLkIC06sK/eNGyd9EfJPZVv3nUZ8ro+GljkQIngXetDKAS+Q5UvPsAAKOWTkpNP18TZkbZV580OyGNHUOm2eawuGb+2VM098HSt0ZuoMBiz7ADyIgaa22SFRXm4VsnyNU48AEm9SOdaIXgRg3XQii/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nBDcqBwM; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBDcqBwM"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b8f86c6deso1071735e9.0
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 12:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289490; x=1788894290; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ognZlCZdfi4SFVd7C7og5EeWiW2/+2tCLUN3iR2p3A=;
        b=nBDcqBwMsy6nOHPbIU1Ei50P3EQue2FgkemA+U8jgNMYSCUBg7g7r4dVcjTXSs2i+a
         gp0ZScyI4NB9zTVUhukz9ATUw9xumaUYkwMer0M2G91ZQoavTwCQZ88Jk9S6qKPh6N+8
         jsrDi6a8e89UVQ2bbXXzuB5uEtJqRPPR4BsZRpR7CbvdTKjGkBlnIW1G3HW/+LGWe3XM
         kerU/z70S9rrRDQ6Uw/ys3FBzzWoRMGo5Kr6IYY1qvAjdbkfXjW7cTO00pvyQNC8/fYg
         gt+YgoQ/fvAaTNqwHtqXQ37cTbUNYq8ydTiq5CNS2Z9MKWb1kRvPEiqvdfF4vSsSZuVf
         wP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289490; x=1788894290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ognZlCZdfi4SFVd7C7og5EeWiW2/+2tCLUN3iR2p3A=;
        b=J8rDI5ryNtgcRDEyv6Ld9QXxYBz0Gp8pyzQqLvqy8k8L9PG2r0FOcj0W8y0iEPeK44
         iaJjDV2KV1jRHoEDmtbfa207eDpWKGeDvurTruqfVxVE64fA1iQzb4Em75Ou2JhrH09D
         D98Mn0rordiw4myQ8C8GG82wHpqc31d36Gna2oUidaO+xelXLp30veXcKUytB3k5MePY
         RZHlIqWRFR+33zxeyIAKWD/8wx26+6/e8i60eYLZwHoV/vJL3oOnhh7RsptbjFz1jN/p
         KtS17DcDbe2ICe3ERXT4h3y/ItFNKNfmk60E0n4NWnDCOQ0C+3Xi6T4N/3pCagY93q8Z
         5g5w==
X-Forwarded-Encrypted: i=1; AHgh+RrJZQp8k9ANAjODLQyOhuGnGLAUulAWJGcHWJbi8IF5Hbb0bHxDHRf/b67+35Nf2PP57pBjyKaRohNsge83@lists.linux.dev
X-Gm-Message-State: AFuF++mnbFSCdxlr9aXdexk5y91kSQSBsRnEfX22whyN46mQCngjDQFs
	0Bl++jkSP01pRlOqxw/izB9cpAEtFW/alOEVEF4R5OfHb23hiTpz4R/k
X-Gm-Gg: AR+sD13cKCFsEGLP23mLHSvcfu9rNcTb4huaznHylP0wSknQwjwdZxYNXHoE+3KP/gA
	2gKfBSShj+T/n5Mxb8sfEujeQt+v8tE8gk0O0vx2ba+SpKuuUsHaHUd4II89VUjmlLu0NcwoyTt
	MoNShZDxv6+CRwwnkovPklQy8zkpANcZN6Nnw2sNEbEOutBtXlGLQNQqUF3/LPMXx++qyr5bTCR
	WfX2RUdG3wXBPXcCLikgU8xX5AjFB05nXvBbJxYZn4L36f+D8H7mixVSOCI9g4TCWdF4Kre1npJ
	x6cIIztNwG8t3yZ+i/T1fgYZ0zXV5Hcyu00ymDQmF0+wfU0vK3bcFKmleRVZsDjyV5oF8mzmzEp
	CS5miQZGS8iGsFYkU7s7gcC7DVCNQ4L5BTr/Dry0QYxBmOYqLL+pKbfjrNuJqTUAuFWT70d39Jw
	qriJF9Rnwn2A9Hl1CLGOLp4wRWQtFNo49fwEVJBXHRB0EWsn5SATr9yZ4JNckrmRMKCsT2ZDJja
	2VJYGwyriNZihkJMBpr5icnftbitPU5p9ucCoett+o=
X-Received: by 2002:a05:600c:19ca:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-49ccee0f3cdmr367033135e9.16.1788289490263;
        Tue, 01 Sep 2026 12:04:50 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:04:49 -0700 (PDT)
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
Subject: [PATCH v6 05/16] media: ov8858: Add INT3477 ACPI ID
Date: Tue,  1 Sep 2026 21:04:27 +0200
Message-ID: <1c2ae26f61ce9bd9e6689c58df7b17e9980fdcf3.1788286339.git.mauriziocasciano7@gmail.com>
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

Firmware may use INT3477 as the ACPI hardware ID for an OV8858 image
sensor. Add an ACPI match table for that ID.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov8858.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 8d697b8d11c6..76769da94f80 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2017 Intel Corporation.
  */
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -2087,6 +2088,12 @@ static void ov8858_remove(struct i2c_client *client)
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
@@ -2097,6 +2104,7 @@ static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
+		.acpi_match_table = ACPI_PTR(ov8858_acpi_match),
 		.of_match_table = ov8858_of_match,
 	},
 	.probe		= ov8858_probe,
-- 
2.53.0

