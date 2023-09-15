Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB0711CA0
	for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 16:07:13 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4046f7d49a9so5747665e9.1
        for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 09:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694794032; x=1695398832; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8MAQysHswzKdSn6dt98Oe4Oe6j9LPER8jfsz6Ld6Vfw=;
        b=NQuQEPNs/i3iaUZUTofu92ONjGNLQ+C3MXViBcls/Fl9lyPvT8BNzPspZYTk40qTL9
         UcmFEp5Rcp/ZjP5daOg493axytw+eJHV/MCZ279i0ob7Wr5OLVPjzEwLH+Ko20fT0W85
         mm2kukZ92Y70K4bJn4UYBFNxYUyovTJE3Cy+JtUX/irqI2FKKfUkw4DOyCp+0ul3MS1j
         PNUYVR33cymfMdHOexe4mI9guVFbYlYgCYJnnJUuKP6cD05EGz606iAs3FrOTcY9iqOg
         PSg/AuCO8skqrcdoRB5zo5RtADQVh8+jJBo+BDMFgLeiI4ZBW55n9ILvEzMOu3vswhlZ
         6q+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694794032; x=1695398832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8MAQysHswzKdSn6dt98Oe4Oe6j9LPER8jfsz6Ld6Vfw=;
        b=MCJI/up7baNhPJEmwqQluhAIhozzjIUBd5EzCkr+gfieduBqWYixjBbawZcD8agj9r
         tk4Hni2Yrk/iEG4v84N7EzWz3ICfi7FkT3AzdiYFmopxIhXy5E3VqcdsndSX9o4QeLFN
         SHAV/qeyVzKSazFCdGbZbPKA+Rz1pU70oMhinulAOreLwXMR14gFTvta20PjOMZ6VjFP
         ACE6xPPJIWZRDJVmnZAjXa+uhVq9M3EsDSS1+jgKKjQwFoPQfQns8TBLurbtOSt5WVYI
         6afcILL4hf7xRbxiqqfMe/Sm+8Eo5/UhN8kO1pbc2iewER4itmotbpt7HqJKbrtbnci7
         VoBw==
X-Gm-Message-State: AOJu0YwV3M5ncW9k6eGXE+KWS3KS8zQbP6o/i/5ZFL1KaIhUetqeaClt
	zR2w4RBjEiUKHdqismUONVg=
X-Google-Smtp-Source: AGHT+IFXqQzfmj5OEscy8clergs2nxHr2/MUqe9l2wpq9rBBOsyxjQVYLVGx0v6OtsmKK87tSUG8wQ==
X-Received: by 2002:a05:6000:1047:b0:31f:a096:6e18 with SMTP id c7-20020a056000104700b0031fa0966e18mr1761609wrx.6.1694794032054;
        Fri, 15 Sep 2023 09:07:12 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id z4-20020a5d4c84000000b003197c7d08ddsm4759614wrs.71.2023.09.15.09.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 09:07:11 -0700 (PDT)
Date: Fri, 15 Sep 2023 18:07:10 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 03/16] staging: rtl8192e: Replace struct rtllib_hdr_3addr in
 rtl819x_BAProc.c
Message-ID: <aa6d81b6a8bc0f126d174ccbee25fd93d072fa59.1694792595.git.philipp.g.hortmann@gmail.com>
References: <cover.1694792595.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1694792595.git.philipp.g.hortmann@gmail.com>

