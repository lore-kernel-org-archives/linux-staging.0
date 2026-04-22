Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87BF3CF676
	for <linux-staging@lists.linux.dev>; Wed, 22 Apr 2026 12:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776860427; cv=none; b=FPP9cPIeWCWUuw9jM21/QJE5mxCKsrMvRSMFw2KbEuOWLX3Be2QhrTZb4faTp8mhdpwsKV6JkO8wbG2dZjdcnNGjtdN2bQLT4mSyg0Sdsi5BDtjcuus3AeSuY/T+wzaekFfcac+dYjo8F5ujJ+zasNKEHxKtz2psW4NdzDcSH8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776860427; c=relaxed/simple;
	bh=Jz2IRjOiJ/M8WuaaKQqT9yeyni2Rlhh9VMwuz6lyXkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kr15Em4SkhpN+SARzjT5CujVcgPVesFwgCCc/0bJO9imkxMCwTNHxD0A1AVZw01PiGvonoa/yZVRLDj/JKf26jT6XiNEjm7WJ5AGJu7AbFvh++7q6qrHFjTdVwNpMO59bA+7JYT6pVJ9dD0n00rLM1gmvZc2xeZFjewGer2gg94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXFvxA6P; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXFvxA6P"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c736261ee8dso1971799a12.1
        for <linux-staging@lists.linux.dev>; Wed, 22 Apr 2026 05:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776860425; x=1777465225; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9o+1Y3qFEujqIV/P/1ozlPANKTLBduTXUFO4gXypNYs=;
        b=EXFvxA6PlYuozqkIhFOngMWzJPGTlXto3E1Mx0Qi9W2nU74Fn+Lfy2Rha6wEOTgUrj
         z4Ka5Ye/GBTXKSudNFjNL2TFpRSYS22mSqGVDX6DgiCKZVGtviX31RRjlW5Kpo2OC8ZP
         YURzhte4URwPUsLlkLFt1CPdjeuJRQVl83+bwiW/EXGx8rp3NPsMt+XVrMtfRA6QpkEz
         eb/UcZWq1TuG1saAeJcgp/Z09zSeWO0QcKRfHbNvtUScYnB/WJ4EAFdxaY3JG1bpaCqY
         MaUbVkg/dlxp0Bw4a9/hTCnTjVaQUQ+w1BA/jViPhrA5YIaUEEJtsT5E8V5d+XisjuzT
         UZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776860425; x=1777465225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9o+1Y3qFEujqIV/P/1ozlPANKTLBduTXUFO4gXypNYs=;
        b=Tfzr1kNVI3GMKqtlISoAla1z5FwcV9IJwLdSlEmGkltuTO9IuRcpGHgcqftrxHjRGH
         v+VkYvas8ENPhPBZIRybWHY+rJY+BgSCNinJ/O9hotJPdcY6E3Po/zbrXAhI1ISSCQmz
         A11jxkT73OXueEUJuF4jmFLVeX+1g3f8shbCVeFyxQHMDMBU+O8zKBtr4MqpqIPVeChx
         a6J57XoJIsm5Z0bvacm6qf/Mx4QC6hWbh0NeX++ZDqISurSHmTmqMEYD0arResZb9I/W
         y5Dbktck7OveU9KEFQgAsaM1krIh3Gwz2sExC6YOOTpl/gJ0RIjGbTSmRlqVGrEyZtFQ
         Z1WQ==
X-Forwarded-Encrypted: i=1; AFNElJ8MDp+o7DEAYnxNpcMyTLB5gUvpS0h0OPcjO4Oa/FIYTF177fh/4+K9BFxZFkLQwjleUMbWAP6doVlAWkDR@lists.linux.dev
X-Gm-Message-State: AOJu0YzkvmqOVbQhgct8Wu+D45WihHYbewecmifamQInPp7Zz8FKVfFj
	Ydu4PlvTTz0ePcYe6JjEok5UET+PBlLwQIkbA079kQfkwHXfZLLMiLDn596YQA==
