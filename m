Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC3D42055
	for <linux-staging@lists.linux.dev>; Sun, 10 Mar 2024 23:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710114966; cv=none; b=t5XoKHht8u8SuVz7zX0ZmVuHK0YgX1co9CdzT+QbCKJcGbEGZjQl2eXzVvMuY8P/1aTWE3NnXevdVbylJ2C6iXWh5BOagp9hpm5MVpGzCwU2mLjMewluFHpTDsQUfpvjEg+IdJTzXbAjzTE2bROV/xvyGrC1EXewoevhZBD59Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710114966; c=relaxed/simple;
	bh=Yoz7vyXQjE5UxlSJlr9TyMpfr1WYINLnMFLNfcfdSBA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YsjqBQKCE/QQRt+md4wi1/snkLUT6pnxXczScyiEdAU+n4z2NbrYeuYgX5X6y65Uz8fgG6Jk7oTRNLGKF826VqL2eMogdxxb4ctv6WzMePHzMH2DNQW6YZr3g9hH9vHyctyTxCVKiRdDdX56GCIPip00oCa8f7VeYwaBIjAa8xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=bHBxjoqx; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="bHBxjoqx"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-29c07fac7a4so148228a91.1
        for <linux-staging@lists.linux.dev>; Sun, 10 Mar 2024 16:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1710114964; x=1710719764; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBEMlnbFodhUGo6oxESS68T4iON/CdBhosdLVyFF1rE=;
        b=bHBxjoqxqO0xvrNS0QbLYJOTAaq4Ol3/1SlsfW0rfJs15XwB8JVpeVTpFm7mUC7t4+
         9/JpoJ/IhBHYOL/HiCgW/h5IwbY1LBGBcsD0hwuQowFe4Szth2DSjq8unaDCuPE2efJM
         NoNqjmtRfAD9yB2NeaslZtlbHQf7TGAulgWz+40Q6y6uc0eAayWxEikOS8i60XpZP8QO
         Rbq3MpQsn5qcB2HyN6iQD5Vp9Q1cG2iOAGkIPgw551AdfXhytVhKF3TXYMl29Ndp1Czj
         oY0YDdlFQ0kUz8qJFnjJH2EyYvytpgx7xRmj7Ifr2zrd+EcKiefbHmtTM5dqKDuSSAqo
         TkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710114964; x=1710719764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mBEMlnbFodhUGo6oxESS68T4iON/CdBhosdLVyFF1rE=;
        b=ST4a6vqNvmj1dAX1mYFa3vKnkUUa35pFA+u2YWaulTamnKS1BHACAQvBn5cz827YXe
         y/zZJ43lLcx3d3JdaXw9YdYIYs4TWo8BpIRAzvKe89SwCwJsVpeuaR6YfY8EqbSEqxjo
         DUrLzktHjYtcmD8dIWFhVX9QEp3IOp5fFGTKOM1Pny6TN1QRCQ2SlcLm+1ADtsRAYrMR
         TDe4/cbMIuONaqnonU7LXZEoR0GR1WqBJLvINmYgTr8tTs1QGBZwwrKEbdJnrTRmeqxq
         s4hAp+vvpBcG8wYcML8CZwLLjdHBW1qAZ/FwiYyCUL9lwXmLgknMSFK9CLv0LAkEVAC9
         h2qw==
X-Gm-Message-State: AOJu0Yz8k7sJ5FZCm1LwmLWJ+qt8BZ4qhnru468OEBTOgY2RMsAZenq8
	0a8Z7uQDt+x3Rh1iXNbr4iF+ZX95qFcR4X4CEWnLiSkBOMcl0pZrxwfapxsIPGg=
X-Google-Smtp-Source: AGHT+IHuUX/u1Kb6N1OPq8+HSb3c5l+qN8ReWr/b4PeYFNuVg2G8eJDP/4OnjDW/EuboilYEgI/jfQ==
X-Received: by 2002:a17:90a:69a5:b0:29a:f199:1647 with SMTP id s34-20020a17090a69a500b0029af1991647mr7821537pjj.1.1710114964303;
        Sun, 10 Mar 2024 16:56:04 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id o7-20020a17090ac08700b0029bb29ef41bsm2903439pjs.50.2024.03.10.16.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 16:56:03 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 11/11] Staging: rtl8192e: Implement BIT macro for bit shift ops
