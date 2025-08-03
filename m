Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA1C1A0730;
	Sun,  3 Aug 2025 17:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754243450; cv=none; b=mEl/aJw6bHKSfvMYwtx5lJ2wpiI4lUNor/ViUyMrGziqz1+gBQCkeMSFtI/M+4JgC/rC7DE3yMSgmMb2F+y5ss0ON6udhhhFhuS6ZkLGXEMqHDvKy6mFpbM0brs5EsuzkUCfAa3hV0/UVPQhTR9GjZaSBvJtr2BtyefL5MYim+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754243450; c=relaxed/simple;
	bh=DJiSK5yw31vSZeaWgFi3HoD1YTH8Ir78jDdMH+9lJz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=c1g6hc/4SzHYMA6Lj9v+zsjRXWsxU6pi4oGcqmDvd6F9CJAi1iGxh/5GlnwCAF6u+jcSgxwBruJtj/OP9vHh7nUkchWuwCWUGWCx2MDg5yQdfxtfxYLKMqoGQZlK6qIhtqQr7mDcKtNYXl0HQCQ2b3xcwZH7h0c3+wNARywNnSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eb/UePy9; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eb/UePy9"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b3aa2a0022cso3466369a12.1;
        Sun, 03 Aug 2025 10:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754243449; x=1754848249; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5WDyaOvtCXv9NJO8ZoH8TFWDjjaf7wJBFVeWQpU5YhM=;
        b=Eb/UePy96Qsg7n+Ek1NY8i8NJG2AAhph6+NRTOLc5Hebpfrfa8no/FH6exxzZIeLw4
         +RpcDdo8MRU19tZfA7SCOPKUCZIOc/bTNI+adUgv+L8dLig1hyQMFCNaVNYyv01z5jok
         y1SJVmkev3wWkp49ctCRVek0UR/sZElbr65Fr+wJNJamk+i8bmri/EBDhm3dcjCyZoNz
         WO6qqo64hP8xsXniKW2njn+g0OB6TqhbbrH7ayAC6ygBcL9+49is72dVYWw254pU+R/H
         8sWR18399+iWd6gE6CSqer9bIkVrE1lt3z6sPy1+X98TgnCQQ7jIICadNaH/15VSWoKZ
         8SgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754243449; x=1754848249;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5WDyaOvtCXv9NJO8ZoH8TFWDjjaf7wJBFVeWQpU5YhM=;
        b=g67397zatKR6EsiSvNFjoHz/MNyEB5IvbYBTFzOhTiTwCsaXxfk2fyC57I1PgwH3Ko
         TJDTv8x9PkrCwib69AWCT1hIKXa2WLUGOHKNGte3cwk/OU/AC4WujOcqYC/FRqz830a1
         uHGhhjhA+k8XM+QPY0LW5c+oCUQWqAuRf7s+fsXqYPawYJNqJ0Fvxc3l/0M+JQxNdv3K
         rnrMyAsLoRWjJTuugFjKViQvy3r5sipU9hdrYQPmFWlR/cdlEYZFbPEFSrn9ofQ/CGLI
         HIrGqCk73fiMAI6X5HZRrzIEiGSw7jLkhcVvQGwW3oEDu7wcDOA8qlNz++o0rJJFhm7M
         M2Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVOAp9zTPpDAI4DSRxb3AhfL6ooFvSfMBON3J8nTqpCyeO5Dv70eS011s9YylLFZ7rjFs67xvg3HbHVxBKqMrsM/TzDbQ==@lists.linux.dev, AJvYcCWF1cJ+Jw+LreY5PBFwLQ7nmhGF9brNDvZlOPrR2sIYTMGDdd1RANkolI8X1/bRRRH09eOw++CzlQMgVIRCDA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGuGWs9IjkDd3sbW1u2gE5bBo6GXFNH//PoQ2X18npMjNRMMBb
	mWteOIk300JOek0C8a75xqvS2ranQ8q7PqxL99ObXzjoZTCUVM1xNGmx
X-Gm-Gg: ASbGncs1eQGsPaSSdNv9zTR4YLN2+PMvoLRYdCqrpHIlyFU1UwhLYOAu6b3ByL9cad8
	n2JbTE2fWdzXqrhGjECgbxxzx9SwybdUT+oN6+b7ZZgveYW6rso0hrp+PcbkxgJF/XhfQJd9hfv
	DoBgunFbueLKh6oCXvTuJNdjboCjPPG+aqlO3lFHPul6yAZv/BewRBfiknav7Plgu3hqdmWtid6
	PNFpk3Rua1h8r5JyX2sOJFhUZDlsOD4rAh1ZtdPKDNKX2aTvLnuxE5wzIhDvZxIySvQEQSeHTrl
	rNGJ+a5DLdu5n9f27R+cKr2gIRwDP2vLfyWxbdJZiVOQcBXUv4JJG6iTRUF2hAxj4W4os8XQqK4
	Ge2BefZWWZhNHU46I4HnKbcB7leEeGvpI
