Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9771DE2A5
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 04:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752639161; cv=none; b=qe1y16qYWHaPBqqzttZOzVLG6O06nfwx1KCUtBhIVFXHHQPv79axJfIo078Nd+erPAV6rLdNciMs4ufC116IU7tRnlDUOxIRNRvIpVr+ZHPH5UGHuAuJS5eMfhTZh42FOyp6FBKk0ew4D2C9861121hvvzKJe6Kbkrta5q+5GqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752639161; c=relaxed/simple;
	bh=TL99k2WBQTdeYLNnMKuKrZlEpk/EaSle7CfpZmEzI/E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=E3AkuF4k9s0EefdBLWAfFIt3pyMDmbX9V+qAJ9OjGYcXyZZG8p1U7zX6uY1lnhkpmas4H1Z3K5F7J8rCzZVF91AvYfKbpK50tGyv5E6NGK7v3eocBzszsv88ZqWRiMmhGcyGYOgtVKKdR6YmdibyZEIoAmw8pLXNopZShX7s9Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gp9EyNjD; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gp9EyNjD"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-73e57751cd9so553110a34.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 21:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752639159; x=1753243959; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gWiUjZu9ZnCa6LYAWdZFUNk548lAPSY+9yO5ufM9NFY=;
        b=Gp9EyNjDUy+FQ4NDH5nso3Stb+A+yFGGoVhX8i+w7GvaY1sTX/FBL/IhrSw4lYNb29
         C0EtkfPEBqS69WGfTWx8Crtlsl3jST1IwXrZTt4sYs9SXRp6z5eQ42DzcoPgU4Dg7YWU
         01QnBZm2oA87BEg3pEuQT1mkpDDgPsoYLYMqWF5QQD6+UE+3uUWHjoaLkv2wB3z+Sp6Y
         RMQDaEL57wEfsGBFKmBPfEj4h7ppVGE0OVfvUjF4zWvx8nCMHXtxd4Kfa9JcQhD4Kzox
         6vnZ7d6UZiEDCjHTKQfxuCbZ/0tFSRZRbs7cZ43gAHVkgRlOKy7dgqSbm1mCitTudf7d
         fk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752639159; x=1753243959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWiUjZu9ZnCa6LYAWdZFUNk548lAPSY+9yO5ufM9NFY=;
        b=mGcxPwvPB52Diy4TLWSAK01t3IU6gMr4Celo+NC7Tz4OVdRJebWPqxFxOK81CKwwNa
         HZeIPevWZUCPFczO8tocjICvwZggG9EjdOWUcA4xLVpNNhyPze6eAxk/XbDefRZRStmo
         RhWFDzRxYVJkGWlcxQ6uN9K1Bv4MwlkCwZ/+ZF+pn7hB54cypikkr62Dq1NwhJcu8dQR
         alQbEiskmpI3AY4tdG31saA6ri+xUaD9HxQJNtbGfIltTOufxnBENEjtjMxok+FEj2vj
         Ak2C+yKuh7U/QsL/0GAF8YcNtrRYRo04W4zDtdMmxe+kSpLw8ephPEWA30me9En2isdo
         7HUw==
X-Gm-Message-State: AOJu0YyYDSmPDSZYrUE0K+MoLvVgPNwKof34yHZhZeLiIFRb9Xs4fCHV
	pm4Xr5CUW+JIY7t4e6HXaThOcOhLT9uwVG7Nwehs8/Ac44c1XeLo0tdIQtUmlvkn
X-Gm-Gg: ASbGncteuvZG+qSorqXtGyL1hyTaffR01KQlTsv4X0uZ5tFO3rXtzqrT62eo94M6OCl
	jsRbK8ubB66n3UsKAJqHTnu5cEBcKle1Zl6V3jLGY0yEZ8UcW07gkxXRfl3mcyNM5YO++zsqNGM
	VpVZpQUgI9JlUcHr/MEZBatQ72k1y4IkWKm+niZScPKQhkTMxx4XvA7pOTqUF2ZYpH/ItR1urEV
	AyjnQjqxWeALbiwkF08Z9xTYFc1vtvh8sI3K54MoYarePCwIvZzRaREKy24SryT3mwNIQ877uNm
	dRndV0k5mwD13njxEprfakRWC93HsN79n+DbF0JDdpNr/Jm2x3uuUpGzjfNN2cn0MyIlJM6IgmT
	oBYPlfvco0Ed3DJG7t4LRV3lFTXNiigLkMrrsya9CiNElJekfFg3i