Replace struct rtllib_hdr_3addr with struct ieee80211_hdr_3addr to avoid
proprietary struct.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 48 +++++++++++------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index bc6f9e8c5dd8..4cadbf549933 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -68,7 +68,7 @@ static struct sk_buff *rtllib_ADDBA(struct rtllib_device *ieee, u8 *Dst,
 				    u16 StatusCode, u8 type)
 {
 	struct sk_buff *skb = NULL;
-	struct rtllib_hdr_3addr *BAReq = NULL;
+	struct ieee80211_hdr_3addr *BAReq = NULL;
 	u8 *tag = NULL;
 	u16 len = ieee->tx_headroom + 9;
 
@@ -79,21 +79,21 @@ static struct sk_buff *rtllib_ADDBA(struct rtllib_device *ieee, u8 *Dst,
 		netdev_warn(ieee->dev, "pBA is NULL\n");
 		return NULL;
 	}
-	skb = dev_alloc_skb(len + sizeof(struct rtllib_hdr_3addr));
+	skb = dev_alloc_skb(len + sizeof(struct ieee80211_hdr_3addr));
 	if (!skb)
 		return NULL;
 
-	memset(skb->data, 0, sizeof(struct rtllib_hdr_3addr));
+	memset(skb->data, 0, sizeof(struct ieee80211_hdr_3addr));
 
 	skb_reserve(skb, ieee->tx_headroom);
 
-	BAReq = skb_put(skb, sizeof(struct rtllib_hdr_3addr));
+	BAReq = skb_put(skb, sizeof(struct ieee80211_hdr_3addr));
 
 	ether_addr_copy(BAReq->addr1, Dst);
 	ether_addr_copy(BAReq->addr2, ieee->dev->dev_addr);
 
 	ether_addr_copy(BAReq->addr3, ieee->current_network.bssid);
-	BAReq->frame_ctl = cpu_to_le16(RTLLIB_STYPE_MANAGE_ACT);
+	BAReq->frame_control = cpu_to_le16(RTLLIB_STYPE_MANAGE_ACT);
 
 	tag = skb_put(skb, 9);
 	*tag++ = ACT_CAT_BA;
@@ -129,7 +129,7 @@ static struct sk_buff *rtllib_DELBA(struct rtllib_device *ieee, u8 *dst,
 {
 	union delba_param_set DelbaParamSet;
 	struct sk_buff *skb = NULL;
-	struct rtllib_hdr_3addr *Delba = NULL;
+	struct ieee80211_hdr_3addr *Delba = NULL;
 	u8 *tag = NULL;
 	u16 len = 6 + ieee->tx_headroom;
 
@@ -142,18 +142,18 @@ static struct sk_buff *rtllib_DELBA(struct rtllib_device *ieee, u8 *dst,
 	DelbaParamSet.field.initiator = (TxRxSelect == TX_DIR) ? 1 : 0;
 	DelbaParamSet.field.tid	= pBA->ba_param_set.field.tid;
 
-	skb = dev_alloc_skb(len + sizeof(struct rtllib_hdr_3addr));
+	skb = dev_alloc_skb(len + sizeof(struct ieee80211_hdr_3addr));
 	if (!skb)
 		return NULL;
 
 	skb_reserve(skb, ieee->tx_headroom);
 
-	Delba = skb_put(skb, sizeof(struct rtllib_hdr_3addr));
+	Delba = skb_put(skb, sizeof(struct ieee80211_hdr_3addr));
 
 	ether_addr_copy(Delba->addr1, dst);
 	ether_addr_copy(Delba->addr2, ieee->dev->dev_addr);
 	ether_addr_copy(Delba->addr3, ieee->current_network.bssid);
-	Delba->frame_ctl = cpu_to_le16(RTLLIB_STYPE_MANAGE_ACT);
+	Delba->frame_control = cpu_to_le16(RTLLIB_STYPE_MANAGE_ACT);
 
 	tag = skb_put(skb, 6);
 
@@ -213,7 +213,7 @@ static void rtllib_send_DELBA(struct rtllib_device *ieee, u8 *dst,
 
 int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 {
-	struct rtllib_hdr_3addr *req = NULL;
+	struct ieee80211_hdr_3addr *req = NULL;
 	u16 rc = 0;
 	u8 *dst = NULL, *pDialogToken = NULL, *tag = NULL;
 	struct ba_record *pBA = NULL;
@@ -222,10 +222,10 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 	union sequence_control *pBaStartSeqCtrl = NULL;
 	struct rx_ts_record *ts = NULL;
 
-	if (skb->len < sizeof(struct rtllib_hdr_3addr) + 9) {
+	if (skb->len < sizeof(struct ieee80211_hdr_3addr) + 9) {
 		netdev_warn(ieee->dev, "Invalid skb len in BAREQ(%d / %d)\n",
 			    (int)skb->len,
-			    (int)(sizeof(struct rtllib_hdr_3addr) + 9));
+			    (int)(sizeof(struct ieee80211_hdr_3addr) + 9));
 		return -1;
 	}
 
@@ -234,10 +234,10 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 			     skb->data, skb->len);
 #endif
 
-	req = (struct rtllib_hdr_3addr *)skb->data;
+	req = (struct ieee80211_hdr_3addr *)skb->data;
 	tag = (u8 *)req;
 	dst = (u8 *)(&req->addr2[0]);
-	tag += sizeof(struct rtllib_hdr_3addr);
+	tag += sizeof(struct ieee80211_hdr_3addr);
 	pDialogToken = tag + 2;
 	pBaParamSet = (union ba_param_set *)(tag + 3);
 	pBaTimeoutVal = (u16 *)(tag + 5);
@@ -302,7 +302,7 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 
 int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 {
-	struct rtllib_hdr_3addr *rsp = NULL;
+	struct ieee80211_hdr_3addr *rsp = NULL;
 	struct ba_record *pPendingBA, *pAdmittedBA;
 	struct tx_ts_record *pTS = NULL;
 	u8 *dst = NULL, *pDialogToken = NULL, *tag = NULL;
@@ -310,16 +310,16 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 	union ba_param_set *pBaParamSet = NULL;
 	u16			ReasonCode;
 
-	if (skb->len < sizeof(struct rtllib_hdr_3addr) + 9) {
+	if (skb->len < sizeof(struct ieee80211_hdr_3addr) + 9) {
 		netdev_warn(ieee->dev, "Invalid skb len in BARSP(%d / %d)\n",
 			    (int)skb->len,
-			    (int)(sizeof(struct rtllib_hdr_3addr) + 9));
+			    (int)(sizeof(struct ieee80211_hdr_3addr) + 9));
 		return -1;
 	}
-	rsp = (struct rtllib_hdr_3addr *)skb->data;
+	rsp = (struct ieee80211_hdr_3addr *)skb->data;
 	tag = (u8 *)rsp;
 	dst = (u8 *)(&rsp->addr2[0]);
-	tag += sizeof(struct rtllib_hdr_3addr);
+	tag += sizeof(struct ieee80211_hdr_3addr);
 	pDialogToken = tag + 2;
 	pStatusCode = (u16 *)(tag + 3);
 	pBaParamSet = (union ba_param_set *)(tag + 5);
@@ -401,14 +401,14 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 
 int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb)
 {
-	struct rtllib_hdr_3addr *delba = NULL;
+	struct ieee80211_hdr_3addr *delba = NULL;
 	union delba_param_set *pDelBaParamSet = NULL;
 	u8 *dst = NULL;
 
-	if (skb->len < sizeof(struct rtllib_hdr_3addr) + 6) {
+	if (skb->len < sizeof(struct ieee80211_hdr_3addr) + 6) {
 		netdev_warn(ieee->dev, "Invalid skb len in DELBA(%d / %d)\n",
 			    (int)skb->len,
-			    (int)(sizeof(struct rtllib_hdr_3addr) + 6));
+			    (int)(sizeof(struct ieee80211_hdr_3addr) + 6));
 		return -1;
 	}
 
@@ -425,9 +425,9 @@ int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb)
 	print_hex_dump_bytes("%s: ", DUMP_PREFIX_NONE, skb->data,
 			     __func__, skb->len);
 #endif
-	delba = (struct rtllib_hdr_3addr *)skb->data;
+	delba = (struct ieee80211_hdr_3addr *)skb->data;
 	dst = (u8 *)(&delba->addr2[0]);
-	pDelBaParamSet = (union delba_param_set *)&delba->payload[2];
+	pDelBaParamSet = (union delba_param_set *)&delba->seq_ctrl + 2;
 
 	if (pDelBaParamSet->field.initiator == 1) {
 		struct rx_ts_record *ts;
-- 
2.42.0

