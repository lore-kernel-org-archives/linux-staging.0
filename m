Received: from sonic312-25.consmr.mail.ir2.yahoo.com (sonic312-25.consmr.mail.ir2.yahoo.com [77.238.178.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A241B4F0A
	for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 13:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.178.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771593421; cv=none; b=YoCMSz+gRxaE6460SPlg6R7NR7IFLFvcC+zEtRdHSYBfwdU3lutmWcYKto8V8YWwBBYQQm4w12ofCPOmUqjwlQ8YpinLt3qI4H4g6WGXJjt5JAlmGK2zXzWMgqgWETAvenzmagAhscD/0uGOTSK4ibyOcWsTcj0RCNuw6H9MkhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771593421; c=relaxed/simple;
	bh=gPeHkxlJpYnbxlikB+VuK74mO/9KcNNhxTJuiOfyVxs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=Cnx76L8lNFibbPQD8TntQ0E1f1u+fywKwbEsTfRqXwomlHOP7GkqG5bH2pJzmvGouaDq0tnKRDxl6uGA8n/YYU/RACtQXtaWeLxnr5p+hEzWDtJig1ZrtpLPSYBPl0Uuo9DVbH7l2PiN+2m3Fmj7jep5ef+j1pGhQ7sV4Bsdb5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=VvKQYK4/; arc=none smtp.client-ip=77.238.178.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="VvKQYK4/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1771593413; bh=CjAJUpb9bKOOMZV6J2lDSv+rxeuQLJ4NtqqDnyCj0v8=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=VvKQYK4/lN8335IoDkSXZ9So0CrKVH644/lGCjoZMcXOe7QPWuGYFPaurBotkxyfpcZLSS7Q0qUllua/4rjm6TCRd5ymnXByXLlieK1CidmhUviv3faXRzZ0/9BerFSzYbvf6R5RG49zZbdkeiy7pF7YkwyPnbyVlRwGRiOSOfoeLwiDkHog8LDuDg1qzj7/LVlvcdzT2/yPgfWEqYrBAL3zntd2BveejAzpazszskuXOAAxkGj/ZIVEMZi6IXr32958mSFbltyxy0TjQLycRXxcKXYMxMyjRaJ1slh06/reL45GkXDcI+yC8taT+YoxbFYLoaF4UNkxMpWuC4YfUg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1771593413; bh=Jmd8pQg4/zV5QqwW/RCVKhSPl1rZuuxi0Ux+yzEshGq=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=TouqhKpxceOMu4tQdiDBBnhDhBdz+ATok+IYSNMjFJ2IdDqeRSqTUTdB8WvlCZKpdQaNZ1FxAikhlM23Jvf5JOuysllKUhnb8Rj5y8zF2JOUcU0xCT8N1mT70EJrPVPe/La+ZWOTlsCznRD1qAXR4tTNGODbNAoxrdvpjIVBPqquKDeVE629P2SJ1akyOBR5nswupWyVfkUUu4vCYLFXk884VhaO/ABy46zK5XE16F+Bewjstx2tBuCAKa2SVVt6ixbfFQGiISiWGizBH91nF3bWbMroFZyqTARmwW0aDT4+z5KcANd6oI0MAJw20IHoMG+qyylEji+NiZJ+U6lIoA==
X-YMail-OSG: RytAlNYVM1n7MgphE_MI5mwNojJt6n8rDZLmBqwnxy..IOlEigPyyOMaxMZeRR2
 24qVQ6ybJWs0isXbcqGgMpABVimyXqYH6jeFstCEU8LccjReQmG4XCtptE5EG6HWS4Ke4zrkE6Ez
 sDvj2NGyx50qcQQNLNY0dxD0RzDa8IFNCC1.Iv0dvICRhKG6pTtZpvolOxH9h2_pBd3i67KhvTOw
 gZADl.8hmUJDO56735l2KgoqUh.rE3xfQqnd3pgNOr7XZZ145oHZoMhMMsAsBeurjOHIYP1R07ao
 8c60XxAMjAVOZiJ.O0PeTBPuWDt7rbNter2U05jmaP3nLfsoyg6qrrWcZmfZdkRViZBgF_86gJlc
 O4VN6U7VQ5xI4PLQKPF8ruqVbY_WEMs6UT.H1bEsMgP07qtoc4J8Fzls5jakeyqLYcTwzmC4zQ2C
 B6UX8vd1IGwnuHbmtalGxCOBgnO3cOYSqp8G1LbxrmGjxMfJ6nmrX8vXLPpjseQ0MMoXb4ROr.Bq
 F6zqdHkt29A1VTyykv4c_4l7o.baiuowPoEKzlJX7FG8XW_OFpjWAN2xu.jVvi0ytnhAlW_m9oW1
 oza6_bAsz5hPEfpfx6LnuSw0hpzcNKHeJbhdtZR.yLAUvdTPTDNy5jhp_phyt2zn5x.FbHh7BZlM
 zZdh2A3fiuRqJjXHRz6Xm9VzQLeCk6OogcN6giglJUN1LlBb6qhc5DgnW5Usu1ARiD1geB4oXZnI
 N3rkGam_IEzSYbMluF.MWFPWnPbXK5fZzxYClgZeri_vCwO9h1ePpTpAUgeFoKdFn8.Br9kEuGa6
 yOWpSB3txWKMr3KhfZhSao5ERWukzLE0AchfDWOVgAe4tpkIR05ZIR1Qu.W3iPzHbTkAyxBabv6O
 ISuaNYFHWYmeC7NbufAIAx2PJ8Mlv774MkSlcOvcMkbZSjHYxUu1CZeu8k1t.f4M4HRRy_cj8Kcl
 pcU09iwGUo_CZDU7rXoR76Df15P0IZQSSUqAljafOQAYAraIstDQpGNEmAt6KQgj0jtkJdoXitbm
 s2fQNIBn6UWl2DlPq.cBu7qNGxIkEUR.U5oLkEmfiAHZG7LhHcI_ECHAQhBl3sy8jEzmh4w3BMYk
 K7V4DSrfWw8oLMgL55oyX3y02lIbDg3aoypUxWkRelRJBcWT0N8H.X2JiIUxDPdIGlCsvBrRCpli
 me9O.r3zI6hpXxjtxkvxZBTRBKBa6wFOPbrDRYCLs5.ULIASmZ.3_zGSIgP9xc6bGapQNTjDbRja
 rg2VNX2Bj0EibOL4FpdkFZc0wCF9H1orXx3UcVe_FBd6tO85s2xq1_hXcqQYlT6MsgRTvwdSsuts
 cpnQ0G0zwppo3gKCuYA2tORQq300yqs2cEnbxR6XgKgQyKYiL8wxJPWFV1Uuu_X.qXCjK9fXuxBb
 DdHM1jNi9DGxWKOZ2xPMll65OEwKYjHTkCPKt8ow2lPRcs46NhVyNkJEPfjUvm5x._n9jobtizSb
 LmHC6nZBsq60VnGZnlcEbjIea2Qd9hEAHt.B6ZDSVrsOfXptfygpgivuQZhIX.1B.DfULPM58JA.
 WV0sKu_09GBLM9ODElaOYwXfigHRieecKs7hfeRQvQOoqd9ID_jatAlsC7koz5JCr7ZgMlj6ZznQ
 YqXxpjvZbkNgapHRpPUVYMo9GVutMuDCDeK0EAutIrndJowJUSSAt3aA1lMC3VR5VXnIzImY9QmD
 pydbQCyU9PtX8YRbb7VHOYKLOImN4uuFCQ8vIHOtq6veGCa.ZBenXUHZivNqziRXanxp4FWIyDn5
 BwovwXozyGAcAFeRI3K0.nMl_4SBJTqQSX.coWZiO_VTgDHdy7hoePnUOA9KL3C5BpdMEb39BvKg
 VGETNY49mR8af1FW.KSbpKda3SeI7YAIZDyWsKitccUPz.6L_eYtW7DhH.ODj_D8UN_F8u.gBA0k
 odjlNJ7HliruQr.wXNzdJVbvfJQN5bTNQh6DLMVzIONk0y5_6l95lgU780Mz1Umv.W25fsqcKZay
 zyhdsStlj8JSMapL6fssgFBnmvGsiTh3obwsZjZen6.YS_pirLhm4Kc6U.r8ANQyl0cbxhlQUMCh
 RTkpu1wuOr27MQsQQlWdspGSHz7doxLGdBo836Uvrv3QRCzhIP3.h7m5831sDloj3Eea8b4otF0s
 RonCh5Y8_mVYCkvlrvXwNGjxLhDnizAcQEqoNXkJNW4X7S.e_1AqE9HSQND09.In7Bh8Aj1iOgxY
 kFIu44.h1zczz8O_Xr565R928jyIF3yfa1cjndIEcqzB9NLuTNCkdaeXwGgTV07ySzK55b4MA9K7
 8WCE-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 02822c38-4f57-49dc-b1de-0a7587aba157
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ir2.yahoo.com with HTTP; Fri, 20 Feb 2026 13:16:53 +0000
Received: by hermes--production-ir2-bbcfb4457-29p8w (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID ba5772419c4e3c4484a724eaec9fcccd;
          Fri, 20 Feb 2026 13:16:50 +0000 (UTC)
From: tomasz.unger@yahoo.pl
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tomasz Unger <tomasz.unger@yahoo.pl>
Subject: [PATCH] staging: rtl8723bs: Fix spelling mistakes in comments
Date: Fri, 20 Feb 2026 14:16:47 +0100
Message-ID: <20260220131647.1922405-1-tomasz.unger@yahoo.pl>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260220131647.1922405-1-tomasz.unger.ref@yahoo.pl>

From: Tomasz Unger <tomasz.unger@yahoo.pl>

'alloction' -> 'allocation'
'overwirte' -> 'overwrite'
'indx' -> 'index'

Found by manual inspection.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 9284657e23c2..8f510fe91ad9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -572,7 +572,7 @@ s16 rtw_camid_alloc(struct adapter *adapter, struct sta_info *sta, u8 kid)
 
 	if ((((mlmeinfo->state & 0x03) == WIFI_FW_AP_STATE) || ((mlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE))
 		&& !sta) {
-		/* AP/Ad-hoc mode group key: static alloction to default key by key ID */
+		/* AP/Ad-hoc mode group key: static allocation to default key by key ID */
 		if (kid > 3) {
 			netdev_dbg(adapter->pnetdev,
 				   FUNC_ADPT_FMT " group key with invalid key id:%u\n",
@@ -597,7 +597,7 @@ s16 rtw_camid_alloc(struct adapter *adapter, struct sta_info *sta, u8 kid)
 
 		i = _rtw_camid_search(adapter, addr, kid);
 		if (i >= 0) {
-			/* Fix issue that pairwise and group key have same key id. Pairwise key first, group key can overwirte group only(ex: rekey) */
+			/* Fix issue that pairwise and group key have same key id. Pairwise key first, group key can overwrite group only(ex: rekey) */
 			if (sta || _rtw_camid_is_gk(adapter, i))
 				cam_id = i;
 			else
@@ -704,7 +704,7 @@ static void sort_wmm_ac_params(u32 *inx, u32 *edca)
 {
 	u32 i, j, change_inx = false;
 
-	/* entry indx: 0->vo, 1->vi, 2->be, 3->bk. */
+	/* entry index: 0->vo, 1->vi, 2->be, 3->bk. */
 	for (i = 0; i < 4; i++) {
 		for (j = i + 1; j < 4; j++) {
 			/* compare CW and AIFS */
-- 
2.53.0