X-Google-Smtp-Source: AGHT+IGX/HUMKV1bH9ywZLaMy2B08//y844ZJnjF/5ErmKsBhlBzUgfoooG0/8ewYodeApVof0bBbg==
X-Received: by 2002:a17:903:32c1:b0:234:b743:c7a4 with SMTP id d9443c01a7336-2424701ae4fmr102641745ad.38.1754243448705;
        Sun, 03 Aug 2025 10:50:48 -0700 (PDT)
Received: from localhost ([106.105.221.253])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-241e899a48esm91069455ad.114.2025.08.03.10.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Aug 2025 10:50:48 -0700 (PDT)
From: Nai-Chen Cheng <bleach1827@gmail.com>
Date: Mon, 04 Aug 2025 01:49:55 +0800
Subject: [PATCH] staging: media: ipu3: use string_choices API instead of
 ternary operator
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-ipu3-string-choices-v1-1-506834a013b5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEKhj2gC/x3MPQqAMAxA4atIZgOx/hWvIg5SY5ulSqMiiHe3O
 H7Dew8oJ2GFoXgg8SUqW8yoygJcmKNnlCUbDJmWLDUo+1mjHkmiRxc2caxo5o6oWc3SWwu53BO
 vcv/XcXrfDxJfyBZlAAAA
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Nai-Chen Cheng <bleach1827@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754243443; l=2507;
 i=bleach1827@gmail.com; s=20250730; h=from:subject:message-id;
 bh=DJiSK5yw31vSZeaWgFi3HoD1YTH8Ir78jDdMH+9lJz8=;
 b=htjeU4Zc0Y182neDXxTA5WYFV023GLFtax2bY9msrCmY8VaQM8iVUxmWzyM0JUIi3ZHu9z7/z
 OmLsS9HRoqQA5z2KpiaaEdGLpQuXW22+thgPtEFK/gf8MK2zCxs3XVf
X-Developer-Key: i=bleach1827@gmail.com; a=ed25519;
 pk=jahFPRplw20Aaim8fIt8SxlFMqkHbJ+s8zYBGbtHH5g=

Use string_choices API instead of manually determining the output using
ternary operator to improve code readability and consistency.

This also fixes cocci warning.

Signed-off-by: Nai-Chen Cheng <bleach1827@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-css.c  | 3 ++-
 drivers/staging/media/ipu3/ipu3-v4l2.c | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index 1b0a59b78949..777cac1c27bf 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -4,6 +4,7 @@
 #include <linux/device.h>
 #include <linux/iopoll.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include "ipu3.h"
 #include "ipu3-css.h"
@@ -226,7 +227,7 @@ int imgu_css_set_powerup(struct device *dev, void __iomem *base,
 	state = readl(base + IMGU_REG_STATE);
 
 	dev_dbg(dev, "CSS pm_ctrl 0x%x state 0x%x (power %s)\n",
-		pm_ctrl, state, state & IMGU_STATE_POWER_DOWN ? "down" : "up");
+		pm_ctrl, state, str_down_up(state & IMGU_STATE_POWER_DOWN));
 
 	/* Power up CSS using wrapper */
 	if (state & IMGU_STATE_POWER_DOWN) {
diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index ad6095bf717d..2f6041d342f4 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -3,6 +3,7 @@
 
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/string_choices.h>
 
 #include <media/v4l2-event.h>
 #include <media/v4l2-ioctl.h>
@@ -287,7 +288,7 @@ static int imgu_link_setup(struct media_entity *entity,
 	WARN_ON(pad >= IMGU_NODE_NUM);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u pad %u is %s", pipe, pad,
-		 flags & MEDIA_LNK_FL_ENABLED ? "enabled" : "disabled");
+		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	imgu_pipe = &imgu->imgu_pipe[pipe];
 	imgu_pipe->nodes[pad].enabled = flags & MEDIA_LNK_FL_ENABLED;
@@ -302,7 +303,7 @@ static int imgu_link_setup(struct media_entity *entity,
 		__clear_bit(pipe, imgu->css.enabled_pipes);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u is %s", pipe,
-		 flags & MEDIA_LNK_FL_ENABLED ? "enabled" : "disabled");
+		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	return 0;
 }

---
base-commit: 186f3edfdd41f2ae87fc40a9ccba52a3bf930994
change-id: 20250804-ipu3-string-choices-2a6004f2d788

Best regards,
-- 
Nai-Chen Cheng <bleach1827@gmail.com>

