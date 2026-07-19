Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BAC31195C
	for <linux-staging@lists.linux.dev>; Sun, 19 Jul 2026 14:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784470177; cv=none; b=sWDptxCGtlUN0RtBsrAdyDXPQNhWVRGEE4tDrx29Iuv26aaMM5IFMUP2tBB9cyr4DysFHYgNCA43O41LcjqOd4HaIoJDJSMrTFESQBrZpnf5i2XGcSCdIg6VbeCCHTf5BDQT3+fo2tv5k/zh/o+t8UeScwkQ9q5DWs7jFCocvcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784470177; c=relaxed/simple;
	bh=VyoYZX2D8OpDlEMmDS96qc0SFFUHyp553K5Y3reG7BU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qVoxDgNubal7GmmH//knypzM2edW0XSdjXLVEyie+FtK2uzBHzfe7L8/uLkiPjhSRIIAXnUJcGHbqp5/bHemqN+M7FxJPgDqDlm19Hch9kdPNK+GHiAKZvYqEgqxxBMzH7Z1/5s/GiiWNBwrH9tKvmwUbAKl7PiJGbzyv5H/X9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X2P57F39; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X2P57F39"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso6556117a12.0
        for <linux-staging@lists.linux.dev>; Sun, 19 Jul 2026 07:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784470176; x=1785074976; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/VsDwgGBi6jRNk4FQjDctfybeowX+5DSAIGnbjWlZPo=;
        b=X2P57F39H5Sm93DtgC1HIbwg1ySE9wQlt4PRg5mTDOF/wZuW2hU2+Yt0IpRhxwgF3c
         T9/MOLAiEj09nnvTH3/LLwH1VK+Go1dbpOVdCmRwEdUhIFTj59u0qE4LqWW/4Z7Y661D
         PTk7KhGCy7zoLlipjW3s8EFpN17algSZqiHjL0m040molJQj7ZqRi/N+DW5RJuva7qxG
         bSnBgmcGCU39KcjEcl6DcqPmWYOZIHiavTHJsg5nW++gxH1Af1Bafri678+ZSOnuJxt5
         K/frW0cCKzApeYTPAF2609wQe3Xi3Rk4xPEdkArWwRxSGh4aULf/VxSeJYlmgv20gAwl
         Kn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784470176; x=1785074976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/VsDwgGBi6jRNk4FQjDctfybeowX+5DSAIGnbjWlZPo=;
        b=qTZ/625DlSSM45A88MEW32ekblPFyDa6e0bL+3VZuA/ivl9Atz8AcrTlGPur39wQQh
         rqyUcUEad6Hii5EzMUaWNQhQsNi/uiCq2YTACrIsVUqYUCJjf984M4SfXsu3ZeO/8OXu
         xxxM/66u3Ah5w3lIEUrEJybXRCFW9RZ2nyFetlDnrBubdbtX3erL163qYHg5K+6Pz09G
         wYBqEfOl0P06uKgOJ6cSUOd5HYCGTMI+lYy2OuBuzHnOmIVOBr0R5mT3sd01Yb+Oss6x
         yDfyjLq7oEm2Acc2Y4YP4bHsEL/BPxVS1IwQIETe5uwqgXaZQMkdqvAlc5RpmFPPl8gJ
         co7g==
X-Forwarded-Encrypted: i=1; AHgh+RoyOr0DRYp3e8ljNaGNdNGo0bB6lYXVbDCDt6dPUvchZnsOpixtlWaDvEC90btOhprbfkOxVzmeX5PcSMjr@lists.linux.dev
X-Gm-Message-State: AOJu0YwOq18mtDWsc1YXxbbXV6dDgIaNLYKgfGPTm1SpMc4o2w9toptK
	vzGM1E+7qWMinkd1K8ZDBZZV3yZexmiDyYEpzWZK8RsVJUHfGtZNR6in
X-Gm-Gg: AfdE7ckm+EXbEqRtY3Ck+5e7BNj+UPPSD2wkq+H9/BrFp9AK5H72zqFFrBCgdxB3udH
	6bhhI/HvwFzqxSiaRowYWFXIP4CiC2BkuPnotcrkWVUk/Uzib+uMseAUy6NsaVYSJdzGshKYKZ9
	qpcjcaK4LTYHdxnK5bWHux6WwXl1y1RACg/0BFcSFStb4umCrKCzQeznV6uWCdwoOCkMUZaoS/5
	u51zwUTx5fYmstgBezeCd8YkbMWWcQHwuLbf8F5YzqXXyRoWXRU76w/IIBt8Ijh0zAYnB0M7rG2
	qmkIg79ZKm48k4E/eoP/Mj8ONlB1WhYAy9SfnNDu5X3/mpTPjVAMXf6QOBGQlne/mVnT/StAF4j
	QboTOrmVGdQPOhb4jtJF9Ss0NwgpmsBcY+DcRq3I7GYBrSy1jJsF0950O7CrARGII81k7+36p68
	Z5+/Zvf3Gj+ljQvOAmXlSmmFMuLyDEucZfvN+6c6OTyrwo8w==
X-Received: by 2002:a05:6a20:9397:b0:3bf:82c5:ed13 with SMTP id adf61e73a8af0-3c3ad8eccf3mr10908276637.38.1784470175969;
        Sun, 19 Jul 2026 07:09:35 -0700 (PDT)
Received: from UbuntuOS.. ([49.34.211.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20bf96sm26738331eec.28.2026.07.19.07.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:09:35 -0700 (PDT)
From: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Subject: [PATCH 1/2] staging: media: atomisp: Remove unused and unwanted debug module parameters
Date: Sun, 19 Jul 2026 19:33:49 +0530
Message-Id: <20260719140350.8266-2-prajvalchaudhari733@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260719140350.8266-1-prajvalchaudhari733@gmail.com>
References: <20260719140350.8266-1-prajvalchaudhari733@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unused module parameters 'dbg_level' and 'dbg_func'.
Additionally, remove the 'pad_w' and 'pad_h' module parameters
to prevent userspace from overriding internal ISP hardware padding
boundaries, leaving them as internal driver constants.

This addresses the 'Remove unnecessary/unwanted module parameters'
task in the driver's TODO file.

Signed-off-by: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 812230397409..5c2f5996a03f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -44,17 +44,6 @@
 /* G-Min addition: pull this in from intel_mid_pm.h */
 #define CSTATE_EXIT_LATENCY_C1  1
 
-/* cross component debug message flag */
-int dbg_level;
-module_param(dbg_level, int, 0644);
-MODULE_PARM_DESC(dbg_level, "debug message level (default:0)");
-
-/* log function switch */
-int dbg_func = 1;
-module_param(dbg_func, int, 0644);
-MODULE_PARM_DESC(dbg_func,
-		 "log function switch non/printk (default:printk)");
-
 /*
  * Set to 16x16 since this is the amount of lines and pixels the sensor
  * exports extra. If these are kept at the 10x8 that they were on, in yuv
@@ -65,12 +54,8 @@ MODULE_PARM_DESC(dbg_func,
  * the chosen solution is the next best thing.
  */
 int pad_w = 16;
-module_param(pad_w, int, 0644);
-MODULE_PARM_DESC(pad_w, "extra data for ISP processing");
 
 int pad_h = 16;
-module_param(pad_h, int, 0644);
-MODULE_PARM_DESC(pad_h, "extra data for ISP processing");
 
 /*
  * FIXME: this is a hack to make easier to support ISP2401 variant.
-- 
2.34.1

