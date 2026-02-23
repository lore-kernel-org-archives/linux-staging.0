Received: from sonic311-31.consmr.mail.ir2.yahoo.com (sonic311-31.consmr.mail.ir2.yahoo.com [77.238.176.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D9533BBD1
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 20:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.176.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771876821; cv=none; b=fPB9JXBUEGN7gLfnx/4jdGhfpqH70qARkPCPhMstDfe//kgnqEzHLA4yEs/kF9ouxznDXH/NDHH/l5XVJNoYLCRB1X3XrFbHnWE2SuAKJD5/16Xd7wRgnicEndFkYCzgA2XOdpQ5xnjlcb1L6awCwRXrwROqdWuVK6NvTZbz6og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771876821; c=relaxed/simple;
	bh=T1fnHvmp0HZzklhGwFAKKArrv3I2N4+dcb+0gVLWzo4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=ioZO68vOBKrY34wiuyOGpzG9l9cMcveuKbGQoja2GYTEWMwe1V6BmyRzhg5CascY36nJflJ57w8ViA1A9XHRSRDKHOatyez7QgoQi5yaCM8OXXQQZEbcuiEjg8Yd/NYt+jQb+vrcCITlh3hChLGaf1DFcTG1W+2XRmzXGitQl6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=cDe+w4oT; arc=none smtp.client-ip=77.238.176.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="cDe+w4oT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1771876813; bh=hRQ0vNkMPE6diab+7RtEwAXmMomRcYUgH0ZSVfC43oc=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=cDe+w4oTU3vgT7OPV2hEfwxEKRMUTQdX1zH6XCMMO/lriukhD91o5wcx+g231N7Qust3yWz6wj7d19fsYz0ukXph6Vev2jAAFMTsMrle3Wc4IJgZEiFGKFnvxfDWWuJeHYrasJmrnXRGNVKLhVSegFbrbXprpjR2YJK7y+1+gAOi2ZQGWGjcksbPB+k1N1vAzaRkP/EwqpbY7dYDNDmNXPMunqRDGIEqU4uDdy41jD4X9CaOW9B2qqvZyWCElLyqAhk5BSq598oQxaVGP6NE1Oa+YhajTcdE6oPqlC2zLL32dVMdkXS4bECrlXerpUc/Ort2t/00zSEq51LypyqkKw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1771876813; bh=J8VozTYAmuURXyCKqcCcf5+oU0rgtvUVg2pi7YMywaW=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=pKxIrwJtX/qwRe0NYlfru21RI1KhSm4vF+t6P0Uq5YwUvAKbkVHXt0ThlJpCF0HTjsqmFD/+h5EFRM6T2L1TfRWWo61p6toZ+nnjcSeKrw5EH+Xs1/Hqhn9rY2SUS865pnzKiZm17RqwIjIizSPtnm03cRt9wqcz0NwBRSwIKw6Zf/k4h5meKhT/lHSoer/PUroV56vXE0ztIe2sNKlhyQfzsxqLmDMkpqot7iYmMCo9JlyPEKuj/GLWtKQNHUtL8IhNB5OVDjXXIIUqd5reOuDAjgHM3lrItogLIgSXD+w8RBWsh1yPeUcDca0HFEC4TmM/J4e31wM2zHx/S06usg==
X-YMail-OSG: xe9qaBUVM1l1Ncb8nvVwB4fLIbb0hrUtdeLIDoKatWdKdMs9L6NNP3pUbSMBUB7
 koRRhfUx5j3VBRyozwtw1N.HlcaNmbX02TW5KZ5N9HmyuNXeL7l7xLtKwdMeP4aPHJNX.n6RfUAo
 VDJr0FzXq2MvYj.zkB2As0QHnNabyzM7DCD31cXHE_M6ZFDjRQxgDSsZfWP3uYSoeyExZTCwa37n
 hQosqymRDp8kxjsaCd.XFMR18qjABVvBAN6J_aBZoms3Wfmy3Spn7mIa7rpc.mzdBzlh43YjSGK8
 P4EabBO1HyMb.9viclgd91wE889UJS2e9Dpw..E8_P2t8q_W3O3G25ljKc_gKqxicGbQpIWFDeSh
 L6Wim0cLnUkJg6VNDF1v56qv4nLKiD7uz3mYnyFyODTBYJGr0zm2NgtPyLqY_e7eJHCKeLS_.Hrj
 kQJmz2V6HTFs.z8KBkqXdPMXUKeOWwAYuowz8cDo6FhKHd7OhKh0yHSyli1QezPnUUo50PGeXJ2p
 E9lGjYxT8tidQRh3UCxVE3ub8Aql91lPzHM.3DLSr.0sKZQ5AoF2hoojK2.fWHjNrSztUIDoo.ZM
 BfomCDURTP2NVrXiu60Ekd1s91IDoK3ac3XUoCFfRB61APsggyO54Yi5y4IGuGtHMIC9H973k0gH
 7Ty2piWNNfW8lYprTegN31EhCGctcENMic8M98h9jgAIHr4aDWG2wCEROxSv70pTUOMcnkO6iTd4
 mNczIj79tEqVv0jPXW9He0rgCPWb8fR8lj1KSan7Q1x8VS1zHI3t6Q16js63TTVLRf0gPtUKFm7T
 2OtuGhRWBHSS8fTToBlMdBoQVk.Kmazqqu5BtgRhB4bD_gH7A0JKNTqCrtdD2o9OZLxZZDmOLlsX
 E3s6jvYtDbWX_2fmOBe4ii3XCZsqn8J18nUBXkSyq2ThhVCSl14vtb1t1QmA5DLi_VvFC3gT3Hkv
 y8pHIEsK.iQo.k1tKog.PGrDr5XO1nqhLIRQGoWcnBAcp26vPS_CQ._Dafk28u7TWQsR4OM4TzsU
 xkSDmpvW502_A4AW_XjqVhvog6woC76z3kZa9jnq.5lMvW5fQ.VGPk2feLpo5cGwjzaX6ZlMLbzb
 unzBFPtIJpAodstB1qWW0a0SuAM6sf4QtVomGAa2LtCT9ufoMx7s3k9Kh6GFyc6MWVAGf9.UH0AS
 uCs3JVjy2FQow35DSvPkge27Ej8sjQ2MjnUs__GIzs1egsgvHMh1wNyTLFb7eRrHKSga71TxTPYB
 LcY.G4hC0IbfOqFGyN.KMG3iV.4m1swTrEOcI_y3dWyS3Pz8THlXK5FSSIfl.t.0SIeWsYRYXq4K
 lI7kO9Yfuuezqdlg6vcIcfnTnkDamG38y51_tahPsEAk8if4.UG5Bp25MdKitwioRHXAC5U5sL1y
 s4U3xL1ZKI8lXBMI1uZegBNk0RBSKjusd4X3AU2OXHQUGasjMtpvfOw_7VfZhKbmOBDQOzvgsBRQ
 z_gNc9IY.ukUpSVoSeYTPIY_I6kNbpUDljvhOxYfIG_V_hGs9M9y72uIYtFUREex8QNQkgV1lwt5
 nJrMWbxxosj5E5IGy1UAn.vCMPGMrAMe0e_jLJVAXS4sDuDllz5zqFM45gr2V2PKejmmq8WLoysZ
 _KiROxmMSJPPTGIiDhB54H2ZbO_32irYT92BK6w4JAb584iSB4ZNPbmBHTxcu.zGqS5JliehV6u5
 b59wUTydNZ38snv6vjLOJOKpjlBSq348vKVAe4TbI9lfz2yKLP1E4TIY_TXUg2aNW01zf8PCaQXS
 q._YvU7Ref636sOqUTsK_iTU2STq.ZfHFwx1510fLvWZWRlpMTYemv_pV23rzcLWwKBr61ymp2Ls
 P7iY00elPJZ0hEkDicKhOT_yQllcFrEQzKocvuEGhxoVej7SdMFHy2W578tcKYwH1QlC_DMe0wM2
 hYduA5znJ3tO1O8_oGqGJIwyhexdKGzrP3pBjBAhIv.9r1HI.DdFLIVGdQ9.BbD5TN6GhkNTc8m9
 j.12nJAlecd2GVcIxMHM3OVwIBC.ulCXF69mPVSu.xUJtr6_Fj6z3f135b1CxgvJHklbdkHh0yk_
 6EjcPL6d2ycypmwmyK00tS86z8lSfQWKueHRTSkhLcP6ai3fcHJfwFwJHGmTOgFt4RmixSzaTLp0
 L2lxZJ3xgJdnSxz5A0BaknkQepYLWjsUsmAQrLzQjvNzE890T8p0RECGA.WDVK5_dt3smx7KnCfW
 eZwu3IJilDFYBvnnVoOX9snTXTDQ7WXTwpfIvuGzgj2OwVNlb.STB_4uEQ3CrrZwNkJCPDi9FjM3
 W
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 85778e7d-a9c5-4df0-92b3-c913906cdf25
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.ir2.yahoo.com with HTTP; Mon, 23 Feb 2026 20:00:13 +0000
Received: by hermes--production-ir2-bbcfb4457-796l5 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 84811f5c729edc09a1bae7e4e6fbea98;
          Mon, 23 Feb 2026 20:00:09 +0000 (UTC)
From: tomasz.unger@yahoo.pl
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tomasz Unger <tomasz.unger@yahoo.pl>
Subject: [PATCH v3 1/2] staging: rtl8723bs: fix spelling mistakes in rtw_wlan_util.c
Date: Mon, 23 Feb 2026 21:00:05 +0100
Message-ID: <20260223200006.145296-1-tomasz.unger@yahoo.pl>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260223200006.145296-1-tomasz.unger.ref@yahoo.pl>

From: Tomasz Unger <tomasz.unger@yahoo.pl>

Fix spelling mistakes in comments found by codespell:
 - alloction => allocation
 - overwirte => overwrite
 - indx => index

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
v3: Split into two separate patches as requested by Greg Kroah-Hartman.
v2: Added multi-line comment format, changed to codespell.

 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 3242978da36c..74c31a97f093 100644
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

