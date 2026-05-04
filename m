Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB7F37B3F4
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 23:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777938538; cv=none; b=kUmVDUwt8c1MMDyXIQt3/tAOrcz50IkC/2DONcj2TRsgUnSx9DoCY+Y6erhzLTv9vPxtiHWrh3+FuDlYojC2EetL1psX4ub0E+flCPR23yi4Zmd4W4h4jsygLZevKAIB8SLrqBFbKE1eb7h9VpkifAGJ/9DWv5FhueoLLszuVOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777938538; c=relaxed/simple;
	bh=9KAKmuKJ7BAdoTXsCtmKczxiTYX3fN+4ZpOjNzSIGKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BLMfKj5p0VJXZx2EUO61/VavOGiRiU/0h1WRNa+1AyEoCKYg1ZBUxGfh+a55OsDvMKHW6aue9+BpoXf9+EFXFKTlFIgUPnxyz4s/bTEVndtO8slT91DSNHLe1TwBqtEj8rx21H17TnSvExboaAL4uLARQ+zturqeisLI9neVw3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qcPzlSWs; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qcPzlSWs"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso5128648eec.1
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 16:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777938536; x=1778543336; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NhQ9aKtdNb3LPbliVk7Inx/1ZXEq2Xxa3Y+RjlpdP7Q=;
        b=qcPzlSWsDlg1PRLvX7iKmPS3fUj9tsaW40X6N4xMTCV3xU7tNXbkY34o6jcqB1Ssxq
         DybPoAmFFQiVwVWZDgJkWq0pNKbJ6BXY9ZDuzt7fWyjdt9cPe5UZwFlDPd19FEm9cUSz
         dCPxD6ejUmMFEIFtqNj9XMxtSNpW5pOONF6Y5K92puZdu8e7BmUN9FWhZ6i0575Gcc8C
         bI5WE9wVIUCBo4PyUpNvnXN5wGZT8Ylxef/mnZ0Ppa8hdvPf4P34dM0yhwN7zpHD/HpP
         Zihp7P4Eh+uzmZTekIpodb29AW3r2CZgwj4d5AGSnFPDFxLUN+nTN1mSDvdMwnyFZU82
         ENvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777938536; x=1778543336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhQ9aKtdNb3LPbliVk7Inx/1ZXEq2Xxa3Y+RjlpdP7Q=;
        b=LjFywfBFSK7sNhfp01DRMsIszZWT6n+2k4LbAwz8F9pCLSvwWQtrO8+VGqdyDlaWAk
         feCmk7PPWbrLxS/bwD/dAr6TD+JTc2uxm6mhQe8hdB7cPtOyEeh9tWSv2A/uoPwES6xw
         FZdTLnyF3mAXWseOg5fIUpuyswm/khS2G6mSSvtIlpnmQ4BxWZrelzmX9t3gr12SJpu9
         2jLBnRSU7uuVhSgG9xla4K2KeSu9EVbyCp4fAFukc1yLJxxrD8plauJyncvE0d+GcJlF
         AOIvrGK2InLjETwHMgcg7/rKJGf84szExos47tgWGYeB73rJcj5ydJUhM1GbZ7uCvQoo
         k8og==
X-Gm-Message-State: AOJu0YzIxEuHDA4kYbAxFBV/whkeK+iHiR66MwA+I4eyOPZcVVpBFnvs
	thd2MVSToVvHHn7BqdhUiSZ49uGxQ3jQIjmbuMXX0/yCGdbYl3oquRms
X-Gm-Gg: AeBDieuueEvbztcYD7DxkBBQWuzZAdvnLiJvJszZsOtG1xklqIBadfNHN1ZSQOfyAlX
	Ykjf6EFVoNMkisAu27HvOjHcUfEiuL5Jlf7rog3ykEvvaM6G6HQC91cHN+feO6x9iRmtGHoorjK
	jL85uwwRnHOgU77y4mrVffmHJFYLNilRVVF+F3sgvIT7zP41dUKoklt18tTulEQiHiEXGyczMZJ
	QeqGvOEBIMAUfHoREkFslAQc3FXm6SZTeCOwf1RWt0GJpXsYRRxXw6sB7Bsh7Sg2JWFOApP1r45
	aV6y7xGBeWX9ws0tf0WPnYewGTd2TO819OkNSldau+5MXEJq5GiQp8q7xriFnl7pE7h1+OsKJUK
	oJ0jfOMy2O1JXifja82gp7tsHQLqxV9Wllx/NRfLFlMq/YynQCcw4y507SQEPpbbHYmBeIN5f8S
	itw8E6Js9Pbp+6Phtd+mhz1KykNXyEugnXA9dyCRj6IGNsP6GmxZ+SVuhJvbzhfp89r3eQbd71P
	O1FhQh1Xb7xa1HAIYADhw==