Date: Sun, 10 Mar 2024 16:55:52 -0700
Message-Id: <20240310235552.4217-12-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240310235552.4217-1-tdavies@darkphysics.net>
References: <20240310235552.4217-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace bit shift operations with BIT macro, to fix warning
CHECK: Prefer using the BIT macro

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h | 62 +++++++++++++++----------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 0809af3fd041..5c00d663193f 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -419,19 +419,19 @@ enum _REG_PREAMBLE_MODE {
 #define WLAN_AUTH_SHARED_KEY 1
 #define WLAN_AUTH_LEAP 128
 
-#define WLAN_CAPABILITY_ESS (1<<0)
-#define WLAN_CAPABILITY_IBSS (1<<1)
-#define WLAN_CAPABILITY_PRIVACY (1<<4)
-#define WLAN_CAPABILITY_SHORT_PREAMBLE (1<<5)
-#define WLAN_CAPABILITY_SHORT_SLOT_TIME (1<<10)
-
-#define RTLLIB_STATMASK_SIGNAL (1<<0)
-#define RTLLIB_STATMASK_RSSI (1<<1)
-#define RTLLIB_STATMASK_NOISE (1<<2)
+#define WLAN_CAPABILITY_ESS BIT(0)
+#define WLAN_CAPABILITY_IBSS BIT(1)
+#define WLAN_CAPABILITY_PRIVACY BIT(4)
+#define WLAN_CAPABILITY_SHORT_PREAMBLE BIT(5)
+#define WLAN_CAPABILITY_SHORT_SLOT_TIME BIT(10)
+
+#define RTLLIB_STATMASK_SIGNAL BIT(0)
+#define RTLLIB_STATMASK_RSSI BIT(1)
+#define RTLLIB_STATMASK_NOISE BIT(2)
 #define RTLLIB_STATMASK_WEMASK 0x7
 
-#define RTLLIB_CCK_MODULATION    (1<<0)
-#define RTLLIB_OFDM_MODULATION   (1<<1)
+#define RTLLIB_CCK_MODULATION    BIT(0)
+#define RTLLIB_OFDM_MODULATION   BIT(1)
 
 #define RTLLIB_CCK_RATE_LEN		4
 #define RTLLIB_CCK_RATE_1MB			0x02
@@ -518,11 +518,11 @@ struct rtllib_frag_entry {
 
 struct rtllib_device;
 
-#define SEC_ACTIVE_KEY    (1<<4)
-#define SEC_AUTH_MODE     (1<<5)
-#define SEC_UNICAST_GROUP (1<<6)
-#define SEC_LEVEL	 (1<<7)
-#define SEC_ENABLED       (1<<8)
+#define SEC_ACTIVE_KEY    BIT(4)
+#define SEC_AUTH_MODE     BIT(5)
+#define SEC_UNICAST_GROUP BIT(6)
+#define SEC_LEVEL	 BIT(7)
+#define SEC_ENABLED       BIT(8)
 
 #define SEC_LEVEL_0      0 /* None */
 #define SEC_LEVEL_1      1 /* WEP 40 and 104 bit */
@@ -707,17 +707,17 @@ union frameqos {
 #define MAX_WPA_IE_LEN 64
 #define MAX_WZC_IE_LEN 256
 
-#define NETWORK_EMPTY_ESSID (1<<0)
-#define NETWORK_HAS_OFDM    (1<<1)
-#define NETWORK_HAS_CCK     (1<<2)
+#define NETWORK_EMPTY_ESSID BIT(0)
+#define NETWORK_HAS_OFDM    BIT(1)
+#define NETWORK_HAS_CCK     BIT(2)
 
 /* QoS structure */
-#define NETWORK_HAS_QOS_PARAMETERS      (1<<3)
-#define NETWORK_HAS_QOS_INFORMATION     (1<<4)
+#define NETWORK_HAS_QOS_PARAMETERS      BIT(3)
+#define NETWORK_HAS_QOS_INFORMATION     BIT(4)
 #define NETWORK_HAS_QOS_MASK	    (NETWORK_HAS_QOS_PARAMETERS | \
 					 NETWORK_HAS_QOS_INFORMATION)
 /* 802.11h */
-#define NETWORK_HAS_ERP_VALUE	   (1<<10)
+#define NETWORK_HAS_ERP_VALUE	   BIT(10)
 
 #define QOS_QUEUE_NUM		   4
 #define QOS_OUI_LEN		     3
@@ -1007,8 +1007,8 @@ enum rtl_link_state {
 #define DEFAULT_MAX_SCAN_AGE (15 * HZ)
 #define DEFAULT_FTS 2346
 
-#define CFG_RTLLIB_RESERVE_FCS (1<<0)
-#define CFG_RTLLIB_COMPUTE_FCS (1<<1)
+#define CFG_RTLLIB_RESERVE_FCS BIT(0)
+#define CFG_RTLLIB_COMPUTE_FCS BIT(1)
 
 struct tx_pending {
 	int frag;
@@ -1497,32 +1497,32 @@ struct rtllib_device {
 /* Uses the channel change callback directly
  * instead of [start/stop] scan callbacks
  */
-#define IEEE_SOFTMAC_SCAN (1<<2)
+#define IEEE_SOFTMAC_SCAN BIT(2)
 
 /* Perform authentication and association handshake */
-#define IEEE_SOFTMAC_ASSOCIATE (1<<3)
+#define IEEE_SOFTMAC_ASSOCIATE BIT(3)
 
 /* Generate probe requests */
-#define IEEE_SOFTMAC_PROBERQ (1<<4)
+#define IEEE_SOFTMAC_PROBERQ BIT(4)
 
 /* Generate response to probe requests */
-#define IEEE_SOFTMAC_PROBERS (1<<5)
+#define IEEE_SOFTMAC_PROBERS BIT(5)
 
 /* The ieee802.11 stack will manage the netif queue
  * wake/stop for the driver, taking care of 802.11
  * fragmentation. See softmac.c for details.
  */
-#define IEEE_SOFTMAC_TX_QUEUE (1<<7)
+#define IEEE_SOFTMAC_TX_QUEUE BIT(7)
 
 /* Uses only the softmac_data_hard_start_xmit
  * even for TX management frames.
  */
-#define IEEE_SOFTMAC_SINGLE_QUEUE (1<<8)
+#define IEEE_SOFTMAC_SINGLE_QUEUE BIT(8)
 
 /* Generate beacons.  The stack will enqueue beacons
  * to the card
  */
-#define IEEE_SOFTMAC_BEACONS (1<<6)
+#define IEEE_SOFTMAC_BEACONS BIT(6)
 
 static inline void *rtllib_priv(struct net_device *dev)
 {
-- 
2.30.2

