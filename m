Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F0415A6
	for <linux-staging@lists.linux.dev>; Sat,  5 Aug 2023 03:57:47 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-686f0d66652so2533255b3a.2
        for <linux-staging@lists.linux.dev>; Fri, 04 Aug 2023 20:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691207867; x=1691812667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QHfKKipzcEUlh6pN+k5sZVC6YXJVrgyZFsHTGa3fI6w=;
        b=fAvM9uj/RUJc/gEOJxPTTKenWfC+yc+MQBJY0sj6qp7MQeFhFWvwg+bHPNz0yBI1Nn
         5xuGboaSBpH4noz9gNof/1nfc+bXBVrhyDFRnWYZDYrO+RG1NtmS7C3dNCgGU5QpRpzL
         4Ie9XpnVved47OhjXKr0TQIYf24wKoMYNP6a2mD0Ql0x3OFpPgiz9BFV1ArIwKD6uw/l
         /lo+aSsvzbd6AdVVpa9Y7ERWfS3Nd5lIxig5lD02OPrqrZafUXv+0dSiwBf5NdJad/It
         0lJb63EffzRNUcCS5pJFJmoNSd3ZlAq9xOjraNykBdNI2BfJkVNaFP5ztzha4mXOkdSM
         VFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691207867; x=1691812667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QHfKKipzcEUlh6pN+k5sZVC6YXJVrgyZFsHTGa3fI6w=;
        b=AmzlNOAoNhRk/bYvMBxzhD4FJwYUw2C50iiCc9NdBcImP6Bs3ux1Md9mGETGQ4suYc
         PLn7l0bafoKCRPUhGVXI6kBbkXrLCObcMNuqM00ZmEozlefHDkWWNBGllqDqwBSxUV2G
         UYNWkMe2DpuYBEgnabK90bEOqPSgV7g05mpj2FVhad5S++qLj8fllDNzGLR3BTD6ksgN
         0E83AaO7AwEV7iu4Ixt1Lo5fnD77aHp6zFnZsUtgQMTuuhwLUvH0bzU8/qGpDDPmrqcG
         5+Yj6hZ9KbmcUWaWsK+hJlSydNivir8VYs+cJk68TihC9WYHl1Yw7sxSUPcsFSfo3Mm0
         75xg==
X-Gm-Message-State: AOJu0YxJiOalRQ5FeSWm2xQEI6EpwrtC43mWMRUImpyAR/lI7uctfNYw
	usLEHznmcpwRzd0wD+q2CKU=
X-Google-Smtp-Source: AGHT+IFNNOAiBdLGg4WP+2tSzkvHjijQ+tfXYBWHE73rekf0n7b+ZEAVEodWi87ECWZwY3NzNcOMVw==
X-Received: by 2002:a05:6a20:970a:b0:137:a9d7:d8cc with SMTP id hr10-20020a056a20970a00b00137a9d7d8ccmr3381557pzc.24.1691207866818;
        Fri, 04 Aug 2023 20:57:46 -0700 (PDT)
Received: from vm.localdomain (1-65-215-216.static.netvigator.com. [1.65.215.216])
        by smtp.gmail.com with ESMTPSA id w8-20020a63f508000000b005634343cd9esm1792659pgh.44.2023.08.04.20.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 20:57:46 -0700 (PDT)
From: Mingzai Sun <szp2017@gmail.com>
To: forest@alittletooquiet.net,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mingzai Sun <szp2017@gmail.com>
Subject: [PATCH] staging: vt6655: Change camel case variables to snake case
Date: Sat,  5 Aug 2023 11:57:39 +0800
Message-Id: <20230805035739.376502-1-szp2017@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change camel case to snake case.
Issue found by checkpatch.

Signed-off-by: Mingzai Sun <szp2017@gmail.com>
---
 drivers/staging/vt6655/srom.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vt6655/srom.c b/drivers/staging/vt6655/srom.c
index ee5ca4db74dc..812964ab68c5 100644
--- a/drivers/staging/vt6655/srom.c
+++ b/drivers/staging/vt6655/srom.c
@@ -49,7 +49,7 @@
  * Parameters:
  *  In:
  *      iobase          - I/O base address
- *      byContntOffset  - address of EEPROM
+ *      by_contnt_offset  - address of EEPROM
  *  Out:
  *      none
  *
@@ -57,7 +57,7 @@
  *
  */
 unsigned char SROMbyReadEmbedded(void __iomem *iobase,
-				 unsigned char byContntOffset)
+				 unsigned char by_contnt_offset)
 {
 	unsigned short wDelay, wNoACK;
 	unsigned char byWait;
@@ -70,7 +70,7 @@ unsigned char SROMbyReadEmbedded(void __iomem *iobase,
 	iowrite8(byOrg & (~I2MCFG_NORETRY), iobase + MAC_REG_I2MCFG);
 	for (wNoACK = 0; wNoACK < W_MAX_I2CRETRY; wNoACK++) {
 		iowrite8(EEP_I2C_DEV_ID, iobase + MAC_REG_I2MTGID);
-		iowrite8(byContntOffset, iobase + MAC_REG_I2MTGAD);
+		iowrite8(by_contnt_offset, iobase + MAC_REG_I2MTGAD);
 
 		/* issue read command */
 		iowrite8(I2MCSR_EEMR, iobase + MAC_REG_I2MCSR);
-- 
2.34.1

