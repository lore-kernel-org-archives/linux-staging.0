Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB3C1F95E
	for <linux-staging@lists.linux.dev>; Thu, 10 Aug 2023 14:08:47 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-686b9964ae2so705345b3a.3
        for <linux-staging@lists.linux.dev>; Thu, 10 Aug 2023 07:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691676527; x=1692281327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RpPkzsPuCnm/cRHKJLCcUE7IWrO5oPYo5OeKIIrb7to=;
        b=a2RoK4dH1TylPKM2CeHapIk/UrBwolvEtU3Dl9AvARQMZIq5Cy8VPvzDowQ1sZ0nWa
         wlarbJUUZqofmNqBrMDx9hTmUKaJUET0mJfwqxless3hrjxQKtPkRLqG2S8uEP2kSfRi
         H3AEUp4U5A0p7gYjSn/8JhnInLBGl84/TLGMUPWGimdKlP2WrThyabUvLu7MQe5wk+Hr
         i5hHHEvTHN533ziZUWzUEWHS7LnYlrIIYDtGsy9oHIPP6lSetYZbS4qlOM2+mZj23h4g
         DGGAcTX+nAueY11a/ttV3Qr5Gcp/2purlELDZrqzRmkcLKY5jN6TwzrU65PZa0KDW/eT
         IBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691676527; x=1692281327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RpPkzsPuCnm/cRHKJLCcUE7IWrO5oPYo5OeKIIrb7to=;
        b=gj3GqSlt/r6uk8DCkPWCClLVUdPRy76I3Bfnkh/dbebKk/O5uALBDiUrUIdLprL4gB
         kaKQd8dzDwU0mu7W0o6yXPeMs2i7hZnU9bjOgDKiv1vDSJjvcGmFnmo/q0gsKOl8MqyU
         ZQxqynOwwNNU55j60XES2sTxFE1R2VSZGtadQNQBvTdN3oYD4ldV8NigRiSH34bOBa7n
         eM6EbURivaq81Sn0zByxPEGdv/B5najyOKL8HuoiiiChfb5QTKNWiHXts//J22Qe1hUZ
         mXh0upB92uXguINDTflbCYBZZCQ2fPzOx7suf5i0ZZcorQdLklR6qfusXV3wDHID6Dgg
         Vo4Q==
X-Gm-Message-State: AOJu0Yw5v80TCzWdV/MXf+nCQCjk2s7xYzXX6zeFHbSAqxtJX7tKkUYB
	YXP/DyT53JNtCr7vs9vCpqs=
X-Google-Smtp-Source: AGHT+IHytJwsw9CR2rO2PL5A6LUNmskdrTISyQT0/ebk89o2bPd/HPDqStJdmundjyqEai5yMZt7HQ==
X-Received: by 2002:a05:6a00:13a5:b0:67b:f249:35e3 with SMTP id t37-20020a056a0013a500b0067bf24935e3mr2961859pfg.26.1691676526763;
        Thu, 10 Aug 2023 07:08:46 -0700 (PDT)
Received: from vm.localdomain (n11212033061.netvigator.com. [112.120.33.61])
        by smtp.gmail.com with ESMTPSA id e9-20020aa78249000000b006870721fcc5sm1612786pfn.175.2023.08.10.07.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 07:08:46 -0700 (PDT)
From: Mingzai Sun <szp2017@gmail.com>
To: forest@alittletooquiet.net,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mingzai Sun <szp2017@gmail.com>
Subject: [PATCH v2] staging: vt6655: Change camel case variables to snake case
Date: Thu, 10 Aug 2023 22:08:34 +0800
Message-Id: <20230810140834.5762-1-szp2017@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230805035739.376502-1-szp2017@gmail.com>
References: <20230805035739.376502-1-szp2017@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unneeded "by" prefix.

Signed-off-by: Mingzai Sun <szp2017@gmail.com>
---
Changes in v2:
  - Change "by_contnt_offset" to "contnt_offset".
---
 drivers/staging/vt6655/srom.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vt6655/srom.c b/drivers/staging/vt6655/srom.c
index 812964ab68c5..1b89d401a7eb 100644
--- a/drivers/staging/vt6655/srom.c
+++ b/drivers/staging/vt6655/srom.c
@@ -49,7 +49,7 @@
  * Parameters:
  *  In:
  *      iobase          - I/O base address
- *      by_contnt_offset  - address of EEPROM
+ *      contnt_offset  - address of EEPROM
  *  Out:
  *      none
  *
@@ -57,7 +57,7 @@
  *
  */
 unsigned char SROMbyReadEmbedded(void __iomem *iobase,
-				 unsigned char by_contnt_offset)
+				 unsigned char contnt_offset)
 {
 	unsigned short wDelay, wNoACK;
 	unsigned char byWait;
@@ -70,7 +70,7 @@ unsigned char SROMbyReadEmbedded(void __iomem *iobase,
 	iowrite8(byOrg & (~I2MCFG_NORETRY), iobase + MAC_REG_I2MCFG);
 	for (wNoACK = 0; wNoACK < W_MAX_I2CRETRY; wNoACK++) {
 		iowrite8(EEP_I2C_DEV_ID, iobase + MAC_REG_I2MTGID);
-		iowrite8(by_contnt_offset, iobase + MAC_REG_I2MTGAD);
+		iowrite8(contnt_offset, iobase + MAC_REG_I2MTGAD);
 
 		/* issue read command */
 		iowrite8(I2MCSR_EEMR, iobase + MAC_REG_I2MCSR);
-- 
2.34.1

