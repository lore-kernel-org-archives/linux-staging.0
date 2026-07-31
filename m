Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04741450903
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 17:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785519241; cv=none; b=IAaLj97IwGipsi/PGG+9VwvjxET8isUNurNQ5vpdJdukQv2c1vEjEVHzrZ+1XQhgclLvS3SDNTxoPKI7cDLqyjjTETJcyMnRyQflevG4xyACHc5HrBdM8sPiQD7dA/gQVqCFPEVVESV2sr8ytO3RNH2GsbzstSeixjoGbwCWvl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785519241; c=relaxed/simple;
	bh=DQ1TmrGRpLc13LB/YJY94Tfg3wK66ljM5Z2eenTjWzs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IK4ZwTP+njnbD8FZIFqpjGPqpwuFwpn5W9wvBrjYEflDnuczlv2vsgWMnW7SdxvhYJ3DK4sIZcVkctKV5wlnuZD08v5tmmChOytRS8oB3/aPgr0egCUV/x5L/vut8unGSfz1gnb/0Sd2dygTQJloUU0ypmPx9PndZcs3ceGZbH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WYjesfGy; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYjesfGy"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7eb61bbeb25so938189a34.1
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 10:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785519236; x=1786124036; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ANOHrvNNVg42ThGU5lHf7n5iQnLKgGzGEzIwYA09EIM=;
        b=WYjesfGyg71G1oZsfMQBVnEnHQeghe2ObzFG38fzn/NaYM/9eeI7nCM5dpQIfC41DZ
         ylGpO8cL7IAfCLLXbs5qL/Z1SxSfM5bFuY3TETawdPJt/sxtdsCgsfUo1rbPXQ+Ysrza
         DODeBdL/UTcKBfDYoYRQS87xzIG5LPbygY4fV71gWcFcpveINsCwJECDHZ4iDapRneEF
         tS5KtEw4DoTjDKRXR7sg2wfEfOgHpuuln0Y6hIidXNuThkzRcriihKCI/AQJ7Dfj6nFk
         JAOC9yF89pJiKWe6Hz0mGjVefMznsNiuFpKXg7Qf1amaVyzPkFZiR8qViZr9QHETr08S
         ERcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785519236; x=1786124036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ANOHrvNNVg42ThGU5lHf7n5iQnLKgGzGEzIwYA09EIM=;
        b=WDCPQBsOUNWGsT1UWfZ0AKcalZi0UBErbJD0mV9QqtD0CiR+wWAx/fJUlgP2OrAI3i
         TWIo+28toVlH068gPH0A94pYxC95si7cPTh5Kp3TzlGHHqaFItdmQEI3MbmeKZ60VLr4
         qzwKDn2DfUioHirjc7l5HgVDF9M6p9zpd4kMjlTB7CEHqaJGO7sxJRcLkVNUYlx0z90b
         a8WEkytnEzB9jDiN/zz9/0nwhabQ5zTQH+tApfrlLVZrT301ZTbnmsMINOYSaZAUjyyl
         OI85gE9fBRWMgvpA+XpJDvhmQpos63EjxXDd7DzkfZdWtUF3Zpo/+VmqYA/4fXwdeXss
         1HUA==
X-Gm-Message-State: AOJu0YzRv4gB4DQv5kdNfrKvokpLbyQp9KgnxKAIYLFvkJUoH5zp01RV
	DaPRlWIpaWEIrbyBfTK4PKhSdoe0HHmE6a1rCeUD66+Vj0Lx1ComYrk8lPJY4g==
X-Gm-Gg: AR+sD10tI6b64xWyWXCEg/z6FddC6ovoL3xaa5Paf1ST/MfEa3XCmnNBkCMfhq2CdSU
	LD0+HUXeWj+9CxRJ18+8vLEjiRsljPBo70r+6H6SZHoFkpQS1rEHk7Of3lW7hlw9T0GKDAtttdX
	IeaGIfsJADUOdu60yxTAPtfN5ow242yhmCS3KMYGTWkvdzEKuMuc8m2gi2iEUWM7/ABiBnrUwql
	C55qiP7FW2w7UhzWCRwPHVOiMHTvzVqXT4xVENZ/mqCMIt4o/vEM0KabZw3zXbu0bxPapFPpakg
	u5zISvmSssD4Iev+qtWRiJ1w2/9Ph0ctEhjP7XyuxvDGgWmwC1Du/dW5/XeMNhWedfFsZXBlfAi
	9EtYBIkglFsyXPnczQSQ0vuQp8aSDJk07gi4F9ubTKcViDXeY2cLbmL6YI7yYcIJPRzQWhWoutr
	s4LZWVhetcC+RuKeHPdt7dIxDUbrvbv8fdA2+EtVEbFuaNCL+m8vI4hUwnaQ==
X-Received: by 2002:a05:6830:600e:b0:7dc:c749:ade3 with SMTP id 46e09a7af769-7f196b4278dmr1505612a34.3.1785519236373;
        Fri, 31 Jul 2026 10:33:56 -0700 (PDT)
Received: from zephyr ([77.237.186.32])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7f18ed9af83sm1151522a34.10.2026.07.31.10.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 10:33:56 -0700 (PDT)
From: Ali Nasrollahi <a.nasrolahi01@gmail.com>
X-Google-Original-From: Ali Nasrollahi <A.Nasrolahi01@gmail.com>
To: linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Ali Nasrollahi <A.Nasrolahi01@gmail.com>
Subject: [PATCH] staging: media: atomisp: remove unnecessary parentheses
Date: Fri, 31 Jul 2026 21:03:10 +0330
Message-ID: <20260731173310.101185-1-A.Nasrolahi01@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary parentheses around comparison expressions in ov2722.c
to be alinged with kernel coding style. This patch is only cosmetic and
does not change the logic.

Signed-off-by: Ali Nasrollahi <A.Nasrolahi01@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 2c41c496daa6..475bc521651b 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -731,7 +731,7 @@ static int ov2722_detect(struct i2c_client *client)
 			OV2722_SC_CMMN_CHIP_ID_L, &low);
 	id = (high << 8) | low;
 
-	if ((id != OV2722_ID) && (id != OV2720_ID)) {
+	if (id != OV2722_ID && id != OV2720_ID) {
 		dev_err(&client->dev, "sensor ID error\n");
 		return -ENODEV;
 	}
-- 
2.55.0

