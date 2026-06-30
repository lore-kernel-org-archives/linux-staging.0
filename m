Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C94C37C0F3
	for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 16:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782837245; cv=none; b=baa+83SHtFJiCZmTBKnGyOQTRdtufFQCjUhLUNFYSrG7x02EdgN5bTLwM/3jtGHpkfSr+hfawFRa9cbPS0lnfqG6L2bLt4uiLONCFf5x0bhSzdQ98kwmt3AHFkh/smKhuZmHGh+WD7/KwUFq2BAbuh3bDefo+hm/aREdhmJvXnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782837245; c=relaxed/simple;
	bh=hF1swqPc/K5yjONBVwKpNAj/Zput2Rfs62FSG/Cg9ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n6Nm1aHYSM/6lAbyM8fBw6L8zaqLwRwjh7lcdDNL/MUok8GUVAGniVMDqajJBEyIr//k8KB+yYf7Q02ngDY02VHLfwS52qIc0a4SnLF22NmjvteR7i52PoO16MgdSym15riTYc1WiX0vmEDFyTJguiX0KCV7BFtIIHag9Ei+tKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=S2oeRLV9; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="S2oeRLV9"
Received: from fews03-sea.riseup.net (fews03-sea-pn.riseup.net [10.0.1.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4gqTHc05QzzDqXg;
	Tue, 30 Jun 2026 16:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1782837244; bh=Jf/1qax0sKwNxa7wHgQFEZDG07sGSkBXy9NEHGO8YWk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S2oeRLV965HQ1dYw9SLQRxYh3N5xIxLvG9z6KNi9s+CeaAnHXMxC3VlBCkx+0HRop
	 49toDvXlrOEFD83+MpkuvIBFLZfkHLUh6w6vtQdYbgT/z8oj06QczvK9dZOKntdSa3
	 ZRt3e3Ll6o8fMIMfzTKF70p4SkIdw//AxC05Wmeo=
X-Riseup-User-ID: A0451BABBD358A8D49266A348BDF8906B4B98BECC8582C689072AF1BAD489BB0
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews03-sea.riseup.net (Postfix) with ESMTPSA id 4gqTHN2mJ4z1yRd;
	Tue, 30 Jun 2026 16:33:52 +0000 (UTC)
From: Alonso Garrigues <agarrigues@riseup.net>
To: gregkh@linuxfoundation.org
Cc: guojy.bj@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alonso Garrigues <agarrigues@riseup.net>
Subject: [PATCH 4/6] staging: rtl8723bs: remove dead code in rtl8723b_cmd.c
Date: Tue, 30 Jun 2026 17:33:14 +0100
Message-ID: <20260630163316.1128319-5-agarrigues@riseup.net>
In-Reply-To: <20260630163316.1128319-1-agarrigues@riseup.net>
References: <20260630163316.1128319-1-agarrigues@riseup.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove commented-out old code to help readability.

Signed-off-by: Alonso Garrigues <agarrigues@riseup.net>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index d2dfe6b64067..47985b498fb2 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -74,7 +74,6 @@ s32 FillH2CCmd8723B(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmd
 		else {
 			memcpy((u8 *)(&h2c_cmd) + 1, pCmdBuffer, 3);
 			memcpy((u8 *)(&h2c_cmd_ex), pCmdBuffer + 3, CmdLen - 3);
-/* 			*(u8 *)(&h2c_cmd) |= BIT(7); */
 		}
 
 		*(u8 *)(&h2c_cmd) |= ElementID;
@@ -116,8 +115,7 @@ static void ConstructBeacon(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	ether_addr_copy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)));
 	ether_addr_copy(pwlanhdr->addr3, get_my_bssid(cur_network));
 
-	SetSeqNum(pwlanhdr, 0/*pmlmeext->mgnt_seq*/);
-	/* pmlmeext->mgnt_seq++; */
+	SetSeqNum(pwlanhdr, 0);
 	SetFrameSubType(pframe, WIFI_BEACON);
 
 	pframe += sizeof(struct ieee80211_hdr_3addr);
@@ -161,7 +159,6 @@ static void ConstructBeacon(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	if ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) {
 		u32 ATIMWindow;
 		/*  IBSS Parameter Set... */
-		/* ATIMWindow = cur->configuration.ATIMWindow; */
 		ATIMWindow = 0;
 		pframe = rtw_set_ie(pframe, WLAN_EID_IBSS_PARAMS, 2, (unsigned char *)(&ATIMWindow), &pktlen);
 	}
@@ -341,9 +338,9 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 	u8 PowerState = 0, awake_intvl = 1, byte5 = 0, rlbm = 0;
 
 	if (pwrpriv->dtim > 0 && pwrpriv->dtim < 16)
-		awake_intvl = pwrpriv->dtim + 1;/* DTIM = (awake_intvl - 1) */
+		awake_intvl = pwrpriv->dtim + 1;
 	else
-		awake_intvl = 3;/* DTIM =2 */
+		awake_intvl = 3;
 
 	rlbm = 2;
 
-- 
2.54.0

