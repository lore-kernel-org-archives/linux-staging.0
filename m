Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F151020EA
	for <linux-staging@lists.linux.dev>; Fri, 16 Sep 2022 03:07:52 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=momi.ca; s=key1;
	t=1663297665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Jh0ugHIzU1ssKWGRd6CmYhecjCNbV/ZWfBZL0gM5nKY=;
	b=ABw6TJ32Z6tvZ5enyMzb4lCl2hEWUTh+ULxZtgbnsDkMAOxlkXs3zh6uwIzE9cH5GoAy41
	4DFjSFO+YkRrdS74RlUaSiAj4SWmErboNBKHhsbitg061/u4J995b2NfMEJ7nNn1WdWGRS
	fBDI+pQPl1l8n/CC3mEScbxlG3VcMDQ5liAOUuOAKir2iJIiNh0z7qQO6mhJ0CTL/RQm4L
	J8t/0XWlMv2bItwArQnYLn9hRsTML0eAQ9Ta6itNviCP9dtfmfRVQtoFi3U9iWfQ/3asct
	P4dfQunOuHJGC1PjSDq5XW0b0blU/REP1mwUXuVpM9/9U8wvQzRc3lS2xw+bGA==
From: Anjandev Momi <anjan@momi.ca>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Anjandev Momi <anjan@momi.ca>
Subject: [PATCH] Staging: rtl8192e: fixed brace, space, and align coding style issues
Date: Thu, 15 Sep 2022 23:06:55 -0400
Message-Id: <20220916030655.11105-1-anjan@momi.ca>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: momi.ca

After applying this patch, file drivers/staging/rtl8192e/rtl819x_BAProc.c only
has "Avoid CamelCase" coding style issue

Signed-off-by: Anjandev Momi <anjan@momi.ca>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 7d04966af..b4e565af1 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -62,6 +62,7 @@ void ResetBaEntry(struct ba_record *pBA)
 	pBA->dialog_token		  = 0;
 	pBA->ba_start_seq_ctrl.short_data = 0;
 }
+
 static struct sk_buff *rtllib_ADDBA(struct rtllib_device *ieee, u8 *Dst,
 				    struct ba_record *pBA,
 				    u16 StatusCode, u8 type)
@@ -113,7 +114,7 @@ static struct sk_buff *rtllib_ADDBA(struct rtllib_device *ieee, u8 *Dst,
 	tag += 2;
 
 	if (type == ACT_ADDBAREQ) {
-		memcpy(tag, (u8 *)&(pBA->ba_start_seq_ctrl), 2);
+		memcpy(tag, (u8 *)&pBA->ba_start_seq_ctrl, 2);
 		tag += 2;
 	}
 
@@ -161,7 +162,6 @@ static struct sk_buff *rtllib_DELBA(struct rtllib_device *ieee, u8 *dst,
 	*tag++ = ACT_CAT_BA;
 	*tag++ = ACT_DELBA;
 
-
 	put_unaligned_le16(DelbaParamSet.short_data, tag);
 	tag += 2;
 
@@ -258,8 +258,8 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 			    ieee->pHTInfo->bCurrentHTSupport);
 		goto OnADDBAReq_Fail;
 	}
-	if (!GetTs(ieee, (struct ts_common_info **)(&pTS), dst,
-	    (u8)(pBaParamSet->field.tid), RX_DIR, true)) {
+	if (!GetTs(ieee, (struct ts_common_info **)(&pTS),
+		   dst, (u8)(pBaParamSet->field.tid), RX_DIR, true)) {
 		rc = ADDBA_STATUS_REFUSED;
 		netdev_warn(ieee->dev, "%s(): can't get TS\n", __func__);
 		goto OnADDBAReq_Fail;
@@ -282,7 +282,7 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 	pBA->ba_start_seq_ctrl = *pBaStartSeqCtrl;
 
 	if (ieee->GetHalfNmodeSupportByAPsHandler(ieee->dev) ||
-	   (ieee->pHTInfo->IOTAction & HT_IOT_ACT_ALLOW_PEER_AGG_ONE_PKT))
+	    (ieee->pHTInfo->IOTAction & HT_IOT_ACT_ALLOW_PEER_AGG_ONE_PKT))
 		pBA->ba_param_set.field.buffer_size = 1;
 	else
 		pBA->ba_param_set.field.buffer_size = 32;
@@ -380,7 +380,6 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 			goto OnADDBARsp_Reject;
 		}
 
-
 		pAdmittedBA->dialog_token = *pDialogToken;
 		pAdmittedBA->ba_timeout_value = *pBaTimeoutVal;
 		pAdmittedBA->ba_start_seq_ctrl = pPendingBA->ba_start_seq_ctrl;
@@ -419,8 +418,7 @@ int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb)
 		return -1;
 	}
 
-	if (!ieee->current_network.qos_data.active ||
-		!ieee->pHTInfo->bCurrentHTSupport) {
+	if (!ieee->current_network.qos_data.active || !ieee->pHTInfo->bCurrentHTSupport) {
 		netdev_warn(ieee->dev,
 			    "received DELBA while QOS or HT is not supported(%d, %d)\n",
 			    ieee->current_network. qos_data.active,
@@ -440,7 +438,7 @@ int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb)
 		struct rx_ts_record *pRxTs;
 
 		if (!GetTs(ieee, (struct ts_common_info **)&pRxTs, dst,
-		    (u8)pDelBaParamSet->field.tid, RX_DIR, false)) {
+			   (u8)pDelBaParamSet->field.tid, RX_DIR, false)) {
 			netdev_warn(ieee->dev,
 				    "%s(): can't get TS for RXTS. dst:%pM TID:%d\n",
 				    __func__, dst,
-- 
2.36.2

