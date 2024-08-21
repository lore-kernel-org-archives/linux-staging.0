Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A41414D428
	for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 03:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724209744; cv=none; b=SJWsQ0bFU5krciO9D0oylVGOS2IkKvr5pBwteYlpqDRD/GHj5k1YcNcRNCUd2BK5ShSyat939kqL36U89QYDzzhL4PjNS7dUZNSryf8JnfEWlZABVvNe43clTIF/6/LG9Gqqn0T0USUHFro9CloZpwqju91hV5/VQyVcwjh8am4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724209744; c=relaxed/simple;
	bh=Y1Isi5tZMdBTmr44yIuWdZLDGGs1zRS8Rk3k3dRwLN8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HaAl5GfxqoXz8gNaZSoCoYolpN452V298W/BwzOGmu9LZx2QFPrjIwcaaLQda5+LQkI0NChjjHsCkjlKC/+XGGPub9THiINs+ea3A9oHnssdIc1fBCnWKe6sm1WrU0F4KQmTX/GYFP87X/2ZwxoRX7JReqZO0yPG+MII17b2w0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=jkdXuTMg; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="jkdXuTMg"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5dc93fa5639so805015eaf.1
        for <linux-staging@lists.linux.dev>; Tue, 20 Aug 2024 20:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1724209742; x=1724814542; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUBD+hB9uTLEnGM3jp7igQB/VUtJFKRV9rFHokEeKCQ=;
        b=jkdXuTMgFEa6xlxmLrQGpq4Jv0oOPhu7oNuy0+hUHObmCxDNOQvKKc1j1TyTglraqA
         e0JNG1QhTqMX/HWHMy8luSOEuVfCLEGbep/Uekd6aJmYs7k9O7IZNkYhdS8AgfecuCO9
         FFiBzPUVSednN7roa2mAz1KqBaed8lAr1+ZDvnVwv0SU4mmY4vxlP1m04Yrj7or3IFrW
         tL71hHxYMvwJAdmUltgF9hQyERjJwt4H5KzHzjF1BQeMdFlwrwTR4UccWLlzYHzzCuH9
         LnUrzcgtslPrnGLecp+/o2ICJU9yCgXHAUD/grXMwYBDSPDnsLfeYOBWSmAyTVqUB+Uh
         Fz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724209742; x=1724814542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUBD+hB9uTLEnGM3jp7igQB/VUtJFKRV9rFHokEeKCQ=;
        b=GuGOAM0OUIGqr5Ohxi6/TtaovuVf8jvOERQoDLtAd+cWKuJlvLxeQS3OVcnoC4LUzp
         TbPKgRTJ6WF5CERkVZQX7B0gOTSTvttx+RbU66q55wXSah7t0YMGzvinROPjbytRLG8i
         DcOiqkjA2zGEHDL9vuTsHy9sYOVYZuV5MBpRtE6DH4tqapYzO79xe7BsrsU08ZTZtmb4
         lMNDmdQeYgCfoXFS7yVOvWHh0z5jiljZ1DAdmAYLklSkpG3bUDAaS6+UVxZRuUMcIP3A
         jnigZM7+v5C6SQMFCuHPXp9paZghEzJhdSjr6GlRW+ccH13T3C1c9yKSzItUJcjgYguc
         khtQ==
X-Gm-Message-State: AOJu0YxF6J7lJzilVjBfJ4411eAxCyAeaKwYvxSJedromq2X33eqHTIN
	EZL1yMom/TKnkMsEMhXwERXwg24f7O6gc5ARmKFfabWjB5wLsSPAHwtwtbL43nf48/zqXoo2QoE
	c4s8=
X-Google-Smtp-Source: AGHT+IHMiFDWJHrUgwGHz1wp4yDgVI3OB2OBVcxAd3/LLlGuAdbgM3uU80ycc23R0d6mutCZQTfbtw==
X-Received: by 2002:a05:6358:3b96:b0:1b5:a139:a24a with SMTP id e5c5f4694b2df-1b5a139b5e2mr131259555d.18.1724209742132;
        Tue, 20 Aug 2024 20:09:02 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127add75dbsm8934404b3a.44.2024.08.20.20.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 20:09:01 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 2/6] Staging: rtl8192e: Rename variable CmdID_SetTxPowerLevel
Date: Tue, 20 Aug 2024 20:08:52 -0700
Message-Id: <20240821030856.57423-3-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240821030856.57423-1-tdavies@darkphysics.net>
References: <20240821030856.57423-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable CmdID_SetTxPowerLevel to
cmd_id_set_tx_power_level to fix checkpatch warning Avoid
CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 4 ++--
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index e844f1b4913b..e82e992dd139 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -552,7 +552,7 @@ static u8 _rtl92e_phy_switch_channel_step(struct net_device *dev, u8 channel,
 		_rtl92e_phy_set_sw_chnl_cmd_array(dev, ieee->PreCommonCmd,
 						  PreCommonCmdCnt++,
 						  MAX_PRECMD_CNT,
-						  CmdID_SetTxPowerLevel,
+						  cmd_id_set_tx_power_level,
 						  0, 0, 0);
 		_rtl92e_phy_set_sw_chnl_cmd_array(dev, ieee->PreCommonCmd,
 						  PreCommonCmdCnt++,
@@ -611,7 +611,7 @@ static u8 _rtl92e_phy_switch_channel_step(struct net_device *dev, u8 channel,
 			if (!CurrentCmd)
 				continue;
 			switch (CurrentCmd->CmdID) {
-			case CmdID_SetTxPowerLevel:
+			case cmd_id_set_tx_power_level:
 				if (priv->ic_cut > VERSION_8190_BD)
 					_rtl92e_set_tx_power_level(dev,
 								   channel);
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 11408fadd1e7..19afb056520e 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -154,7 +154,7 @@ struct cb_desc {
 
 enum sw_chnl_cmd_id {
 	cmd_id_end,
-	CmdID_SetTxPowerLevel,
+	cmd_id_set_tx_power_level,
 	CmdID_BBRegWrite10,
 	CmdID_WritePortUlong,
 	CmdID_WritePortUshort,
-- 
2.30.2

