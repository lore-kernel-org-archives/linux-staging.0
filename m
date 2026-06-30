Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7293BFAD0
	for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 16:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782837232; cv=none; b=nfMVO97PllWTbssHntnYjg+JaL86LqaFeJIDbg+0WWs462w1gtVxJCfvTVpxsmwhG5pTD6ejxp3GObCspxS3X8gPnRkvZLR8VDxe3JCkJ69aCvr1+CnLefVSTQ0QZGR6qa9HXijwlqqO6ESeKtoXi1nqNwy1sflbQxekyvmYU4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782837232; c=relaxed/simple;
	bh=LEF3z59el0LAH7IB46g5dv01qs2+zCIRMtC9hECqmi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mTBWdy1+0TXscCLoz6V7us/Wn9QM6GXtR02WkeyJL4eW6LntdD2XOx6U6rB/gLnUp3NJUQY3FCeDqgW2MRCEhaCOf5KfDYKbT0GiruPdg93lo7gosa8vnmEEdp90dhBTL+jX3utsYvjPzgJ1PzPnH/cRFQ+O7HwloRgcT6FaPSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=Ji/e/VOG; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="Ji/e/VOG"
Received: from fews03-sea.riseup.net (fews03-sea-pn.riseup.net [10.0.1.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4gqTHK5hTGz9sqs;
	Tue, 30 Jun 2026 16:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1782837229; bh=tGOJjX+5NmqRpr+0fUGQMkVYhK4pjLoSqyQ18x+g3vc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ji/e/VOGrXdmj7LfmO64LAyGo/sPkYLFejozuzCHVyqX41IHQ1URaQtY0jTw1e1cj
	 sc16d2cRUZ70gCQWLijmr7SapsKz6SJjTw9cbefzp61V2SkBCNe6b/78woI28Q1BVA
	 0YpBoPzqRhACnE0vChdx0wbpjuDJQ9DpwZ7BYKl8=
X-Riseup-User-ID: FF1A7D54BDA3BBDFE8C534C5E7CC6C46387B45284324F66C4455820BE79DCF04
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews03-sea.riseup.net (Postfix) with ESMTPSA id 4gqTHK154cz1yRd;
	Tue, 30 Jun 2026 16:33:48 +0000 (UTC)
From: Alonso Garrigues <agarrigues@riseup.net>
To: gregkh@linuxfoundation.org
Cc: guojy.bj@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alonso Garrigues <agarrigues@riseup.net>
Subject: [PATCH 3/6] staging: rtl8723bs: fix lines ending in '(' in rtl8723b_cmd.c
Date: Tue, 30 Jun 2026 17:33:13 +0100
Message-ID: <20260630163316.1128319-4-agarrigues@riseup.net>
In-Reply-To: <20260630163316.1128319-1-agarrigues@riseup.net>
References: <20260630163316.1128319-1-agarrigues@riseup.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align parameters in function calls and definitions with the
opening parentheses to conform to the coding style.

Signed-off-by: Alonso Garrigues <agarrigues@riseup.net>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 99 +++++++++-----------
 1 file changed, 42 insertions(+), 57 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index b99a6a384495..d2dfe6b64067 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -210,16 +210,14 @@ static void ConstructPSPoll(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	*pLength = 16;
 }
 
-static void ConstructNullFunctionData(
-	struct adapter *padapter,
-	u8 *pframe,
-	u32 *pLength,
-	u8 *StaAddr,
-	u8 bQoS,
-	u8 AC,
-	u8 bEosp,
-	u8 bForcePowerSave
-)
+static void ConstructNullFunctionData(struct adapter *padapter,
+				      u8 *pframe,
+				      u32 *pLength,
+				      u8 *StaAddr,
+				      u8 bQoS,
+				      u8 AC,
+				      u8 bEosp,
+				      u8 bForcePowerSave)
 {
 	struct ieee80211_hdr *pwlanhdr;
 	__le16 *fctrl;
@@ -460,9 +458,7 @@ void rtl8723b_set_FwPwrModeInIPS_cmd(struct adapter *padapter, u8 cmd_param)
  * to Hw again and set the length in descriptor to the real beacon length.
  */
 /* 2009.10.15 by tynli. */
-static void rtl8723b_set_FwRsvdPagePkt(
-	struct adapter *padapter, bool bDLFinished
-)
+static void rtl8723b_set_FwRsvdPagePkt(struct adapter *padapter, bool bDLFinished)
 {
 	struct xmit_frame *pcmdframe;
 	struct pkt_attrib *pattrib;
@@ -522,13 +518,12 @@ static void rtl8723b_set_FwRsvdPagePkt(
 
 	/* 3 (3) null data */
 	RsvdPageLoc.LocNullData = TotalPageNum;
-	ConstructNullFunctionData(
-		padapter,
-		&ReservedPagePacket[BufIndex],
-		&NullDataLength,
-		get_my_bssid(&pmlmeinfo->network),
-		false, 0, 0, false
-	);
+	ConstructNullFunctionData(padapter,
+				  &ReservedPagePacket[BufIndex],
+				  &NullDataLength,
+				  get_my_bssid(&pmlmeinfo->network),
+				  false, 0, 0, false);
+
 	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex - TxDescLen], NullDataLength, false, false, false);
 
 	CurtPktPageNum = (u8)PageNum_128(TxDescLen + NullDataLength);
@@ -539,13 +534,12 @@ static void rtl8723b_set_FwRsvdPagePkt(
 
 	/* 3 (5) Qos null data */
 	RsvdPageLoc.LocQosNull = TotalPageNum;
-	ConstructNullFunctionData(
-		padapter,
-		&ReservedPagePacket[BufIndex],
-		&QosNullLength,
-		get_my_bssid(&pmlmeinfo->network),
-		true, 0, 0, false
-	);
+	ConstructNullFunctionData(padapter,
+				  &ReservedPagePacket[BufIndex],
+				  &QosNullLength,
+				  get_my_bssid(&pmlmeinfo->network),
+				  true, 0, 0, false);
+
 	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex - TxDescLen], QosNullLength, false, false, false);
 
 	CurtPktPageNum = (u8)PageNum_128(TxDescLen + QosNullLength);
@@ -556,13 +550,12 @@ static void rtl8723b_set_FwRsvdPagePkt(
 
 	/* 3 (6) BT Qos null data */
 	RsvdPageLoc.LocBTQosNull = TotalPageNum;
-	ConstructNullFunctionData(
-		padapter,
-		&ReservedPagePacket[BufIndex],
-		&BTQosNullLength,
-		get_my_bssid(&pmlmeinfo->network),
-		true, 0, 0, false
-	);
+	ConstructNullFunctionData(padapter,
+				  &ReservedPagePacket[BufIndex],
+				  &BTQosNullLength,
+				  get_my_bssid(&pmlmeinfo->network),
+				  true, 0, 0, false);
+
 	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex - TxDescLen], BTQosNullLength, false, true, false);
 
 	CurtPktPageNum = (u8)PageNum_128(TxDescLen + BTQosNullLength);
@@ -693,12 +686,7 @@ void rtl8723b_set_FwJoinBssRpt_cmd(struct adapter *padapter, u8 mstatus)
 /* arg[1] = raid */
 /* arg[2] = shortGIrate */
 /* arg[3] = init_rate */
-void rtl8723b_Add_RateATid(
-	struct adapter *padapter,
-	u32 bitmap,
-	u8 *arg,
-	u8 rssi_level
-)
+void rtl8723b_Add_RateATid(struct adapter *padapter, u32 bitmap, u8 *arg, u8 rssi_level)
 {
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
@@ -722,16 +710,14 @@ void rtl8723b_Add_RateATid(
 	rtl8723b_set_FwMacIdConfig_cmd(padapter, mac_id, raid, bw, shortGI, mask);
 }
 
-static void ConstructBtNullFunctionData(
-	struct adapter *padapter,
-	u8 *pframe,
-	u32 *pLength,
-	u8 *StaAddr,
-	u8 bQoS,
-	u8 AC,
-	u8 bEosp,
-	u8 bForcePowerSave
-)
+static void ConstructBtNullFunctionData(struct adapter *padapter,
+					u8 *pframe,
+					u32 *pLength,
+					u8 *StaAddr,
+					u8 bQoS,
+					u8 AC,
+					u8 bEosp,
+					u8 bForcePowerSave)
 {
 	struct ieee80211_hdr *pwlanhdr;
 	__le16 *fctrl;
@@ -828,13 +814,12 @@ static void SetFwRsvdPagePkt_BTCoex(struct adapter *padapter)
 
 	/* 3 (6) BT Qos null data */
 	RsvdPageLoc.LocBTQosNull = TotalPageNum;
-	ConstructBtNullFunctionData(
-		padapter,
-		&ReservedPagePacket[BufIndex],
-		&BTQosNullLength,
-		NULL,
-		true, 0, 0, false
-	);
+	ConstructBtNullFunctionData(padapter,
+				    &ReservedPagePacket[BufIndex],
+				    &BTQosNullLength,
+				    NULL,
+				    true, 0, 0, false);
+
 	rtl8723b_fill_fake_txdesc(padapter, &ReservedPagePacket[BufIndex - TxDescLen], BTQosNullLength, false, true, false);
 
 	CurtPktPageNum = (u8)PageNum_128(TxDescLen + BTQosNullLength);
-- 
2.54.0

