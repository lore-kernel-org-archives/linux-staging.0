Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBF6301475
	for <linux-staging@lists.linux.dev>; Tue,  9 Sep 2025 06:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757397824; cv=none; b=B26NbzQRCnV7IkKxVJ7tb/RK+ySREZHDuw5jjVBcFcYPB8k3FdbxSg3Hs7SGfBWXEJFeGUVBBmXsMpTLRVBqvgJTTVgK5cxtNrtxqYJRcVElAaryKZyywK484PCdTVX6tmPSFd5zTN5G4plW7HhCfG2V/OVoMgtIB9ZHZY4Iusc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757397824; c=relaxed/simple;
	bh=sArw20JjfCGt3Tt3VJw4wcfrb4jGqV5C5oSbve8OqSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DsXUDRa91WLseKweRez1yzLm1gpitIGR8G0c6Mzw18aCIMW30VTKWr3mkQMmXmj1sKk+uOxPEJRDBq132/ojB+u3YpCbfdMcGbO9gFnU9RPsBzK9gEp/UemgS5rMWtW0fFPro7gFWnXseLoKCrSDmZ0UrO5P2PjoHosYg+FJDvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HvoS/YGL; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HvoS/YGL"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-77238cb3cbbso5475009b3a.0
        for <linux-staging@lists.linux.dev>; Mon, 08 Sep 2025 23:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757397822; x=1758002622; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xUdZKaT5B2ZhU9BDE5iqzR0B7D+QHqptUpqCo3VtYQ=;
        b=HvoS/YGLOFtlp/UlpbnQe/ybPz8QjBoZfmZg94fuYmIxdrMY8UfW7zdR9Z4t4PSUvb
         jSFd3LA2voiZgLYz55pwi1KPu6Wmg3jeNTjJcq7s5pldjxVMKK6A5r+bQqt3WZymvMBs
         Qxw93nmKWaOURcB6KzJ0iWWspIN6n7CMXKPVSaNn+VhRWPfhJj/I/Vft88MS8fKkfPUr
         H3EFM4HDyXDwdFZK5duhq1HIMkxg4wVpT/aXdyB45hd3dSLfKlCU/m6BF+HTG4xVkhuB
         RbPhtzkyXkn2PPPAW++FPL68w3G/Uy4l426YdMB3NdnOKFJs2/dAGaneqlptO09ghvGb
         TTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757397822; x=1758002622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xUdZKaT5B2ZhU9BDE5iqzR0B7D+QHqptUpqCo3VtYQ=;
        b=kJ6GarMEDc7gbEWkkvDgECu5JBT8BgpAbj8a6WrlVfLDTSjt4xvwzKjWEokJLAXDml
         QuroJQmd/x3CZj5GOB/ApADtOOJlwL0YkXnLh5ufeN3FlBDHHQhTprp6/injjzobxc1I
         N6ngZP0jXzzvebESb4hDa9ieTrh4xqNND3BVEeS8bcd754jGcnMBvGyIqeIF/KXuNNwe
         0t60bqnXJQlqAjlZ3MbRm3UIPPu8eD1SAttWSbA8zo8KLFgjYCG2FCuUXWqeVa6xZ6fv
         LaCNhXbWKnohTfFf/3meLwU+gDbYWqyE4gko/vXqCUsaXJV1yjqzs8radgJhdaQGGxGu
         4SAA==
X-Forwarded-Encrypted: i=1; AJvYcCUmmbxOm5xYpgeKKQcEkkTixILxj062wvJ1FjLHcJLMowYHyUSaO5Z4LEf8buqg9polCOfKZprxZJN2NplN@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3ZquLfcfD1xOMOd3NycPMtVeUo75jnnvcBnntJo4+3kKBY4Sw
	+z5klwj2VE0fhCJIz8gaePPS8TOWgxcZx7EepPsUVnPJP0cjLbncIxQh
