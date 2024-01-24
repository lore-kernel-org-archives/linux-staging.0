Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0D913D4E1
	for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 22:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706136313; cv=none; b=UK+MB6cXYV9PgF4+YS9VQFes5bgEVJ+TG0Pvm4WYjEgdKEZHBJv0Y7GkDoTO0JT4MZx1Aa/tbuyZRMfFBWW0WnCGd5r0NDlpGjVnbjSxOVRNTPD8ree0260zE82a4IE3I9WKJMwTT5iGkq5f8zlshpfUype0O/KxEoVS3fzPqRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706136313; c=relaxed/simple;
	bh=LPmUtH3SPc1v2gg3Rw3RlAoi3PtOhFh9BlCSFSuFjv8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kNr8wsuAaDJrrFkLAk46NbJ7R5CJhvcK6F2STl24d22vXgI/w5WT5ED4AmKJzI2WCvZoAmm3hXfmCpRXJ1OVqGFmRixyzyFb5pQ/xP5fXDmA35aK9psb4pXdnDswIMSHN2Z7+vUFUWtxccdI2nkCh/u1r8hRv30EftVbPliZ0WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=isE45u0Q; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="isE45u0Q"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d76943baafso24174995ad.2
        for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 14:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706136311; x=1706741111; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfwpbVLw9/878UEFWYnT26awViD4BtFws5hlAMXSCyc=;
        b=isE45u0QZ/sKlBfKvArqtioi0OVPaRBswYPA2GEdNwfK7DJfek60UZhR9XrFZ6GRm7
         5811OxVE6OZe4F7/IHwQFvrDe2TndUIyuKTUugzmv/yJMiiOropwVoEjSdb3SoN0DUsv
         sjK5omwZHRyDQC+BQ6kAbKWUaKw5I0LpTntR32ZVuP38qOXOl7VDj7+BiDjsOPcnI8LT
         8BH1pAnv75HCNQwLJKlHE9LzBszveLI5Ro5wLZX85lT4u9AVLvopUMFOeIfKQwyRnOkK
         Q3PMMavthyzpLyjclK1VZIV7DH3PlkZhKMQgkSnauGRii6fCNnJFZT+d/wF9kvX7qyLA
         TbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706136311; x=1706741111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VfwpbVLw9/878UEFWYnT26awViD4BtFws5hlAMXSCyc=;
        b=vN8Hs72jM+szS8wsP+zl8DeeJksgcbU77QlrEWQA7z1TxTQLz2vmph6AQhBEzszm4r
         EYG+AzsSFmBxNEbbdJsi0RIxOghDEMo+bFv4DvAjr4xw7wCkrUgLlwQ9AAMsJ//1afJ6
         jFr1b1w38nl9zj2Dk+KfvBdbI2JjGBPEn3mK7F/siS8UfChT5Ah4RwHi2xnonsgeZErr
         bJnCLZ02CEOl0Rx8DGViKlGe1XJL/ZWHAZM5Tn/A39pvVgi0GUB1mmltPg89CmXg7pWT
         zcLZR8cYa65c/YTwOVmUp7uv2KB8zBXF8e9uHmuaFtVmAcp2FpfFNxL9d7aedrpWu7+3
         PnUQ==
X-Gm-Message-State: AOJu0YzM3l5ua7fdvuF4QeVQEhy4+/9mO2sXmscfa92B025YGIrRzW7v
	KsFT1j0pwIGSOJbvBmFQdI1as+Xdkau559t/tCt8sKXFsdiCULMPLuy3DwKL5Ls=
X-Google-Smtp-Source: AGHT+IGTgpZY7k8hICdIlRQHzBQxcy1NjJ781Jj+4noURQvHUlB+VgO+G4r4p312AhNP7peY27AxsQ==
X-Received: by 2002:a17:903:444:b0:1d7:562f:67ec with SMTP id iw4-20020a170903044400b001d7562f67ecmr65679plb.102.1706136311722;
        Wed, 24 Jan 2024 14:45:11 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id i5-20020a170902c28500b001d73a2acc0csm6743987pld.283.2024.01.24.14.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 14:45:11 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 17/18] Staging: rtl8192e: Rename variable NumRecvBcnInPeriod
