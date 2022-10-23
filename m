Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com [136.143.188.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425CC625
	for <linux-staging@lists.linux.dev>; Sun, 23 Oct 2022 09:44:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1666518267; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=U9yM/xor+LnssQ5D2NBqun5ciy82ab08Z20shnq0Zqn+IsVgz6qbrFjQ1SGbA3J/VOprqrphfLaLyCy5kCk40rvt0npH92XKIA2dA8+8azXREr0/1s1iOglYyEX5vRvbQGCzBYefygutE6x1kltuAvhiENrdWRhPg3W7uxGwWWI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1666518267; h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=YWKbAKT1gVY1R5yLoPK5Mf7VaOqbYrwA8RATTU//hyc=; 
	b=eloV8bcN67p9ohcuqYeZ2mzpPX0ZfsKYxxMPUXH9dzutJiaLzG/nQEFbfnDP2me3eQip62BHhP0ESHtqYy5IS3mTQ0oUYoG1H8ltOJp6Ogp5rH60QjQvuQHB2WX84wfINx7YrBO827mhjfziiCq2jYYJ/ob8DV2VXiK7czi9sWc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=t4rmin@zohomail.com;
	dmarc=pass header.from=<t4rmin@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1666518267;
	s=zm2022; d=zohomail.com; i=t4rmin@zohomail.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=YWKbAKT1gVY1R5yLoPK5Mf7VaOqbYrwA8RATTU//hyc=;
	b=YVMetxVF4u27nY2ZxEgDq21dcHcr0oLt+cuup1vyEgFx1pThgmwD8UDQcfl2atbv
	/SuR5nWrVLFO43qAWiDNvrKqDB2XAjvVMToPRomGMFzo/+kZEWYMwPi9G56c+W0TIcH
	mmWeiFYQgI78UpeWEMKLrXzEAa1cKKvJqtpA1qnI=
Received: from plymouth (101.128.127.165 [101.128.127.165]) by mx.zohomail.com
	with SMTPS id 1666518265744813.2213123880294; Sun, 23 Oct 2022 02:44:25 -0700 (PDT)
Date: Sun, 23 Oct 2022 16:44:13 +0700
From: Aaron Lawrence <t4rmin@zohomail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] Staging: rtl8192e: rtl819x_HTProc: fixed alignment
 matching open parenthesis
Message-ID: <98c9e764a4447ab550e5615c48f6a98bf6656b0d.1666502177.git.t4rmin@zohomail.com>
References: <cover.1666502177.git.t4rmin@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1666502177.git.t4rmin@zohomail.com>
X-ZohoMailClient: External

Aligned multiple statements to match open parenthesis as per Linux kernel
coding-style regulations. The issues were flagged by the checkpatch script.

Signed-off-by: Aaron Lawrence <t4rmin@zohomail.com>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 25 ++++++++++++-----------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index b763cf0ba356..a701be8c2923 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -152,8 +152,8 @@ bool IsHTHalfNmodeAPs(struct rtllib_device *ieee)
 	    (net->ralink_cap_exist))
 		retValue = true;
 	else if (!memcmp(net->bssid, UNKNOWN_BORADCOM, 3) ||
-		!memcmp(net->bssid, LINKSYSWRT330_LINKSYSWRT300_BROADCOM, 3) ||
-		!memcmp(net->bssid, LINKSYSWRT350_LINKSYSWRT150_BROADCOM, 3) ||
+		 !memcmp(net->bssid, LINKSYSWRT330_LINKSYSWRT300_BROADCOM, 3) ||
+		 !memcmp(net->bssid, LINKSYSWRT350_LINKSYSWRT150_BROADCOM, 3) ||
 		(net->broadcom_cap_exist))
 		retValue = true;
 	else if (net->bssht.bd_rt2rt_aggregation)
@@ -540,7 +540,7 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 			     pPeerHTCap, sizeof(struct ht_capab_ele));
 #endif
 	HTSetConnectBwMode(ieee, (enum ht_channel_width)(pPeerHTCap->ChlWidth),
-			  (enum ht_extchnl_offset)(pPeerHTInfo->ExtChlOffset));
+			   (enum ht_extchnl_offset)(pPeerHTInfo->ExtChlOffset));
 	pHTInfo->cur_tx_bw40mhz = ((pPeerHTInfo->RecommemdedTxWidth == 1) ?
 				 true : false);
 
@@ -566,9 +566,9 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 
 	pHTInfo->bCurrentAMPDUEnable = pHTInfo->bAMPDUEnable;
 	if (ieee->rtllib_ap_sec_type &&
-	   (ieee->rtllib_ap_sec_type(ieee) & (SEC_ALG_WEP | SEC_ALG_TKIP))) {
+	    (ieee->rtllib_ap_sec_type(ieee) & (SEC_ALG_WEP | SEC_ALG_TKIP))) {
 		if ((pHTInfo->IOTPeer == HT_IOT_PEER_ATHEROS) ||
-				(pHTInfo->IOTPeer == HT_IOT_PEER_UNKNOWN))
+		    (pHTInfo->IOTPeer == HT_IOT_PEER_UNKNOWN))
 			pHTInfo->bCurrentAMPDUEnable = false;
 	}
 
@@ -617,7 +617,8 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 	else
 		pMcsFilter = MCS_FILTER_ALL;
 	ieee->HTHighestOperaRate = HTGetHighestMCSRate(ieee,
-				   ieee->dot11HTOperationalRateSet, pMcsFilter);
+						       ieee->dot11HTOperationalRateSet,
+						       pMcsFilter);
 	ieee->HTCurrentOperaRate = ieee->HTHighestOperaRate;
 
 	pHTInfo->current_op_mode = pPeerHTInfo->OptMode;
@@ -644,13 +645,13 @@ void HTInitializeHTInfo(struct rtllib_device *ieee)
 	pHTInfo->CurrentAMPDUFactor = pHTInfo->AMPDU_Factor;
 
 	memset((void *)(&(pHTInfo->SelfHTCap)), 0,
-		sizeof(pHTInfo->SelfHTCap));
+	       sizeof(pHTInfo->SelfHTCap));
 	memset((void *)(&(pHTInfo->SelfHTInfo)), 0,
-		sizeof(pHTInfo->SelfHTInfo));
+	       sizeof(pHTInfo->SelfHTInfo));
 	memset((void *)(&(pHTInfo->PeerHTCapBuf)), 0,
-		sizeof(pHTInfo->PeerHTCapBuf));
+	       sizeof(pHTInfo->PeerHTCapBuf));
 	memset((void *)(&(pHTInfo->PeerHTInfoBuf)), 0,
-		sizeof(pHTInfo->PeerHTInfoBuf));
+	       sizeof(pHTInfo->PeerHTInfoBuf));
 
 	pHTInfo->sw_bw_in_progress = false;
 
@@ -803,8 +804,8 @@ void HTUseDefaultSetting(struct rtllib_device *ieee)
 		HTFilterMCSRate(ieee, ieee->Regdot11TxHTOperationalRateSet,
 				ieee->dot11HTOperationalRateSet);
 		ieee->HTHighestOperaRate = HTGetHighestMCSRate(ieee,
-					   ieee->dot11HTOperationalRateSet,
-					   MCS_FILTER_ALL);
+							       ieee->dot11HTOperationalRateSet,
+							       MCS_FILTER_ALL);
 		ieee->HTCurrentOperaRate = ieee->HTHighestOperaRate;
 
 	} else {
-- 
2.38.1