X-Gm-Gg: ASbGnctywuGEkwjNmvaUBAIBFKWThLrfNeArPOeRZZmwkYuGsXMSVpyKjfZIJ7z/2b1
	A/X2J1rxbqJHrRCuBBtTa1Hz2icxMu7wmTLxjAlgLN6ZVoWZKnV+Wr38EGxvM5k9Ajux9ZyaWfS
	AEXwwGg8axUdY/SDapEwISoyTN7MS/JdPmjc5AZsRO0rbhqv26a1wcILA0DkuVXxi6AXxMUHS83
	+Tt3PB55dKQOQYM+xGZEmGXSVK38zmqkAVne6Thywz8H1UUa5rHDxPtbdLWIBGRyysgakeX+fwt
	nOJVrTAEpz41c2LAtm1DfRW2qROSHpFF4oHXWFsfaILekV8PR+MwTI58/MpkCs6qOyhfFzsVvtq
	MGv6ULR2Fmvz5V9pe8mV6b4cVomw1nzMQrpU/yP3YiQg3uCzanulgymJVd/KN1A6SQKYP20vxFA
	9xrt7w+8y+hFrAwapbjB3cMA==
X-Google-Smtp-Source: AGHT+IELkEZWe7bc0mm4YjG+JrKa1xdnUFM2Qo97pI+DJaZi6VrJk2uBZqkDxhuO3JMPgeL9l6sllw==
X-Received: by 2002:a05:6a00:4104:b0:772:750f:4e2a with SMTP id d2e1a72fcca58-7742df53ec5mr13133323b3a.31.1757397822314;
        Mon, 08 Sep 2025 23:03:42 -0700 (PDT)
Received: from klmny09 (awork062176.netvigator.com. [203.198.28.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77466156d94sm852148b3a.40.2025.09.08.23.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 23:03:42 -0700 (PDT)
From: Yiming Qian <qianym1996@gmail.com>
To: dan.carpenter@linaro.org
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	qianym1996@gmail.com,
	sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Subject: [PATCH v2 2/2] staging: sm750fb: rename snake case variables
Date: Tue,  9 Sep 2025 14:01:30 +0800
Message-ID: <20250909060130.12919-3-qianym1996@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909060130.12919-1-qianym1996@gmail.com>
References: <aL5tjv_2YkvHPs5C@stanley.mountain>
 <20250909060130.12919-1-qianym1996@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replaces CamelCase variable names with snake_case:
- dprBase -> dpr_base
- dpPortBase -> dp_port_base

Signed-off-by: Yiming Qian <qianym1996@gmail.com>
---
 drivers/staging/sm750fb/sm750.h       | 4 ++--
 drivers/staging/sm750fb/sm750_accel.c | 6 +++---
 drivers/staging/sm750fb/sm750_hw.c    | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 41f1fb390..fcb7d586e 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -50,9 +50,9 @@ struct init_status {
 
 struct lynx_accel {
 	/* base virtual address of DPR registers */
-	unsigned char __iomem *dprBase;
+	unsigned char __iomem *dpr_base;
 	/* base virtual address of de data port */
-	unsigned char __iomem *dpPortBase;
+	unsigned char __iomem *dp_port_base;
 
 	/* function pointers */
 	void (*de_init)(struct lynx_accel *accel);
diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 44b9e3fe3..7ac2e7b6e 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -19,17 +19,17 @@
 #include "sm750_accel.h"
 static inline void write_dpr(struct lynx_accel *accel, int offset, u32 regValue)
 {
-	writel(regValue, accel->dprBase + offset);
+	writel(regValue, accel->dpr_base + offset);
 }
 
 static inline u32 read_dpr(struct lynx_accel *accel, int offset)
 {
-	return readl(accel->dprBase + offset);
+	return readl(accel->dpr_base + offset);
 }
 
 static inline void write_dpPort(struct lynx_accel *accel, u32 data)
 {
-	writel(data, accel->dpPortBase);
+	writel(data, accel->dp_port_base);
 }
 
 void sm750_hw_de_init(struct lynx_accel *accel)
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 7119b67ef..ce46f240c 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -58,8 +58,8 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	}
 	pr_info("mmio virtual addr = %p\n", sm750_dev->pvReg);
 
-	sm750_dev->accel.dprBase = sm750_dev->pvReg + DE_BASE_ADDR_TYPE1;
-	sm750_dev->accel.dpPortBase = sm750_dev->pvReg + DE_PORT_ADDR_TYPE1;
+	sm750_dev->accel.dpr_base = sm750_dev->pvReg + DE_BASE_ADDR_TYPE1;
+	sm750_dev->accel.dp_port_base = sm750_dev->pvReg + DE_PORT_ADDR_TYPE1;
 
 	mmio750 = sm750_dev->pvReg;
 	sm750_set_chip_type(sm750_dev->devid, sm750_dev->revid);
-- 
2.51.0

