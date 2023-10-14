Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01C7A47
	for <linux-staging@lists.linux.dev>; Sat, 14 Oct 2023 04:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="Otwh42ru"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-57babef76deso1489293eaf.0
        for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 21:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1697258397; x=1697863197; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mX2HZxkrDDTk+fsvecnLv5LzD6HcEuvgwVlrQ23incY=;
        b=Otwh42ru2DgcbrBOkG2gs/Q+N6dD9W2BoYfSQe4PjwHEpNu64//Avd4HrotQlUq/e6
         r0Aiuffc4g1puoI6Ck/O1QVmyO9N3+rUnL8hXyEtrmukOdtTkTdQHq+u3eMSxCAmokX1
         h5HmFtGcJgtfYIsIlT/33JDBjocKFBT7W7h3aqHwceBHDZ2RQpL7hxpmVTLz5+c2YpzL
         E3svI0goKdywcCW14JBjLUXdlDLNjBPLLQogL9mW3Fa2EoxGyAQmy6x2Ay6rQ9Kdmc+d
         Beu4A39aq1yudZvVQ27U1eS43ZhoGMCbE8RN0TAT6BBx3ly4raECURh6fXQvt5sikSv4
         EVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697258397; x=1697863197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mX2HZxkrDDTk+fsvecnLv5LzD6HcEuvgwVlrQ23incY=;
        b=XiGeEJhuAGkt8+leTdyHhnpZBpiM8kn9uoKavaFXVNElK2/x2CpsP+g1aeDOotft3R
         zJZBuMyzu4gqbe6w2aPOfIiTJdPdcIRWDsCD7E6inzEUmPzhqpIGTv1rlHKNX3fwf54q
         asV1HvA71So9KFjtra3KKrpiqcBzIQeGIxPMo2Hwisc1Y7HtI89iSJoDuc92/S0/7cBj
         a9DyfSQRJv/nkmU0PLXe79cXdc4u3cRQK/ZLJ65G7EeWsZwhvWDbpy/DA5R1OuR6p6O1
         hj4hBApb9vMpoZw02VZAiIpMm80jjXQbYYKk96UiFfPUbSiLTpecEVx31ToXwA8gXACW
         KXKg==
X-Gm-Message-State: AOJu0Yy9zxqIp1I202l7Xd9vs7rfuM6+wgZRKGUBvJYRpIawxP5yGHYm
	PhDRkyhdUSUrgozljt0UhWQ1OzaFWGxcbB773I0=
X-Google-Smtp-Source: AGHT+IFwNlWt0M0if1Y6SYtl5KS20jSK1omEAcmkBly97Rf6gEIkFnakdZJmIUHsWhh7sX6O88AjNQ==
X-Received: by 2002:a05:6358:921:b0:143:8f7f:9150 with SMTP id r33-20020a056358092100b001438f7f9150mr33000446rwi.13.1697258397463;
        Fri, 13 Oct 2023 21:39:57 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id y6-20020aa78046000000b006934350c3absm14271926pfm.109.2023.10.13.21.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 21:39:57 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 3/4] Staging: rtl8192e: Rename variable ReasonCode