Date: Wed, 24 Jan 2024 14:44:51 -0800
Message-Id: <20240124224452.968724-18-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240124224452.968724-1-tdavies@darkphysics.net>
References: <20240124224452.968724-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable NumRecvBcnInPeriod to num_recv_bcn_in_period to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 4 ++--
 drivers/staging/rtl8192e/rtllib.h            | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c         | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c    | 6 +++---
 drivers/staging/rtl8192e/rtllib_softmac_wx.c | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 79e66b726b28..cda00efed227 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -924,7 +924,7 @@ static void _rtl92e_update_rxcounts(struct r8192_priv *priv, u32 *TotalRxBcnNum,
 	slot_index = (priv->rtllib->link_detect_info.slot_index++) %
 			(priv->rtllib->link_detect_info.slot_num);
 	priv->rtllib->link_detect_info.RxBcnNum[slot_index] =
-			priv->rtllib->link_detect_info.NumRecvBcnInPeriod;
+			priv->rtllib->link_detect_info.num_recv_bcn_in_period;
 	priv->rtllib->link_detect_info.RxDataNum[slot_index] =
 			priv->rtllib->link_detect_info.NumRecvDataInPeriod;
 	for (i = 0; i < priv->rtllib->link_detect_info.slot_num; i++) {
@@ -1046,7 +1046,7 @@ static void _rtl92e_watchdog_wq_cb(void *data)
 
 			priv->check_roaming_cnt = 0;
 		}
-		ieee->link_detect_info.NumRecvBcnInPeriod = 0;
+		ieee->link_detect_info.num_recv_bcn_in_period = 0;
 		ieee->link_detect_info.NumRecvDataInPeriod = 0;
 	}
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 0ca38ca4d3af..07a89d1af86d 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1110,7 +1110,7 @@ enum scan_op_backup_opt {
 
 #define RT_MAX_LD_SLOT_NUM	10
 struct rt_link_detect {
-	u32				NumRecvBcnInPeriod;
+	u32				num_recv_bcn_in_period;
 	u32				NumRecvDataInPeriod;
 
 	u32				RxBcnNum[RT_MAX_LD_SLOT_NUM];
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index f777febcfe3b..e6be6dbe2bb5 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -2470,7 +2470,7 @@ static inline void rtllib_process_probe_response(
 		}
 		if (ieee80211_is_beacon(frame_ctl)) {
 			if (ieee->link_state >= MAC80211_LINKED)
-				ieee->link_detect_info.NumRecvBcnInPeriod++;
+				ieee->link_detect_info.num_recv_bcn_in_period++;
 		}
 	}
 	list_for_each_entry(target, &ieee->network_list, list) {
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index a7e7a0b0214f..ba35714f83af 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1074,9 +1074,9 @@ static void rtllib_associate_complete_wq(void *data)
 	ieee->link_detect_info.slot_num = 2 * (1 +
 				       ieee->current_network.beacon_interval /
 				       500);
-	if (ieee->link_detect_info.NumRecvBcnInPeriod == 0 ||
+	if (ieee->link_detect_info.num_recv_bcn_in_period == 0 ||
 	    ieee->link_detect_info.NumRecvDataInPeriod == 0) {
-		ieee->link_detect_info.NumRecvBcnInPeriod = 1;
+		ieee->link_detect_info.num_recv_bcn_in_period = 1;
 		ieee->link_detect_info.NumRecvDataInPeriod = 1;
 	}
 	psc->lps_idle_count = 0;
@@ -2070,7 +2070,7 @@ int rtllib_softmac_init(struct rtllib_device *ieee)
 
 	ieee->link_detect_info.slot_index = 0;
 	ieee->link_detect_info.slot_num = 2;
-	ieee->link_detect_info.NumRecvBcnInPeriod = 0;
+	ieee->link_detect_info.num_recv_bcn_in_period = 0;
 	ieee->link_detect_info.NumRecvDataInPeriod = 0;
 	ieee->link_detect_info.num_tx_ok_in_period = 0;
 	ieee->link_detect_info.num_rx_ok_in_period = 0;
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index 2afa701e5445..4102c2d4f8dd 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -347,9 +347,9 @@ void rtllib_wx_sync_scan_wq(void *data)
 	/* Notify AP that I wake up again */
 	rtllib_sta_ps_send_null_frame(ieee, 0);
 
-	if (ieee->link_detect_info.NumRecvBcnInPeriod == 0 ||
+	if (ieee->link_detect_info.num_recv_bcn_in_period == 0 ||
 	    ieee->link_detect_info.NumRecvDataInPeriod == 0) {
-		ieee->link_detect_info.NumRecvBcnInPeriod = 1;
+		ieee->link_detect_info.num_recv_bcn_in_period = 1;
 		ieee->link_detect_info.NumRecvDataInPeriod = 1;
 	}
 	rtllib_wake_all_queues(ieee);
-- 
2.39.2

