Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A819133987
	for <linux-staging@lists.linux.dev>; Fri, 30 Aug 2024 02:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724983515; cv=none; b=HocQsoBazaUDGQQAKEZ6a8AQqhw1t317dCZ/5hNFI9PCdHPtYhkMYogGlJxOtpz7egEMqJ391saCxxRzYepORTsPM034XW6s9fhe8Ir5vztH+98l2i8FV5Jur/fPyUcElE78hF43BRtW5JicnVeCPnaJxRgRZ/LUOjQ4bjUE4z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724983515; c=relaxed/simple;
	bh=RbULwptBNsQzLDugQEUPGZRs+tEtmEkTlsEW1ExqCd8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=guVo8RgHw1LRZEET4KpyKjKGQVNlVI281PeyuHZa81DPMepQLtqjjHtedPqevrYiyVieCD0AQ4TWc1dgTYagA0V9lvHL0Ltdt0N/7elg/zYBZtDO9EJAjssQBKU4YA0COQV0OsK6mYwnXNhQXOMDt1ru01+xSIzpGi2xTKsq4yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=S6ibGiFS; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="S6ibGiFS"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-201fae21398so9548085ad.1
        for <linux-staging@lists.linux.dev>; Thu, 29 Aug 2024 19:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1724983514; x=1725588314; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hsD9LbYpzmdL2ZeNCROIWLwhmARjVZHTeH3nqMJ/Ph0=;
        b=S6ibGiFSsZE5TwPx5zz3KhEShPAVwI3sMDETiNEeFsV+IIu4yH+aOE6uTp+RFQEfgL
         j3pfVWmjE3bOE/IHItPXB7KUIGBwTNTSFIrqooCF/dob5123RkSYPdGEjIpd4pmSqgj3
         TDo42yVIQ9vvFAosV7+ubniGxOiVj8U+hLh8eDVsHv1e6tTdF9fuFODT0ja8kSSC2+uK
         k53Y22p9wBrwVIgqCw7by0R7h6V/n4gwfcxvVOuJaNwxpS14e96FqGJB+RHyUXHEzMtB
         /lE79A/DiBb2Fz7Srl18xdPPrsAcx2LetNY7p/Wobs/0KK3gZsvh/v0LnEWthaIrdYD9
         vPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724983514; x=1725588314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsD9LbYpzmdL2ZeNCROIWLwhmARjVZHTeH3nqMJ/Ph0=;
        b=HiP18pDuTq0FLfJTn+tulpnFwkhdxrddyb2tHoxfJvusdkylfi//S0vVPiZYpS5t1P
         VF598rUCqz64c91NnoLWQaq5GDEfXp1ePVK5y5TKBablp5snOUVIPlXoUF2iDS0cAvJv
         Rj+Uw2cG3xC4xhyNDIAQglM8tZ2XPi+Ch0dTrmGyiJIevuDeCJeolSfMznv6MljkUAMG
         k25Pa5CVNd8STCho2vX4OZ7Z3qS9tBX9jO9OpNxC0M59zfNeQqDauboqX5xhWFsIWJ1t
         b1DOtHd7z2f4TXN6M245UNLQoKzQsr5xMkdY/TGPNPZNiKvrmBUJ2llrBUbnTw/AsB0I
         5+wA==
X-Gm-Message-State: AOJu0YwsYCFGTMHFz5V0MI/g4JhpMCGK3YCZLh4lggdHK+yeo7BucyMt
	18FzZOKjOnwNpA+I2U6wmk2ooLYTCaSIPQlVx5WjIYAKI5Rbjmff3Hgoa1gDn7q5PbbvcJ3MoGE
	Vj3Y=
X-Google-Smtp-Source: AGHT+IEbrhKrkG/YPfdNtcnK7FFbWYMk2XQ5TxnLnCiZ/69HTpUofKUKGToIshgEqOGqJ9UraCWlfw==
X-Received: by 2002:a17:902:cece:b0:1fc:6901:9c35 with SMTP id d9443c01a7336-2050c23ca2amr57985555ad.20.1724983513650;
        Thu, 29 Aug 2024 19:05:13 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20515534444sm17643255ad.147.2024.08.29.19.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 19:05:13 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 3/3] Staging: rtl8192e: Add spaces around operators.
