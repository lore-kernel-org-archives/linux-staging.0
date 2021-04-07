Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633226D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:46:08 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id n38so2518540pfv.2
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0In7Usm62iDzXGlWXf0B0UqSRUyq5ZkXwX+9zfXFdWA=;
        b=f0eEAxBwZAwKyCusdi6rWc6PV83Li0QqWeBqCWFbovV7R7X36fkRlKIauusERa3X6N
         ZIlMJxAP3oOTwPthCBTn7eMhHQULRSsgnIC6JN7HtzpEZCDbyebtYZORaTM4WvB/QzSZ
         EQuIVuW9oNztqrYY6IbvGSmHbXjS4bN8n2mBX26eCum5hiO5yZ9Ix89W4tI68Edk2xDW
         3WZrjSp6RvrJmMpIS7J+lv5ybyyIuY87EUS/4Av5mCEs9YC8qcVCW2KEfYjM9O7cY9nP
         6e9mREzHX0X5788GK+K67oIiS/3yE0XcYEbkVzylDV+gIUjMnngaVRf/wPWNPubphbSD
         boHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0In7Usm62iDzXGlWXf0B0UqSRUyq5ZkXwX+9zfXFdWA=;
        b=SWpaRfSrGSz/9feYMXR+8y8UzcAo2ueWwIKGZrWA27hSNCoEx6++iRdbTwfUIWWJQh
         Xwi03UUboLMd5JZtK8K9mn01TPuY817KExwMstDL8Hq59UwIjESnKbOennCe4XHAD1Ut
         Q0EJ/7JoridqJVL6M1XPrh3zU1RikoUDlxt57hgkaAYi3fEUWZV/JeQGtzIdk4m/w9bL
         yEc6GM7xlLJ90gE0cr+C9ft+aEIAgxVLJOU94rtohHqeBovEjIjqaz1UBhL50lmqcVU0
         widts56wi9N6qHVxEO46EXPtGxUOgeeB1jyzvgYvjxj5DZCfpOFxuZDJArdSm/ASl/2q
         NUYw==
X-Gm-Message-State: AOAM530dwOevmdhYLw0fQJILtcS1ynfMklYiLxtcPLCXfobRCdzPlUXZ
	a8aCd3QlUCB2DKV6jDWAvKk=
X-Google-Smtp-Source: ABdhPJxysv27ETveWY9+1QtkAc3R4IcuOpZgVZZChEL6e09gINMJcJ08dM2ot+ikFn9ueIvYMXGFvA==
X-Received: by 2002:a63:1a47:: with SMTP id a7mr1863095pgm.437.1617777967933;
        Tue, 06 Apr 2021 23:46:07 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id v14sm4035981pju.19.2021.04.06.23.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:46:07 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:46:05 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 43/49] staging: sm750fb: Update members of lynx_accel
 struct to snake case
Message-ID: <52fcfc4480d5ee19f8751dae2d2369a5958fa1fc.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpatch.pl checks for the members of
lynx_accel structure, in particular dprBase and dpPortBase.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/sm750.h       | 4 ++--
 drivers/staging/sm750fb/sm750_accel.c | 6 +++---
 drivers/staging/sm750fb/sm750_hw.c    | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index da37fc81370b..a27aaac5d67a 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -50,9 +50,9 @@ struct init_status {
 
 struct lynx_accel {
 	/* base virtual address of DPR registers */
-	volatile unsigned char __iomem *dprBase;
+	volatile unsigned char __iomem *dpr_base;
 	/* base virtual address of de data port */
-	volatile unsigned char __iomem *dpPortBase;
+	volatile unsigned char __iomem *dp_port_base;
 
 	/* function pointers */
 	void (*de_init)(struct lynx_accel *accel);
diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index d0b64962b10e..6ca2e5265836 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -20,17 +20,17 @@
 #include "sm750_accel.h"
 static inline void write_dpr(struct lynx_accel *accel, int offset, u32 reg_value)
 {
-	writel(reg_value, accel->dprBase + offset);
+	writel(reg_value, accel->dpr_base + offset);
 }
 
 static inline u32 read_dpr(struct lynx_accel *accel, int offset)
 {
-	return readl(accel->dprBase + offset);
+	return readl(accel->dpr_base + offset);
 }
 
 static inline void write_dp_port(struct lynx_accel *accel, u32 data)
 {
-	writel(data, accel->dpPortBase);
+	writel(data, accel->dp_port_base);
 }
 
 void sm750_hw_de_init(struct lynx_accel *accel)
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 789199e628cd..97b842148bcb 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -60,8 +60,8 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 		pr_info("mmio virtual addr = %p\n", sm750_dev->reg);
 	}
 
-	sm750_dev->accel.dprBase = sm750_dev->reg + DE_BASE_ADDR_TYPE1;
-	sm750_dev->accel.dpPortBase = sm750_dev->reg + DE_PORT_ADDR_TYPE1;
+	sm750_dev->accel.dpr_base = sm750_dev->reg + DE_BASE_ADDR_TYPE1;
+	sm750_dev->accel.dp_port_base = sm750_dev->reg + DE_PORT_ADDR_TYPE1;
 
 	mmio750 = sm750_dev->reg;
 	sm750_set_chip_type(sm750_dev->devid, sm750_dev->revid);
-- 
2.30.2

