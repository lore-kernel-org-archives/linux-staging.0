Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A265663
	for <linux-staging@lists.linux.dev>; Mon, 27 Nov 2023 05:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="Ma7qyFfX"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1cfc1512df1so4999655ad.2
        for <linux-staging@lists.linux.dev>; Sun, 26 Nov 2023 21:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1701063390; x=1701668190; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRGlPinq49hmId5T7GGWMwmGcH6Fr21H2t959wvL11c=;
        b=Ma7qyFfX1Po7sskTTyZBn1Z4qEGrUUtkJJMXetM3zuMgJjFlOAouwsVui3YyjGfmU+
         tDAUN9dnF3tdi24PQvhBY+OsWjYTJh8uLtltpaZRPjsD/ItAE2ZxSSN1OqTbcsNdOh5y
         pK81sGQaM3AeThtTH5FUn10Bwwunl10lx7JErxeMXf7jQRohhJ8R44EWA6NXpPB0F/jV
         kzWpzVnWJT2M0EMJeLPl1rlKoRMb7eGc+R+k6mIh6RhPd9K8cIehSTcRmZHQDQ8vJ2gs
         ccAkJCTqKWBM4F83hVED0wfeqG3kGf3tVJNjPq7Rk6W6V50nwJNzsSqqUfsG9fPhiGgR
         GUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701063390; x=1701668190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRGlPinq49hmId5T7GGWMwmGcH6Fr21H2t959wvL11c=;
        b=eXoCWBSgiA4Tqa1sSke3uAooCkjQaC+oUamX/IjzQpXJQxGV8QANCdFCSL0log86ud
         Fnm65y7w0QB65M0H9qsiLzkWoMDFWyTLQ9A1Q0jYQvvMtGHIUG/qZnALaDq8BoIoiL72
         vKUPGKZQLaZWZxx5iUbtdNCr5H9K4+4w9ckdP61hTPi6UX6KMKqiQB7fSUlSCXWhEj9T
         pruFMUXvD4ZyNxc5LUd7zjKm+43BjSoKQdh56i3D8LzmjbBeJfQ1MAZ7hd+GoJL8C6aC
         xUboh8IUsE3y90P78gE+nzobld7zrCrJU7ccCBpJYwynJs6jpJOmt+w4d7uOybC79bwF
         B8WA==
X-Gm-Message-State: AOJu0YzU41dXnRu7uzheOjsYjHzdRQcwRZwgBAawl/EV28kaMdI4mhfY
	OzcQAR4u775H/7Q5hf1+tLibIg==
X-Google-Smtp-Source: AGHT+IGALDll4IeJDU4dTVXoQihuuXYJuf0E0LL+K3imBQayxVKQC1VDR8/nm/kaQU8omQQWVgsYxA==
X-Received: by 2002:a17:903:1d2:b0:1cf:ad61:7a67 with SMTP id e18-20020a17090301d200b001cfad617a67mr8258718plh.32.1701063390670;
        Sun, 26 Nov 2023 21:36:30 -0800 (PST)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902ed0600b001cc3875e658sm7300465pld.303.2023.11.26.21.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 21:36:30 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 12/15] Staging: rtl8192e: Rename variable pBaParamSet
Date: Sun, 26 Nov 2023 21:43:02 -0800
Message-ID: <20231127054305.148276-13-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231127054305.148276-1-tdavies@darkphysics.net>
References: <20231127054305.148276-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable pBaParamSet to ba_param_set to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 24 +++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index bd037069d4f3..7074a01ad2e8 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -217,7 +217,7 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 	u16 rc = 0;
 	u8 *dst = NULL, *dialog_token = NULL, *tag = NULL;
 	struct ba_record *ba = NULL;
-	union ba_param_set *pBaParamSet = NULL;
+	union ba_param_set *ba_param_set = NULL;
 	u16 *pBaTimeoutVal = NULL;
 	union sequence_control *pBaStartSeqCtrl = NULL;
 	struct rx_ts_record *ts = NULL;
@@ -239,7 +239,7 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 	dst = (u8 *)(&req->addr2[0]);
 	tag += sizeof(struct ieee80211_hdr_3addr);
 	dialog_token = tag + 2;
-	pBaParamSet = (union ba_param_set *)(tag + 3);
+	ba_param_set = (union ba_param_set *)(tag + 3);
 	pBaTimeoutVal = (u16 *)(tag + 5);
 	pBaStartSeqCtrl = (union sequence_control *)(req + 7);
 
