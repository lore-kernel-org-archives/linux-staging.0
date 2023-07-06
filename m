Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA087F
	for <linux-staging@lists.linux.dev>; Thu,  6 Jul 2023 02:13:52 +0000 (UTC)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id D41943587A;
	Wed,  5 Jul 2023 22:11:26 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=date:from
	:to:cc:subject:message-id:mime-version:content-type; s=sasl; bh=
	dSl4DkD4FZzj44yjnUm+36Ptc1v3LHeAeOXXQZIN4tg=; b=q55AfFZzzkAqskpu
	2DqJ+2S9SydwFtd0RQyMq/qkEu+TIHRogWc+LCobCEPaPhWCaIzVoV/AZLeJE+Yt
	g/RRQz7zmPbeMWL6aapS4zR3BIV/lL4tNWqKN1BonMOPNwH+q7+vIiRGGGeyiUcf
	PvWSZ8NMadyOaSPTvtZWFfyOYRU=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id CAB3A35879;
	Wed,  5 Jul 2023 22:11:26 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=darkphysics.net;
 h=date:from:to:cc:subject:message-id:mime-version:content-type;
 s=2019-09.pbsmtp; bh=dSl4DkD4FZzj44yjnUm+36Ptc1v3LHeAeOXXQZIN4tg=;
 b=o3PrM7/Ms69qGX0q2+HRuh6Xlohu3cPC0OjO0Us3UrwoJuKJsZCzf6ZMb9Z41MtjiEi+5LeRHlLUzgaU5TYcYFvwhBBFSlMbASRWetyV/LC8bkUKRAlB3NvTbPmpcFSXtoyadId948aas1hkRL0kujBx+krl1ib71GVS+wD7Z4E=
Received: from kimchi.darkphysics (unknown [76.146.178.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 5355635878;
	Wed,  5 Jul 2023 22:11:23 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
Date: Wed, 5 Jul 2023 19:11:15 -0700
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	dan.carpenter@linaro.org
Cc: tdavies@darkphysics.net, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192e: Rename variable bRegBW40MHz
Message-ID: <ZKYiwwJJxv6Wk1/8@kimchi.darkphysics>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Pobox-Relay-ID:
 67BC9C00-1BA2-11EE-AA33-C2DA088D43B2-45285927!pb-smtp20.pobox.com

This patch renames variable bRegBW40MHz to breg_bw_40MHz
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     |  2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 2bbd01048561..afe27a022134 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -94,7 +94,7 @@ enum ht_aggre_mode {
 struct rt_hi_throughput {
 	u8 enable_ht;
 	u8 bCurrentHTSupport;
-	u8 bRegBW40MHz;
+	u8 breg_bw_40MHz;
 	u8 bCurBW40MHz;
 	u8 bRegShortGI40MHz;
 	u8 bCurShortGI40MHz;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index f9fa3f2bb728..3fe98672b648 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -74,9 +74,9 @@ void HTUpdateDefaultSetting(struct rtllib_device *ieee)
 	ht_info->bRegShortGI20MHz = 1;
 	ht_info->bRegShortGI40MHz = 1;
 
-	ht_info->bRegBW40MHz = 1;
+	ht_info->breg_bw_40MHz = 1;
 
-	if (ht_info->bRegBW40MHz)
+	if (ht_info->breg_bw_40MHz)
 		ht_info->bRegSuppCCK = 1;
 	else
 		ht_info->bRegSuppCCK = true;
@@ -296,7 +296,7 @@ void HTConstructCapabilityElement(struct rtllib_device *ieee, u8 *posHTCap,
 	if (ieee->GetHalfNmodeSupportByAPsHandler(ieee->dev))
 		pCapELE->ChlWidth = 0;
 	else
-		pCapELE->ChlWidth = (pHT->bRegBW40MHz ? 1 : 0);
+		pCapELE->ChlWidth = (pHT->breg_bw_40MHz ? 1 : 0);
 
 	pCapELE->MimoPwrSave		= pHT->self_mimo_ps;
 	pCapELE->GreenField		= 0;
@@ -307,7 +307,7 @@ void HTConstructCapabilityElement(struct rtllib_device *ieee, u8 *posHTCap,
 	pCapELE->RxSTBC			= 0;
 	pCapELE->DelayBA		= 0;
 	pCapELE->MaxAMSDUSize = (MAX_RECEIVE_BUFFER_SIZE >= 7935) ? 1 : 0;
-	pCapELE->DssCCk = ((pHT->bRegBW40MHz) ? (pHT->bRegSuppCCK ? 1 : 0) : 0);
+	pCapELE->DssCCk = ((pHT->breg_bw_40MHz) ? (pHT->bRegSuppCCK ? 1 : 0) : 0);
 	pCapELE->PSMP = 0;
 	pCapELE->LSigTxopProtect = 0;
 
@@ -366,12 +366,12 @@ void HTConstructInfoElement(struct rtllib_device *ieee, u8 *posHTInfo,
 	if ((ieee->iw_mode == IW_MODE_ADHOC) ||
 	    (ieee->iw_mode == IW_MODE_MASTER)) {
 		pHTInfoEle->ControlChl	= ieee->current_network.channel;
-		pHTInfoEle->ExtChlOffset = ((!pHT->bRegBW40MHz) ?
+		pHTInfoEle->ExtChlOffset = ((!pHT->breg_bw_40MHz) ?
 					    HT_EXTCHNL_OFFSET_NO_EXT :
 					    (ieee->current_network.channel <= 6)
 					    ? HT_EXTCHNL_OFFSET_UPPER :
 					    HT_EXTCHNL_OFFSET_LOWER);
-		pHTInfoEle->RecommemdedTxWidth	= pHT->bRegBW40MHz;
+		pHTInfoEle->RecommemdedTxWidth	= pHT->breg_bw_40MHz;
 		pHTInfoEle->RIFS			= 0;
 		pHTInfoEle->PSMPAccessOnly		= 0;
 		pHTInfoEle->SrvIntGranularity		= 0;
@@ -778,7 +778,7 @@ void HTUseDefaultSetting(struct rtllib_device *ieee)
 		ht_info->bCurrentHTSupport = true;
 		ht_info->bCurSuppCCK = ht_info->bRegSuppCCK;
 
-		ht_info->bCurBW40MHz = ht_info->bRegBW40MHz;
+		ht_info->bCurBW40MHz = ht_info->breg_bw_40MHz;
 		ht_info->bCurShortGI20MHz = ht_info->bRegShortGI20MHz;
 
 		ht_info->bCurShortGI40MHz = ht_info->bRegShortGI40MHz;
@@ -850,7 +850,7 @@ void HTSetConnectBwMode(struct rtllib_device *ieee,
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 
-	if (!ht_info->bRegBW40MHz)
+	if (!ht_info->breg_bw_40MHz)
 		return;
 
 	if (ieee->GetHalfNmodeSupportByAPsHandler(ieee->dev))
-- 
2.30.2