X-Google-Smtp-Source: AGHT+IEA8WP+WxB+Wq7vj8kS1HXqnmSin399JMoCg5Mj4EKJN0gjGZwGRIljWTBikJ+i4TyXjdf9ig==
X-Received: by 2002:a05:6808:2210:b0:411:96a9:7ea with SMTP id 5614622812f47-41ced9970eemr1295317b6e.4.1752639159341;
        Tue, 15 Jul 2025 21:12:39 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4141bbde341sm2488309b6e.27.2025.07.15.21.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 21:12:38 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Fix multiple checkpatch warnings in rtl8723b_cmd.c
Date: Wed, 16 Jul 2025 00:12:36 -0400
Message-Id: <20250716041236.61270-1-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the following checkpatch warnings:
- Comparisons should place the constant on the right side
- Braces {} are not necessary for single statement blocks
- Block comments should align the * on each line
- No space before tabs

These are coding style fixes that improve code readability.

Signed-off-by: Ignacio Peña <ignacio.pena87@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 40 ++++++++++----------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 56526056d..4f33f4f0c 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -24,9 +24,8 @@ static u8 _is_fw_read_cmd_down(struct adapter *padapter, u8 msgbox_num)
 
 	do {
 		valid = rtw_read8(padapter, REG_HMETFR) & BIT(msgbox_num);
-		if (0 == valid) {
+		if (valid == 0)
 			read_down = true;
-		}
 	} while ((!read_down) && (retry_cnts--));
 
 	return read_down;
@@ -35,13 +34,13 @@ static u8 _is_fw_read_cmd_down(struct adapter *padapter, u8 msgbox_num)
 
 
 /*****************************************
-* H2C Msg format :
-*| 31 - 8		|7-5	| 4 - 0	|
-*| h2c_msg	|Class	|CMD_ID	|
-*| 31-0						|
-*| Ext msg					|
-*
-******************************************/
+ * H2C Msg format :
+ * | 31 - 8		|7-5	| 4 - 0	|
+ * | h2c_msg	|Class	|CMD_ID	|
+ * | 31-0						|
+ * | Ext msg					|
+ *
+ ******************************************/
 s32 FillH2CCmd8723B(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmdBuffer)
 {
 	u8 h2c_box_num;
@@ -57,13 +56,11 @@ s32 FillH2CCmd8723B(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmd
 	if (mutex_lock_interruptible(&(adapter_to_dvobj(padapter)->h2c_fwcmd_mutex)))
 		return ret;
 
-	if (!pCmdBuffer) {
+	if (!pCmdBuffer)
 		goto exit;
-	}
 
-	if (CmdLen > RTL8723B_MAX_CMD_LEN) {
+	if (CmdLen > RTL8723B_MAX_CMD_LEN)
 		goto exit;
-	}
 
 	if (padapter->bSurpriseRemoved)
 		goto exit;
@@ -80,7 +77,7 @@ s32 FillH2CCmd8723B(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmd
 		else {
 			memcpy((u8 *)(&h2c_cmd)+1, pCmdBuffer, 3);
 			memcpy((u8 *)(&h2c_cmd_ex), pCmdBuffer+3, CmdLen-3);
-/* 			*(u8 *)(&h2c_cmd) |= BIT(7); */
+/* *(u8 *)(&h2c_cmd) |= BIT(7); */
 		}
 
 		*(u8 *)(&h2c_cmd) |= ElementID;
@@ -438,13 +435,14 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 
 		}
 
-/* offload to FW if fw version > v15.10
-		pmlmeext->DrvBcnEarly = 0;
-		pmlmeext->DrvBcnTimeOut =7;
-
-		if ((pmlmeext->DrvBcnEarly!= 0Xff) && (pmlmeext->DrvBcnTimeOut!= 0xff))
-			u1H2CPwrModeParm[H2C_PWRMODE_LEN-1] = BIT(0) | ((pmlmeext->DrvBcnEarly<<1)&0x0E) |((pmlmeext->DrvBcnTimeOut<<4)&0xf0) ;
-*/
+/*
+ * offload to FW if fw version > v15.10
+ *		pmlmeext->DrvBcnEarly = 0;
+ *		pmlmeext->DrvBcnTimeOut =7;
+ *
+ *		if ((pmlmeext->DrvBcnEarly!= 0Xff) && (pmlmeext->DrvBcnTimeOut!= 0xff))
+ *			u1H2CPwrModeParm[H2C_PWRMODE_LEN-1] = BIT(0) | ((pmlmeext->DrvBcnEarly<<1)&0x0E) |((pmlmeext->DrvBcnTimeOut<<4)&0xf0) ;
+ */
 
 	}
 
-- 
2.39.5 (Apple Git-154)