X-Gm-Gg: AeBDiesG0YBwZ05g1XIpLaaNZo2hPIEev3/NlTz6be+X4jdaX2zG+owJiTHlxMgNvC5
	MqBAoeuZ1OPUCT5Mc/Cf4fl0/DESa9ADmEcjxKbnRxvwrhFc7OJ4jqnD5bNnYKChe9stS4V18Ps
	rXetv2DOJCmvxUPja6ThvddIX00fXwAyrRojJtF9ldGpsN+9u3rEjSyZ+7NgrkDQmaL4KW+gCRN
	bKHlCnziawTJs3etombQYkacZYHfID562dv2V9ebvpaa2GrkfJJVJrYCKCBCH/VuqeFJV4bs7hI
	wt5PuY5AWnZ3xktKbzH2B9n3eegUeIiG1KCoj98zWT9x7MHusgkbV6f6X0c/t36DYG7pymI2TL2
	IEw7MszvA/fqjO7ncIsYAYhzUO7U3EHUyaC7eK20l25nqylQCElKNY1XG4RmcnTkDBUDYyaLlb0
	yn9aDTygUPSnq/lWr7m7iLDxYaqfod/iRh7k9YSIjhfh8q9VR+7Nko
X-Received: by 2002:a05:6a20:7faa:b0:3a1:90ef:7e31 with SMTP id adf61e73a8af0-3a190ef81d8mr15048824637.54.1776860424962;
        Wed, 22 Apr 2026 05:20:24 -0700 (PDT)
Received: from arch.localdomain ([103.182.132.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797701b1a3sm12798030a12.19.2026.04.22.05.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 05:20:24 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: andy.shevchenko@gmail.com,
	andy@kernel.org,
	debjeetbanerjee48@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org
Subject: [PATCH v4 1/2] media: atomisp: csi2: Remove unimplemented DPCM decompression
Date: Wed, 22 Apr 2026 17:50:05 +0530
Message-ID: <20260422122006.29390-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aeiuhvqcT189lL5U@kekkonen.localdomain>
References: <aeiuhvqcT189lL5U@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The source pad format handling attempted to map DPCM-compressed mbus
codes to their uncompressed equivalents. However, the rest of the
driver does not support DPCM decompression, making this dead code.

Remove the DPCM unmapping logic and simplify to directly copy the sink
pad format to the source pad. Add an explicit comment stating that
DPCM is not supported.

Signed-off-by: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
---
v4:
- Complete removal of DPCM decompression attempt (per Sakari Ailus feedback)
- Keep source pad simply copying sink pad format without unmapping
- Replace detailed comment with explicit "DPCM is not supported" statement

v3:
- Drop "staging:" prefix in subject (per Andy Shevchenko)

v2:
- Rebased onto latest media tree (fix CI apply failure)
- Fix missing linux-staging recipient (typo in v1)
- Fix indentation
---
 drivers/staging/media/atomisp/pci/atomisp_csi2.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index e723304bec80..64419c1a805e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -107,17 +107,10 @@ int atomisp_csi2_set_ffmt(struct v4l2_subdev *sd,
 					     &tmp_ffmt);
 	}
 
-	/*
-	 * The source pad must expose the uncompressed format even when the sink
-	 * pad receives DPCM-compressed data. The hardware decompresses DPCM
-	 * (e.g. SGRBG10_DPCM8_1X8 -> SGRBG10_1X10) between sink and source,
-	 * so propagate the sink format but map the mbus code to its uncompressed
-	 * equivalent. atomisp_subdev_uncompressed_code() returns the code
-	 * unchanged for formats that are not DPCM-compressed.
-	 */
-	*actual_ffmt = *__csi2_get_format(csi2, sd_state, which, CSI2_PAD_SINK);
-	actual_ffmt->code = atomisp_subdev_uncompressed_code(actual_ffmt->code);
-	*ffmt = *actual_ffmt;
+	/* Source pad format is copied from sink pad. DPCM is not supported. */
+	*actual_ffmt = *ffmt = *__csi2_get_format(csi2, sd_state, which,
+						  CSI2_PAD_SINK);
+
 	return 0;
 }
 
-- 
2.53.0

