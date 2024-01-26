Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD0246447
	for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 22:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706308303; cv=none; b=D/d5ehtZ/6swIAuymvMM9Rj+O7vWntyM5xGRIhyri/LcVbusXKfW4SXOFf9LMnDmLMvkiQ/YWdgjbhhxdw/eb4HihiuVAOby8awJpDwxoqp7WrKlwyKyVIeqadjkESKZgVw2jTy421X/LwFGzIVPCikTEydKwFkh6SbT6+rOoZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706308303; c=relaxed/simple;
	bh=tXrWRipgv+IfWoWJanojL9H7ir4dtpcd7cY4Radj6PA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B0g2fTrwPfmbSm01CzBbguE+k6MC72EgQ3qAEEki2BvNEsm9hb7ZuAGB260d5r1q2OEfoh3hV7cPb0H+MMSFtJHk1+qbo9TBGi/1w7xcFKdk55FsbVlEuMOYDHrhpIIq9ghlC63VU9HipIyrl9dfTaS3TgUUwE6wGaTXCCTkquo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=mg/BH8yS; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="mg/BH8yS"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d731314e67so6133945ad.1
        for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 14:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706308301; x=1706913101; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ow3EKOni9BuhdA4VJdVm97xtU3J/2d5f0LEQZ2AWapA=;
        b=mg/BH8yS9MnW5vDhvANS7k1ZNqYEyARnfPqp4Jzmh3BXyU61qmhTuHEqiCWi6oYHt6
         sPhSgjX+hVykne/g17od2ioVImBQhXzDSF6rVg4Ntv35EY+ytIX8va+z5TpclE2wOJAt
         pPoaHaERttwRsKTWiUvvZlRwD5tBDsFDoy+yBwfLFZZKzizl24Hz5KKDnQ52jvpSgjgQ
         QpLUapcg7Mt4ZVGmPWoSQW0Z5/zmo7t+VHI+XX9ODOx946dxotm/AWbZYVrtzL+A74UR
         0Q2fOs4QXcmCDeMCKhwSK4v6MD1p+wO6pQTprkDHXoYNN+HPpD7h2JazjzDgOEZZ8Ac0
         oAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706308301; x=1706913101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ow3EKOni9BuhdA4VJdVm97xtU3J/2d5f0LEQZ2AWapA=;
        b=JtEMYffbdEGRHksckndZvkBfvrPk5go1iL+rf4fwePAQ3cz+Fwn68iZC6NdlncD4F6
         wKURLrn7Hw1fAGFBjiIMwcQxCcson7+NgcdwsOMZdHz3B7DzL9VpGMP+yg0tCWdVk0e9
         G93uVUUrKWAiuhRx3Ax3b4TWVl7KWgnwEREyxnHozGSPzoQrpvLSvTTraxI8RXUoNm0q
         /7p4nSCMFLkgvcgmSp0luom/+xRvmhDdX4vEhD0epLIhc3VDjZLlSEO1w2eKeZMWX/xE
         1dat/GE1vWhS94Qs2XpVQdpXyzdHy/x7fni059D3Yo/Nn7EURT1OxUwN4D27do/pURFz
         kA/A==
X-Gm-Message-State: AOJu0Yy2LXAZ9Ikq/JYtJD/xgOiH2gUGl+mtrzHrw8byza6+8SuS3hT9
	e52izrYbrMNJnRbXTQ48oyUJIhGkjaW9rg63z2oEDgJ51F2+aIvlBU60AZA8ta4=
X-Google-Smtp-Source: AGHT+IF8Geg3WrBuXLpGL3e46X96eIMZzU5UnGifA9iKt1tGbnTmIvuFwoX1ahktVabUNHfQoje8kg==
X-Received: by 2002:a17:903:32ca:b0:1d8:8623:bc54 with SMTP id i10-20020a17090332ca00b001d88623bc54mr545273plr.74.1706308301511;
        Fri, 26 Jan 2024 14:31:41 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902d0c100b001d8a8f431b7sm737909pln.300.2024.01.26.14.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 14:31:40 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 05/18] Staging: rtl8192e: Rename function pointer SetHwRegHandler()