X-Received: by 2002:a05:7300:b54b:b0:2ed:f791:3417 with SMTP id 5a478bee46e88-2f409cb09a7mr402791eec.25.1777938535751;
        Mon, 04 May 2026 16:48:55 -0700 (PDT)
Received: from aidan-cachyPC ([8.3.93.248])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b781555sm18732863eec.21.2026.05.04.16.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 16:48:55 -0700 (PDT)
From: Aidan Russell <aidanlrussell@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aidan Russell <aidanlrussell@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Replace uint with unsigned int in core
Date: Mon,  4 May 2026 16:48:46 -0700
Message-ID: <20260504234846.114912-1-aidanlrussell@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the uint type with unsigned int in the rtl8723bs core code.

This removes unnecessary typedef use and moves the driver closer to
standards.

No functional changes intended.

Signed-off-by: Aidan Russell <aidanlrussell@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c  | 12 ++++++------
 drivers/staging/rtl8723bs/core/rtw_cmd.c |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index f213bb8e173c..c1867b9047ac 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -56,7 +56,7 @@ static void update_BCNTIM(struct adapter *padapter)
 	/* update TIM IE */
 	u8 *p, *dst_ie, *premainder_ie = NULL, *pbackup_remainder_ie = NULL;
 	__le16 tim_bitmap_le;
-	uint offset, tmp_len, tim_ielen, tim_ie_offset, remainder_ielen;
+	unsigned int offset, tmp_len, tim_ielen, tim_ie_offset, remainder_ielen;
 
 	tim_bitmap_le = cpu_to_le16(pstapriv->tim_bitmap);
 
@@ -152,7 +152,7 @@ static void update_BCNTIM(struct adapter *padapter)
 		kfree(pbackup_remainder_ie);
 	}
 
-	offset =  (uint)(dst_ie - pie);
+	offset =  (unsigned int)(dst_ie - pie);
 	pnetwork_mlmeext->ie_length = offset + remainder_ielen;
 }
 
@@ -757,7 +757,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	u8 *ht_info_ie = NULL;
 	struct sta_info *psta = NULL;
 	u16 cap, ht_cap = false;
-	uint ie_len = 0;
+	unsigned int ie_len = 0;
 	int group_cipher, pairwise_cipher;
 	u8 channel, network_type, support_rate[NDIS_802_11_LENGTH_RATES_EX];
 	int support_rate_num = 0;
@@ -1351,7 +1351,7 @@ static void update_bcn_wps_ie(struct adapter *padapter)
 	u8 *premainder_ie;
 	u8 *pbackup_remainder_ie = NULL;
 
-	uint wps_ielen = 0, wps_offset, remainder_ielen;
+	unsigned int wps_ielen = 0, wps_offset, remainder_ielen;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
@@ -1371,7 +1371,7 @@ static void update_bcn_wps_ie(struct adapter *padapter)
 	if (!pwps_ie_src)
 		return;
 
-	wps_offset = (uint)(pwps_ie - ie);
+	wps_offset = (unsigned int)(pwps_ie - ie);
 
 	premainder_ie = pwps_ie + wps_ielen;
 
@@ -1380,7 +1380,7 @@ static void update_bcn_wps_ie(struct adapter *padapter)
 	if (remainder_ielen)
 		pbackup_remainder_ie = kmemdup(premainder_ie, remainder_ielen, GFP_ATOMIC);
 
-	wps_ielen = (uint)pwps_ie_src[1];/* to get ie data len */
+	wps_ielen = (unsigned int)pwps_ie_src[1];/* to get ie data len */
 	if ((wps_offset + wps_ielen + 2 + remainder_ielen) <= MAX_IE_SZ) {
 		memcpy(pwps_ie, pwps_ie_src, wps_ielen + 2);
 		pwps_ie += (wps_ielen + 2);
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 1f65267e7316..0b093c3fdb63 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -672,7 +672,7 @@ int rtw_startbss_cmd(struct adapter  *padapter, int flags)
 u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 {
 	u8 res = _SUCCESS;
-	uint	t_len = 0;
+	unsigned int t_len = 0;
 	struct wlan_bssid_ex *psecnetwork;
 	struct cmd_obj *pcmd;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
-- 
2.54.0

