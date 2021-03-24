Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0531E6F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:45:05 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id x16so24301294wrn.4
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZYz/QIXXPK5G58ttbIZesqCGkx23FI63FRsBpHzFDqQ=;
        b=bGCuvRkd5mO4ZDhjaqI5jr/wz5xTskJsBdY3f8Jgjxw9g2ZjwMT3LI4cAouqW8V2BO
         AQQdEMTPDhFH7cRFEDNfNrDfu0B9KxBu/DrR1KdznEousaFYx4ke/1lXdUNneyYmT0uU
         hyQMJ81pS6WLWaMOACc7Y10rfqBVTegxHWoh9nA3bBN1BUaUPG5IL8FETBRB9xfkZWzI
         fxJJY3GWWgfm1HsOksE8cVS1UV1XydhQbRV47O9D0myLauDYrPRy/4YdLJaDjaRjHYWQ
         t2hu9WNzecBEcg23ocxlsqZP+k2kiT+ZrUNneXpEATzpW+Eo85PlXomO+JQM7SMH0clo
         KvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZYz/QIXXPK5G58ttbIZesqCGkx23FI63FRsBpHzFDqQ=;
        b=P+KG60bKCNugR0mx2aNC4qG8eLo+sylMDMYTcQsityjG9Zoy9To1dQijS8uf5xZQb+
         CbuIasNC/8CnZvWfxEvUWVEy/lXEz7aB5HQ+4UuOQCjRehqVn67Kj6r0HfvuyxSAJQdY
         kGhBHxF2mXZffwIoutR0Z0dRBZ01zvxJoEyCVu9foB6qA8VRf5wtqbAurJx8JKIEPoio
         Uls401nVrHqfA5OLZ4IsBFglY0sVhvTezzSYrsAn5rPZ4hupg8LmVGPevKjlQ/XRZlgA
         nDgsvEmfyuMpeRPf3SK7B0p/afgV9VOYP+p44o7QxCIivXAC2/sb5rB+NmlQNkLMywDH
         HZ/Q==
X-Gm-Message-State: AOAM532xD2n+/jjML1mDMiBcvj2QbZY7aDtQ+wRXQGs+BDU3ZuK0E6ee
	bjiop1lotKA0l0KFO/8Uox8=
X-Google-Smtp-Source: ABdhPJzi1nwPJS2WFeSa/d5UQwE7GLHMjtcku7utGFz7dr8NvR+A/AwJsWc+/4let83mEolU9JslCA==
X-Received: by 2002:adf:8b58:: with SMTP id v24mr3271282wra.160.1616589904556;
        Wed, 24 Mar 2021 05:45:04 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:45:04 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 19/33] Staging: rtl8723bs: remove named enums in rtw_mlme_ext.h
Date: Wed, 24 Mar 2021 13:44:42 +0100
Message-Id: <20210324124456.25221-20-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum names or definitions in
include/rtw_mlme_ext.h:

	enum rt_channel_domain		[name]
	enum rt_channel_domain_2g	[name]
	enum rt_channel_domain_5g	[name]
	enum Associated_AP		[definition]
	enum ht_iot_peer_e		[name]
	enum scan_state			[name]
	enum rtw_c2h_event		[name]

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  | 24 +++++--------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index fb283dc04ee2..e3dce1b2e553 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -115,7 +115,7 @@ extern unsigned char WMM_PARA_OUI[];
 /* 	If you just wnat to customize the acitions(scan period or join actions) about one of the channel plan, */
 /* 	customize them in rt_channel_info in the RT_CHANNEL_LIST. */
 /*  */
-enum rt_channel_domain {
+enum {
 	/*  old channel plan mapping ===== */
 	RT_CHANNEL_DOMAIN_FCC = 0x00,
 	RT_CHANNEL_DOMAIN_IC = 0x01,
@@ -183,7 +183,7 @@ enum rt_channel_domain {
 	RT_CHANNEL_DOMAIN_REALTEK_DEFINE = 0x7F,
 };
 
-enum rt_channel_domain_2g {
+enum {
 	RT_CHANNEL_DOMAIN_2G_WORLD = 0x00,		/* Worldwird 13 */
 	RT_CHANNEL_DOMAIN_2G_ETSI1 = 0x01,		/* Europe */
 	RT_CHANNEL_DOMAIN_2G_FCC1 = 0x02,		/* US */
@@ -195,7 +195,7 @@ enum rt_channel_domain_2g {
 	RT_CHANNEL_DOMAIN_2G_MAX,
 };
 
-enum rt_channel_domain_5g {
+enum {
 	RT_CHANNEL_DOMAIN_5G_NULL = 0x00,
 	RT_CHANNEL_DOMAIN_5G_ETSI1 = 0x01,		/* Europe */
 	RT_CHANNEL_DOMAIN_5G_ETSI2 = 0x02,		/* Australia, New Zealand */
@@ -258,19 +258,7 @@ struct rt_channel_plan_map {
 	unsigned char Index5G;
 };
 
-enum Associated_AP {
-	atherosAP	= 0,
-	broadcomAP	= 1,
-	ciscoAP		= 2,
-	marvellAP	= 3,
-	ralinkAP	= 4,
-	realtekAP	= 5,
-	airgocapAP	= 6,
-	unknownAP	= 7,
-	maxAP,
-};
-
-enum ht_iot_peer_e {
+enum {
 	HT_IOT_PEER_UNKNOWN			= 0,
 	HT_IOT_PEER_REALTEK			= 1,
 	HT_IOT_PEER_REALTEK_92SE		= 2,
@@ -293,7 +281,7 @@ enum ht_iot_peer_e {
 };
 
 
-enum scan_state {
+enum {
 	SCAN_DISABLE = 0,
 	SCAN_START = 1,
 	SCAN_TXNULL = 2,
@@ -787,7 +775,7 @@ struct C2HEvent_Header {
 void rtw_dummy_event_callback(struct adapter *adapter, u8 *pbuf);
 void rtw_fwdbg_event_callback(struct adapter *adapter, u8 *pbuf);
 
-enum rtw_c2h_event {
+enum {
 	GEN_EVT_CODE(_Read_MACREG) = 0, /*0*/
 	GEN_EVT_CODE(_Read_BBREG),
 	GEN_EVT_CODE(_Read_RFREG),
-- 
2.30.2