Date: Fri, 13 Oct 2023 21:44:34 -0700
Message-ID: <20231014044435.11947-4-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231014044435.11947-1-tdavies@darkphysics.net>
References: <20231014044435.11947-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable ReasonCode to reason_code to fix checkpatch warning
Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 26 +++++++++++------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index a5165fe88217..34fc400035c8 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -125,7 +125,7 @@ static struct sk_buff *rtllib_ADDBA(struct rtllib_device *ieee, u8 *dst,
 
 static struct sk_buff *rtllib_DELBA(struct rtllib_device *ieee, u8 *dst,
 				    struct ba_record *ba,
-				    enum tr_select TxRxSelect, u16 ReasonCode)
+				    enum tr_select TxRxSelect, u16 reason_code)
 {
 	union delba_param_set DelbaParamSet;
 	struct sk_buff *skb = NULL;
@@ -134,8 +134,8 @@ static struct sk_buff *rtllib_DELBA(struct rtllib_device *ieee, u8 *dst,
 	u16 len = 6 + ieee->tx_headroom;
 
 	if (net_ratelimit())
-		netdev_dbg(ieee->dev, "%s(): ReasonCode(%d) sentd to: %pM\n",
-			   __func__, ReasonCode, dst);
+		netdev_dbg(ieee->dev, "%s(): reason_code(%d) sentd to: %pM\n",
+			   __func__, reason_code, dst);
 
 	memset(&DelbaParamSet, 0, 2);
 
@@ -163,7 +163,7 @@ static struct sk_buff *rtllib_DELBA(struct rtllib_device *ieee, u8 *dst,
 	put_unaligned_le16(DelbaParamSet.short_data, tag);
 	tag += 2;
 
-	put_unaligned_le16(ReasonCode, tag);
+	put_unaligned_le16(reason_code, tag);
 	tag += 2;
 
 #ifdef VERBOSE_DEBUG
@@ -200,11 +200,11 @@ static void rtllib_send_ADDBARsp(struct rtllib_device *ieee, u8 *dst,
 
 static void rtllib_send_DELBA(struct rtllib_device *ieee, u8 *dst,
 			      struct ba_record *ba, enum tr_select TxRxSelect,
-			      u16 ReasonCode)
+			      u16 reason_code)
 {
 	struct sk_buff *skb;
 
-	skb = rtllib_DELBA(ieee, dst, ba, TxRxSelect, ReasonCode);
+	skb = rtllib_DELBA(ieee, dst, ba, TxRxSelect, reason_code);
 	if (skb)
 		softmac_mgmt_xmit(skb, ieee);
 	else
@@ -308,7 +308,7 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 	u8 *dst = NULL, *pDialogToken = NULL, *tag = NULL;
 	u16 *status_code = NULL, *pBaTimeoutVal = NULL;
 	union ba_param_set *pBaParamSet = NULL;
-	u16			ReasonCode;
+	u16			reason_code;
 
 	if (skb->len < sizeof(struct ieee80211_hdr_3addr) + 9) {
 		netdev_warn(ieee->dev, "Invalid skb len in BARSP(%d / %d)\n",
@@ -333,14 +333,14 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 			    ieee->current_network.qos_data.active,
 			    ieee->ht_info->current_ht_support,
 			    ieee->ht_info->bCurrentAMPDUEnable);
-		ReasonCode = DELBA_REASON_UNKNOWN_BA;
+		reason_code = DELBA_REASON_UNKNOWN_BA;
 		goto OnADDBARsp_Reject;
 	}
 
 	if (!rtllib_get_ts(ieee, (struct ts_common_info **)&pTS, dst,
 		   (u8)(pBaParamSet->field.tid), TX_DIR, false)) {
 		netdev_warn(ieee->dev, "%s(): can't get TS\n", __func__);
-		ReasonCode = DELBA_REASON_UNKNOWN_BA;
+		reason_code = DELBA_REASON_UNKNOWN_BA;
 		goto OnADDBARsp_Reject;
 	}
 
@@ -357,7 +357,7 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 		netdev_warn(ieee->dev,
 			    "%s(): ADDBA Rsp. BA invalid, DELBA!\n",
 			    __func__);
-		ReasonCode = DELBA_REASON_UNKNOWN_BA;
+		reason_code = DELBA_REASON_UNKNOWN_BA;
 		goto OnADDBARsp_Reject;
 	} else {
 		netdev_dbg(ieee->dev,
@@ -370,7 +370,7 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 		if (pBaParamSet->field.ba_policy == BA_POLICY_DELAYED) {
 			pTS->bAddBaReqDelayed = true;
 			deactivate_ba_entry(ieee, pAdmittedBA);
-			ReasonCode = DELBA_REASON_END_BA;
+			reason_code = DELBA_REASON_END_BA;
 			goto OnADDBARsp_Reject;
 		}
 
@@ -383,7 +383,7 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 	} else {
 		pTS->bAddBaReqDelayed = true;
 		pTS->bDisable_AddBa = true;
-		ReasonCode = DELBA_REASON_END_BA;
+		reason_code = DELBA_REASON_END_BA;
 		goto OnADDBARsp_Reject;
 	}
 
@@ -394,7 +394,7 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 		struct ba_record BA;
 
 		BA.ba_param_set = *pBaParamSet;
-		rtllib_send_DELBA(ieee, dst, &BA, TX_DIR, ReasonCode);
+		rtllib_send_DELBA(ieee, dst, &BA, TX_DIR, reason_code);
 		return 0;
 	}
 }
-- 
2.39.2