Date: Thu, 29 Aug 2024 19:05:08 -0700
Message-Id: <20240830020508.532945-4-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830020508.532945-1-tdavies@darkphysics.net>
References: <20240830020508.532945-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add spaces around arithmetic and bitwise operators to improve
readability of the code.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h | 62 +++++++++++++++----------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 76f53b797644..17a6fb565c9d 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -339,12 +339,12 @@ enum rt_op_mode {
 
 #define	FC_QOS_BIT					BIT(7)
 #define is_data_frame(pdu)	(((pdu[0] & 0x0C) == 0x08) ? true : false)
-#define	is_legacy_data_frame(pdu)	(is_data_frame(pdu) && (!(pdu[0]&FC_QOS_BIT)))
+#define	is_legacy_data_frame(pdu)	(is_data_frame(pdu) && (!(pdu[0] & FC_QOS_BIT)))
 #define is_qos_data_frame(pframe)			\
-	((*(u16 *)pframe&(IEEE80211_STYPE_QOS_DATA|RTLLIB_FTYPE_DATA)) ==	\
-	(IEEE80211_STYPE_QOS_DATA|RTLLIB_FTYPE_DATA))
-#define frame_order(pframe)     (*(u16 *)pframe&IEEE80211_FCTL_ORDER)
-#define SN_LESS(a, b)		(((a-b)&0x800) != 0)
+	((*(u16 *)pframe & (IEEE80211_STYPE_QOS_DATA | RTLLIB_FTYPE_DATA)) ==	\
+	(IEEE80211_STYPE_QOS_DATA | RTLLIB_FTYPE_DATA))
+#define frame_order(pframe)     (*(u16 *)pframe & IEEE80211_FCTL_ORDER)
+#define SN_LESS(a, b)		(((a - b) & 0x800) != 0)
 #define SN_EQUAL(a, b)	(a == b)
 #define MAX_DEV_ADDR_SIZE 8
 
@@ -414,13 +414,13 @@ enum _REG_PREAMBLE_MODE {
 #define WLAN_GET_SEQ_FRAG(seq) ((seq) & RTLLIB_SCTL_FRAG)
 #define WLAN_GET_SEQ_SEQ(seq)  (((seq) & RTLLIB_SCTL_SEQ) >> 4)
 
-#define RTLLIB_STATMASK_SIGNAL (1<<0)
-#define RTLLIB_STATMASK_RSSI (1<<1)
-#define RTLLIB_STATMASK_NOISE (1<<2)
+#define RTLLIB_STATMASK_SIGNAL (1 << 0)
+#define RTLLIB_STATMASK_RSSI (1 << 1)
+#define RTLLIB_STATMASK_NOISE (1 << 2)
 #define RTLLIB_STATMASK_WEMASK 0x7
 
-#define RTLLIB_CCK_MODULATION    (1<<0)
-#define RTLLIB_OFDM_MODULATION   (1<<1)
+#define RTLLIB_CCK_MODULATION    (1 << 0)
+#define RTLLIB_OFDM_MODULATION   (1 << 1)
 
 #define RTLLIB_CCK_RATE_LEN		4
 #define RTLLIB_CCK_RATE_1MB			0x02
@@ -507,11 +507,11 @@ struct rtllib_frag_entry {
 
 struct rtllib_device;
 
-#define SEC_ACTIVE_KEY    (1<<4)
-#define SEC_AUTH_MODE     (1<<5)
-#define SEC_UNICAST_GROUP (1<<6)
-#define SEC_LEVEL	 (1<<7)
-#define SEC_ENABLED       (1<<8)
+#define SEC_ACTIVE_KEY    (1 << 4)
+#define SEC_AUTH_MODE     (1 << 5)
+#define SEC_UNICAST_GROUP (1 << 6)
+#define SEC_LEVEL	 (1 << 7)
+#define SEC_ENABLED       (1 << 8)
 
 #define SEC_LEVEL_0      0 /* None */
 #define SEC_LEVEL_1      1 /* WEP 40 and 104 bit */
@@ -696,17 +696,17 @@ union frameqos {
 #define MAX_WPA_IE_LEN 64
 #define MAX_WZC_IE_LEN 256
 
-#define NETWORK_EMPTY_ESSID (1<<0)
-#define NETWORK_HAS_OFDM    (1<<1)
-#define NETWORK_HAS_CCK     (1<<2)
+#define NETWORK_EMPTY_ESSID (1 << 0)
+#define NETWORK_HAS_OFDM    (1 << 1)
+#define NETWORK_HAS_CCK     (1 << 2)
 
 /* QoS structure */
-#define NETWORK_HAS_QOS_PARAMETERS      (1<<3)
-#define NETWORK_HAS_QOS_INFORMATION     (1<<4)
+#define NETWORK_HAS_QOS_PARAMETERS      (1 << 3)
+#define NETWORK_HAS_QOS_INFORMATION     (1 << 4)
 #define NETWORK_HAS_QOS_MASK	    (NETWORK_HAS_QOS_PARAMETERS | \
 					 NETWORK_HAS_QOS_INFORMATION)
 /* 802.11h */
-#define NETWORK_HAS_ERP_VALUE	   (1<<10)
+#define NETWORK_HAS_ERP_VALUE	   (1 << 10)
 
 #define QOS_QUEUE_NUM		   4
 #define QOS_OUI_LEN		     3
@@ -996,8 +996,8 @@ enum rtl_link_state {
 #define DEFAULT_MAX_SCAN_AGE (15 * HZ)
 #define DEFAULT_FTS 2346
 
-#define CFG_RTLLIB_RESERVE_FCS (1<<0)
-#define CFG_RTLLIB_COMPUTE_FCS (1<<1)
+#define CFG_RTLLIB_RESERVE_FCS (1 << 0)
+#define CFG_RTLLIB_COMPUTE_FCS (1 << 1)
 
 struct tx_pending {
 	int frag;
@@ -1288,7 +1288,7 @@ struct rtllib_device {
 	u16 scan_watch_dog;
 
 	/* map of allowed channels. 0 is dummy */
-	u8 active_channel_map[MAX_CHANNEL_NUMBER+1];
+	u8 active_channel_map[MAX_CHANNEL_NUMBER + 1];
 
 	int rate;       /* current rate */
 	int basic_rate;
@@ -1486,32 +1486,32 @@ struct rtllib_device {
 /* Uses the channel change callback directly
  * instead of [start/stop] scan callbacks
  */
-#define IEEE_SOFTMAC_SCAN (1<<2)
+#define IEEE_SOFTMAC_SCAN (1 << 2)
 
 /* Perform authentication and association handshake */
-#define IEEE_SOFTMAC_ASSOCIATE (1<<3)
+#define IEEE_SOFTMAC_ASSOCIATE (1 << 3)
 
 /* Generate probe requests */
-#define IEEE_SOFTMAC_PROBERQ (1<<4)
+#define IEEE_SOFTMAC_PROBERQ (1 << 4)
 
 /* Generate response to probe requests */
-#define IEEE_SOFTMAC_PROBERS (1<<5)
+#define IEEE_SOFTMAC_PROBERS (1 << 5)
 
 /* The ieee802.11 stack will manage the netif queue
  * wake/stop for the driver, taking care of 802.11
  * fragmentation. See softmac.c for details.
  */
-#define IEEE_SOFTMAC_TX_QUEUE (1<<7)
+#define IEEE_SOFTMAC_TX_QUEUE (1 << 7)
 
 /* Uses only the softmac_data_hard_start_xmit
  * even for TX management frames.
  */
-#define IEEE_SOFTMAC_SINGLE_QUEUE (1<<8)
+#define IEEE_SOFTMAC_SINGLE_QUEUE (1 << 8)
 
 /* Generate beacons.  The stack will enqueue beacons
  * to the card
  */
-#define IEEE_SOFTMAC_BEACONS (1<<6)
+#define IEEE_SOFTMAC_BEACONS (1 << 6)
 
 static inline void *rtllib_priv(struct net_device *dev)
 {
-- 
2.30.2

