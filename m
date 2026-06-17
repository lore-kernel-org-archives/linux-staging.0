Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593A33B583A
	for <linux-staging@lists.linux.dev>; Wed, 17 Jun 2026 06:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781678586; cv=none; b=kjE1v0CNUlopaPc+t3tm+kVoY+pYtmM/diY8tM0BE3LKYugQFxsyodGfF5Yzi0Yp7YnkLVLe9cFfXh1wBjyv2UcsbQjm597Dpw89RJAdtmfM79cW/tb1zL+bAQyCDUq76M8IX25u+PauQTolaWXe86qtZ4LT8ueBxqy81RCBQtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781678586; c=relaxed/simple;
	bh=vvDwO2bDCySlMPvDLNBWcqqr1m7dAUbx9wxY2Rzs2VM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fdfv9rYH5DgCUPDF7cbhYrZJwkvIpFcVusGOWLtpQQm65fW6OPJ4cbSglYRb61q8KhOZtF7ZrnMLUsMejcDDKORweMRiU+L8Ri6OGQY57JQXlhN7W+8lk4pIQEjQzxJUzzRw+9Hvz4GNb8owzIqUtb8yGNgdWcTk2+QROLANvBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lO1MF2y/; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lO1MF2y/"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c8588ec1b44so3757058a12.1
        for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 23:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781678585; x=1782283385; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqWyG36ay5LrncKhXJx65qkxjWOz+jvOne9pjPptPCk=;
        b=lO1MF2y/44msJ2UATGreqZ/G5/1doYQmJ7Sqhodn5Hi/UOqbqFTWrBjG2C2yHdOpUq
         BlFmlvb4Gl4iiS8/UqtrKGE6GWO0utSTu4/0MVQKeApY7V/9Rq8ojh+Dal6mnqQIJxYy
         uBSt16RBMCc6G3/RWYx+GpGjmPJksdX2VCt5UMbaGuLPRBsTQBTxbDMA3gRD4GsYmDt2
         yloOzopdZPfyygfxhC3Q8sJmH3oFj1MX+5uBFRPb/M+977pDGEcYaShL3o4raSD6mP72
         C+0HDiwQWdthkdV+MprIlcfd1aFOs272ExwlUa1SxYbZMsGYhtMcOdvz/fkZOhFoQ9gv
         RDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781678585; x=1782283385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FqWyG36ay5LrncKhXJx65qkxjWOz+jvOne9pjPptPCk=;
        b=IAInwnOZhk6gMrZzt6gRmwffdC0+4uyvbUdpWdHb2FUFmqaYUDRTuUYySDmt3oCWuX
         f+j05NoubWRumjrR+J2YbxYcmDAWwoC7h+LN5f+nYhFhRjRke0rOJqnCJ8N7V3PJHxQ9
         1N45bGb3vwLrAP3phD8TIT8cz5He0ZUoy/IKjHVnu+sNIdbgPCj4blm73iSb04cMs8wH
         gPhxOhwE39H9ufyE1YqlXK5Ezt2RH2DIbVMHw1Hr5tA7tm/tYjNnlkfHdLhMHEHLov8f
         Ydpbp6PRblERXTvXHysInKokt30uRfy/QSHGKRrPQLZp+OvATfrqjhvIhrlaqhQz6XYT
         bFwg==
X-Forwarded-Encrypted: i=1; AFNElJ++67uahZYnBFjI7QEixkOrQgzF/hXm/3pe3SoME39Z0N4px5//TFaTKVsj3rASlgovrYQFRy3Eb9YZxVTr@lists.linux.dev
X-Gm-Message-State: AOJu0YxTWqjA0UfSoKvYZ8zjhtHlSqfyYO43AyYfjESaPkDIzeDQyTzn
	FYi4NMPGbrkBn3F1SRPSnV22BHl6dk8+mbSbF5H8KCJIZfMcmaCUrA5u
X-Gm-Gg: Acq92OG82T3dUFyZTik1SPsHoSxbAn39Z1icxK0jGCXIRYA7pX1oDw92tWxAPGum6uV
	U7PYGkPKDNyPAtN3esrIdRVmSPnOzbNYe0JnJInA+qUCFtBtadE6yGc7YKcU7wdBq+o/9eT/XKF
	lzewecNVAh9q/TFkaAKK2K5ei962nGV0AyCPxJEdeGeQ98EFx7+lKuCOwiqY4vfRkuEuckH0OGY
	ai7oJkBWd1k4wSPGMdYsN4ozNjqNtCd9aJgPvwD0DPIDkNp2j+9FcOkWkvcGHVQQGGrJ1Ua6arc
	TeMoP0PTW0KkMZzNNgTqCZiNVG8RYLOCVXCrQvklN8axB6c+mxIYW6VhLyAhLo3OpQTc86jxQJg
	vBT44DEEzavwSSWiA85/f6L6gJkbxewCtStzdWuJmlJS0q2yvqi0anYbg9FS/ZsHU7EFW2XNLfZ
	gyX0Pbg4kQBA0iPVCGoprI4Y8NUjKilwHnhrEoN1zZOaxS8WJtG3aUUw08lkowR9JL80G2uAnF7
	w==
X-Received: by 2002:a05:6a21:8cc2:b0:3a2:d838:bfc6 with SMTP id adf61e73a8af0-3b8be9afe66mr2720398637.29.1781678584724;
        Tue, 16 Jun 2026 23:43:04 -0700 (PDT)