@@ -254,14 +254,14 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 		goto OnADDBAReq_Fail;
 	}
 	if (!rtllib_get_ts(ieee, (struct ts_common_info **)&ts, dst,
-		   (u8)(pBaParamSet->field.tid), RX_DIR, true)) {
+		   (u8)(ba_param_set->field.tid), RX_DIR, true)) {
 		rc = ADDBA_STATUS_REFUSED;
 		netdev_warn(ieee->dev, "%s(): can't get TS\n", __func__);
 		goto OnADDBAReq_Fail;
 	}
 	ba = &ts->rx_admitted_ba_record;
 
-	if (pBaParamSet->field.ba_policy == BA_POLICY_DELAYED) {
+	if (ba_param_set->field.ba_policy == BA_POLICY_DELAYED) {
 		rc = ADDBA_STATUS_INVALID_PARAM;
 		netdev_warn(ieee->dev, "%s(): BA Policy is not correct\n",
 			    __func__);
@@ -272,7 +272,7 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 
 	deactivate_ba_entry(ieee, ba);
 	ba->dialog_token = *dialog_token;
-	ba->ba_param_set = *pBaParamSet;
+	ba->ba_param_set = *ba_param_set;
 	ba->ba_timeout_value = *pBaTimeoutVal;
 	ba->ba_start_seq_ctrl = *pBaStartSeqCtrl;
 
@@ -291,7 +291,7 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 	{
 		struct ba_record BA;
 
-		BA.ba_param_set = *pBaParamSet;
+		BA.ba_param_set = *ba_param_set;
 		BA.ba_timeout_value = *pBaTimeoutVal;
 		BA.dialog_token = *dialog_token;
 		BA.ba_param_set.field.ba_policy = BA_POLICY_IMMEDIATE;
@@ -307,7 +307,7 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 	struct tx_ts_record *ts = NULL;
 	u8 *dst = NULL, *dialog_token = NULL, *tag = NULL;
 	u16 *status_code = NULL, *pBaTimeoutVal = NULL;
-	union ba_param_set *pBaParamSet = NULL;
+	union ba_param_set *ba_param_set = NULL;
 	u16			reason_code;
 
 	if (skb->len < sizeof(struct ieee80211_hdr_3addr) + 9) {
@@ -322,7 +322,7 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 	tag += sizeof(struct ieee80211_hdr_3addr);
 	dialog_token = tag + 2;
 	status_code = (u16 *)(tag + 3);
-	pBaParamSet = (union ba_param_set *)(tag + 5);
+	ba_param_set = (union ba_param_set *)(tag + 5);
 	pBaTimeoutVal = (u16 *)(tag + 7);
 
 	if (!ieee->current_network.qos_data.active ||
@@ -338,7 +338,7 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 	}
 
 	if (!rtllib_get_ts(ieee, (struct ts_common_info **)&ts, dst,
-		   (u8)(pBaParamSet->field.tid), TX_DIR, false)) {
+		   (u8)(ba_param_set->field.tid), TX_DIR, false)) {
 		netdev_warn(ieee->dev, "%s(): can't get TS\n", __func__);
 		reason_code = DELBA_REASON_UNKNOWN_BA;
 		goto OnADDBARsp_Reject;
@@ -367,7 +367,7 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 	}
 
 	if (*status_code == ADDBA_STATUS_SUCCESS) {
-		if (pBaParamSet->field.ba_policy == BA_POLICY_DELAYED) {
+		if (ba_param_set->field.ba_policy == BA_POLICY_DELAYED) {
 			ts->add_ba_req_delayed = true;
 			deactivate_ba_entry(ieee, pAdmittedBA);
 			reason_code = DELBA_REASON_END_BA;
@@ -377,7 +377,7 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 		pAdmittedBA->dialog_token = *dialog_token;
 		pAdmittedBA->ba_timeout_value = *pBaTimeoutVal;
 		pAdmittedBA->ba_start_seq_ctrl = pending_ba->ba_start_seq_ctrl;
-		pAdmittedBA->ba_param_set = *pBaParamSet;
+		pAdmittedBA->ba_param_set = *ba_param_set;
 		deactivate_ba_entry(ieee, pAdmittedBA);
 		activate_ba_entry(pAdmittedBA, *pBaTimeoutVal);
 	} else {
@@ -393,7 +393,7 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 	{
 		struct ba_record BA;
 
-		BA.ba_param_set = *pBaParamSet;
+		BA.ba_param_set = *ba_param_set;
 		rtllib_send_DELBA(ieee, dst, &BA, TX_DIR, reason_code);
 		return 0;
 	}
-- 
2.39.2