Date: Fri, 26 Jan 2024 14:30:53 -0800
Message-Id: <20240126223106.986093-6-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126223106.986093-1-tdavies@darkphysics.net>
References: <20240126223106.986093-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function pointer SetHwRegHandler to set_hw_reg_handler to fix 
checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: Update commit message.
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c |  4 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   | 12 ++++++------
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c     |  6 +++---
 drivers/staging/rtl8192e/rtllib.h              |  2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c      |  6 +++---
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 9b9d95ba06df..4cd3d7b7c31c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -164,7 +164,7 @@ void rtl92e_set_reg(struct net_device *dev, u8 variable, u8 *val)
 				    eACI);
 			break;
 		}
-		priv->rtllib->SetHwRegHandler(dev, HW_VAR_ACM_CTRL,
+		priv->rtllib->set_hw_reg_handler(dev, HW_VAR_ACM_CTRL,
 					      &pAcParam);
 		break;
 	}
@@ -1698,7 +1698,7 @@ void rtl92e_stop_adapter(struct net_device *dev, bool reset)
 	u32	ulRegRead;
 
 	op_mode = RT_OP_MODE_NO_LINK;
-	priv->rtllib->SetHwRegHandler(dev, HW_VAR_MEDIA_STATUS, &op_mode);
+	priv->rtllib->set_hw_reg_handler(dev, HW_VAR_MEDIA_STATUS, &op_mode);
 
 	if (!priv->rtllib->bSupportRemoteWakeUp) {
 		u1bTmp = 0x0;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index f986dbb215e4..79e66b726b28 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -236,14 +236,14 @@ static void _rtl92e_update_cap(struct net_device *dev, u16 cap)
 		if (priv->dot11_current_preamble_mode != PREAMBLE_SHORT) {
 			ShortPreamble = true;
 			priv->dot11_current_preamble_mode = PREAMBLE_SHORT;
-			priv->rtllib->SetHwRegHandler(dev, HW_VAR_ACK_PREAMBLE,
+			priv->rtllib->set_hw_reg_handler(dev, HW_VAR_ACK_PREAMBLE,
 					(unsigned char *)&ShortPreamble);
 		}
 	} else {
 		if (priv->dot11_current_preamble_mode != PREAMBLE_LONG) {
 			ShortPreamble = false;
 			priv->dot11_current_preamble_mode = PREAMBLE_LONG;
-			priv->rtllib->SetHwRegHandler(dev, HW_VAR_ACK_PREAMBLE,
+			priv->rtllib->set_hw_reg_handler(dev, HW_VAR_ACK_PREAMBLE,
 					      (unsigned char *)&ShortPreamble);
 		}
 	}
@@ -256,13 +256,13 @@ static void _rtl92e_update_cap(struct net_device *dev, u16 cap)
 		   (!priv->rtllib->ht_info->current_rt2rt_long_slot_time)) {
 			if (cur_slot_time != SHORT_SLOT_TIME) {
 				slot_time_val = SHORT_SLOT_TIME;
-				priv->rtllib->SetHwRegHandler(dev,
+				priv->rtllib->set_hw_reg_handler(dev,
 					 HW_VAR_SLOT_TIME, &slot_time_val);
 			}
 		} else {
 			if (cur_slot_time != NON_SHORT_SLOT_TIME) {
 				slot_time_val = NON_SHORT_SLOT_TIME;
-				priv->rtllib->SetHwRegHandler(dev,
+				priv->rtllib->set_hw_reg_handler(dev,
 					 HW_VAR_SLOT_TIME, &slot_time_val);
 			}
 		}
@@ -301,7 +301,7 @@ static void _rtl92e_qos_activate(void *data)
 		goto success;
 
 	for (i = 0; i <  QOS_QUEUE_NUM; i++)
-		priv->rtllib->SetHwRegHandler(dev, HW_VAR_AC_PARAM, (u8 *)(&i));
+		priv->rtllib->set_hw_reg_handler(dev, HW_VAR_AC_PARAM, (u8 *)(&i));
 
 success:
 	mutex_unlock(&priv->mutex);
@@ -660,7 +660,7 @@ static void _rtl92e_init_priv_handler(struct net_device *dev)
 	priv->rtllib->GetHalfNmodeSupportByAPsHandler =
 						rtl92e_is_halfn_supported_by_ap;
 
-	priv->rtllib->SetHwRegHandler = rtl92e_set_reg;
+	priv->rtllib->set_hw_reg_handler = rtl92e_set_reg;
 	priv->rtllib->AllowAllDestAddrHandler = rtl92e_set_monitor_mode;
 	priv->rtllib->init_gain_handler = rtl92e_init_gain;
 	priv->rtllib->rtllib_ips_leave_wq = rtl92e_rtllib_ips_leave_wq;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 92143c50c149..57e1a361a7c9 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -1185,7 +1185,7 @@ static void _rtl92e_dm_check_edca_turbo(struct net_device *dev)
 		if (priv->bcurrent_turbo_EDCA) {
 			u8 tmp = AC0_BE;
 
-			priv->rtllib->SetHwRegHandler(dev, HW_VAR_AC_PARAM,
+			priv->rtllib->set_hw_reg_handler(dev, HW_VAR_AC_PARAM,
 						      (u8 *)(&tmp));
 			priv->bcurrent_turbo_EDCA = false;
 		}
@@ -1636,7 +1636,7 @@ static void _rtl92e_dm_start_hw_fsync(struct net_device *dev)
 	struct r8192_priv *priv = rtllib_priv(dev);
 
 	rtl92e_writel(dev, rOFDM0_RxDetector2, 0x465c12cf);
-	priv->rtllib->SetHwRegHandler(dev, HW_VAR_RF_TIMING,
+	priv->rtllib->set_hw_reg_handler(dev, HW_VAR_RF_TIMING,
 				      (u8 *)(&rf_timing));
 	rtl92e_writeb(dev, 0xc3b, 0x41);
 }
@@ -1647,7 +1647,7 @@ static void _rtl92e_dm_end_hw_fsync(struct net_device *dev)
 	struct r8192_priv *priv = rtllib_priv(dev);
 
 	rtl92e_writel(dev, rOFDM0_RxDetector2, 0x465c52cd);
-	priv->rtllib->SetHwRegHandler(dev, HW_VAR_RF_TIMING, (u8 *)
+	priv->rtllib->set_hw_reg_handler(dev, HW_VAR_RF_TIMING, (u8 *)
 				     (&rf_timing));
 	rtl92e_writeb(dev, 0xc3b, 0x49);
 }
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 0a366874a827..cd45a9c46a94 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1491,7 +1491,7 @@ struct rtllib_device {
 	void (*init_gain_handler)(struct net_device *dev, u8 Operation);
 	void (*ScanOperationBackupHandler)(struct net_device *dev,
 					   u8 Operation);
-	void (*SetHwRegHandler)(struct net_device *dev, u8 variable, u8 *val);
+	void (*set_hw_reg_handler)(struct net_device *dev, u8 variable, u8 *val);
 
 	void (*AllowAllDestAddrHandler)(struct net_device *dev,
 					bool bAllowAllDA, bool WriteIntoReg);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index b5cd030f28c8..b5fe471f765b 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2256,11 +2256,11 @@ static void rtllib_mlme_disassociate_request(struct rtllib_device *rtllib,
 			rtllib->current_network.bssid[i] = 0x22;
 		op_mode = RT_OP_MODE_NO_LINK;
 		rtllib->op_mode = RT_OP_MODE_NO_LINK;
-		rtllib->SetHwRegHandler(rtllib->dev, HW_VAR_MEDIA_STATUS,
+		rtllib->set_hw_reg_handler(rtllib->dev, HW_VAR_MEDIA_STATUS,
 					(u8 *)(&op_mode));
 		rtllib_disassociate(rtllib);
 
-		rtllib->SetHwRegHandler(rtllib->dev, HW_VAR_BSSID,
+		rtllib->set_hw_reg_handler(rtllib->dev, HW_VAR_BSSID,
 					rtllib->current_network.bssid);
 	}
 }
@@ -2270,7 +2270,7 @@ static void rtllib_mgnt_disconnect_ap(struct rtllib_device *rtllib, u8 asRsn)
 	bool filter_out_nonassociated_bssid = false;
 
 	filter_out_nonassociated_bssid = false;
-	rtllib->SetHwRegHandler(rtllib->dev, HW_VAR_CECHK_BSSID,
+	rtllib->set_hw_reg_handler(rtllib->dev, HW_VAR_CECHK_BSSID,
 				(u8 *)(&filter_out_nonassociated_bssid));
 	rtllib_mlme_disassociate_request(rtllib, rtllib->current_network.bssid,
 				       asRsn);
-- 
2.39.2