Received: from fedora ([103.51.149.90])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866325d156sm13738985a12.13.2026.06.16.23.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 23:43:04 -0700 (PDT)
From: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Subhrojyoti Bala <subhrojyoti0609@gmail.com>
Subject: [PATCH v2 2/2] staging: rtl8723bs: Fix comment style issues in header files
Date: Wed, 17 Jun 2026 12:11:50 +0530
Message-ID: <20260617064150.16078-3-subhrojyoti0609@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617064150.16078-1-subhrojyoti0609@gmail.com>
References: <20260617064150.16078-1-subhrojyoti0609@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix various comment style issues in wlan_bssdef.h and rtw_mlme.h
to comply with kernel coding style:

- Use proper multi-line comment format with trailing */ on its
  own line
- Remove extra spaces after /* in single-line comments

No functional change.

Signed-off-by: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
---
v2: Combined four separate comment style patches from v1 into
    this single patch per Dan Carpenter's feedback.

 drivers/staging/rtl8723bs/include/rtw_mlme.h  | 44 +++++++++----------
 .../staging/rtl8723bs/include/wlan_bssdef.h   | 13 +++---
 2 files changed, 29 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 403c097b46ef..950761d4740c 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -13,8 +13,8 @@
 /* define   MAX_JOIN_TIMEOUT	2500 */
 #define   MAX_JOIN_TIMEOUT	6500
 
-/* 	Commented by Albert 20101105 */
-/* 	Increase the scanning timeout because of increasing the SURVEY_TO value. */
+/* Commented by Albert 20101105 */
+/* Increase the scanning timeout because of increasing the SURVEY_TO value. */
 
 #define		SCANNING_TIMEOUT	8000
 
@@ -52,7 +52,7 @@ enum {
 	dot11AuthAlgrthm_MaxNum
 };
 
-/*  Scan type including active and passive scan. */
+/* Scan type including active and passive scan. */
 enum rt_scan_type {
 	SCAN_PASSIVE,
 	SCAN_ACTIVE,
@@ -67,23 +67,22 @@ enum {
 };
 
 /*
-
-there are several "locks" in mlme_priv,
-since mlme_priv is a shared resource between many threads,
-like ISR/Call-Back functions, the OID handlers, and even timer functions.
-
-Each struct __queue has its own locks, already.
-Other items in mlme_priv are protected by mlme_priv.lock, while items in
-xmit_priv are protected by xmit_priv.lock.
-
-To avoid possible dead lock, any thread trying to modifying mlme_priv
-SHALL not lock up more than one locks at a time!
-
-The only exception is that queue functions which take the __queue.lock
-may be called with the xmit_priv.lock held. In this case the order
-MUST always be first lock xmit_priv.lock and then call any queue functions
-which take __queue.lock.
-*/
+ * There are several "locks" in mlme_priv,
+ * since mlme_priv is a shared resource between many threads,
+ * like ISR/Call-Back functions, the OID handlers, and even timer functions.
+ *
+ * Each struct __queue has its own locks, already.
+ * Other items in mlme_priv are protected by mlme_priv.lock, while items in
+ * xmit_priv are protected by xmit_priv.lock.
+ *
+ * To avoid possible dead lock, any thread trying to modifying mlme_priv
+ * SHALL not lock up more than one locks at a time!
+ *
+ * The only exception is that queue functions which take the __queue.lock
+ * may be called with the xmit_priv.lock held. In this case the order
+ * MUST always be first lock xmit_priv.lock and then call any queue functions
+ * which take __queue.lock.
+ */
 
 struct sitesurvey_ctrl {
 	u64	last_tx_pkts;
@@ -184,7 +183,8 @@ struct mlme_priv {
 	u32 wps_probe_req_ie_len;
 
 	/* Number of associated Non-ERP stations (i.e., stations using 802.11b
-	 * in 802.11g BSS) */
+	 * in 802.11g BSS)
+	 */
 	int num_sta_non_erp;
 
 	/* Number of associated stations that do not support Short Slot Time */
@@ -279,7 +279,7 @@ extern signed int rtw_set_auth(struct adapter *adapter, struct security_priv *ps
 
 static inline u8 *get_bssid(struct mlme_priv *pmlmepriv)
 {	/* if sta_mode:pmlmepriv->cur_network.network.mac_address => bssid */
-	/*  if adhoc_mode:pmlmepriv->cur_network.network.mac_address => ibss mac address */
+	/* if adhoc_mode:pmlmepriv->cur_network.network.mac_address => ibss mac address */
 	return pmlmepriv->cur_network.network.mac_address;
 }
 
diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index 812a68394268..26d166f087df 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -32,9 +32,9 @@ enum ndis_802_11_network_type {
 };
 
 /*
-	FW will only save the channel number in DSConfig.
-	ODI Handler will convert the channel number to freq. number.
-*/
+ * FW will only save the channel number in DSConfig.
+ * ODI Handler will convert the channel number to freq. number.
+ */
 struct ndis_802_11_conf {
 	u32 length;             /*  Length of structure */
 	u32 beacon_period;       /*  units are Kusec */
@@ -138,7 +138,8 @@ struct wlan_phy_info {
 
 struct wlan_bcn_info {
 	/* these infor get from rtw_get_encrypt_info when
-	 * * translate scan to UI */
+	 * translate scan to UI
+	 */
 	u8 encryp_protocol;/* ENCRYP_PROTOCOL_E: OPEN/WEP/WPA/WPA2/WAPI */
 	int group_cipher; /* WPA/WPA2 group cipher */
 	int pairwise_cipher;/* WPA/WPA2/WEP pairwise cipher */
@@ -150,8 +151,8 @@ struct wlan_bcn_info {
 };
 
 /* temporally add #pragma pack for structure alignment issue of
-*   struct wlan_bssid_ex and get_wlan_bssid_ex_sz()
-*/
+ * struct wlan_bssid_ex and get_wlan_bssid_ex_sz()
+ */
 struct wlan_bssid_ex {
 	u32  length;
 	u8 mac_address[ETH_ALEN];
-- 
2.54.0

