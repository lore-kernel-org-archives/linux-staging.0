Received: from sonic303-47.consmr.mail.ir2.yahoo.com (sonic303-47.consmr.mail.ir2.yahoo.com [77.238.178.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09492DC323
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 12:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.178.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771675767; cv=none; b=sw9HJY8GtW39hw7/8Yoz1RBFecWo4cLxWDRrUpmFhqcItWe+Q6KYLxlUNZrATmR2mo6gkwzwIDEFitYojdWoMdhUkYpLuKTDSYZrJjs5oPBEjpgnfXm/MY1+d468mP6Lx6s3epFMR5XYZItoJ+YyNbCIIlfujW6L1I/thxxm4X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771675767; c=relaxed/simple;
	bh=hURhLUzOBCR+PkO7NjrCbEGpMLqhevL2IQ9BZFI5Gfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=dswzyRW+fNml0y0sUJ7CE5OGJAQUNRP6MaBl3PCwcvjfwG20WHfmMFBE3XDGAXpYIzSfwI2RKQEuQTL45WX16eMBldu1kmTreRGIR3B0wL8+VsLPc+/BTBa+2HzSV9Jn6uCwxzLgFwahcF58i+AmHVca2imtccbya9fpM2ZSjS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=GxAJnZMg; arc=none smtp.client-ip=77.238.178.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="GxAJnZMg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1771675763; bh=RfUxPbz2RuoHo60EaiV581NiXy2fiuVFPjL1Cb0Aq9Q=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=GxAJnZMg5d4qALRdkkd3Vd7nU24ZdMq4sokTqE6KTtaJm/479fCng8DOoN5JLnPg2gE/SXTgbXGMHaMSOiKbTewu51pFM7ymhUbSRpi9ymVh1RawruFRU8xGVJ1SryY0dpqlUqGYd4JvtYiU6Moqij0zwrvWd3ygcGXux/L6IqbUSRvNDJjH3FFhTMZvSls9cEkwLBf20ym9n565HbfqrLye2ipyt9gdz3+OwQ2i5axiub7U1IbJgu1nbNnBr7cEuEGxTByv77KIlRO8xfvl7GFlpgWDywIqVO9yfMR3GSQGmZTtEGIU9I+CVAAaRNipDkYAVNe0zU2l3QPFzpkSkQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1771675763; bh=CIZXnVARH2Cug/+CUhebi9KuUGzKzdP7esht/1cZMcQ=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=IyNC7OwVktEmxKz8mv1Qj5dVPWebgrLA/jAVSUJ8StFPikvjn8iAlKB/Ne2Zziui0CGkLUsHkTQtjAnDa1wqmb1GgSDAb06X/wVl5VRJIjJUCY2ZqMJoadmChSfo+qwXNajkI79mjFRfkIZFZMF1SxqMRYX985nkgpOE+Se37TFNKuuig9/JxvUB2aHlNNDO8nv2Uibv4g2Ggq+ZrMq3GWnsITjHhPJ0ZRHfHDcIkFkBDN1pgRqf2H7QkprziljyHbnG11kh3CF9GKG0Av/adZhx8bAdp4mVsbrZVSIhXiUvMdRUdpYdJJfDauvX0X+BcxFOhxMQ/JDjXDF5Df8GoA==
X-YMail-OSG: A8CBHI4VM1l679J2JS5CE_k8oXtbBRCzAiXdBG9DXSxabG8mW_m_KnsxQamYf6A
 ogX8Ktyo1kCM0nk7mePHBeo2z0bpV4LDA6rPvr2MkEAZTqGVnEFuWFU_7PJKN7S2mzJOhXXU.Dpv
 naE02Ly90W0Pm5Os7zgFxyefmrawj1X_K1C3a8UHDUV0zg2XOKm_LHVOJkkx5axdUNxiMayT1iPn
 LL9UpKB7qgE91rWsSHdof1l1Q4B4V_U2znnUDMa23xTmNxGpROO2jWePaphUHwnQtKsLOdoHI9Uw
 BcObvNbhoOWhEiTeE56.1UmMlh8KIId_h59Tqvgatz6sqkKrG7ezxDurdSzgtfMNPB5xqUMPJORq
 Dv7qcjzF7oOonbijOSo_U.GBUMInCbzBUYm3xaqlbzR2t8Z5r57I5rV8mt7G.twm0XEGLIF0lvMs
 O0d7GPBVjhwGrY60hpwcrofx4m7w7Wl9YoRjG7.JRUolZ46DLR1oeJ_Qc9lzszorW0.kZVVCyEA1
 0TFcl.4O3TlyqCp1sLE.mk0r2zDxKzR.zqhvwF.utgqWlcya5_R43nPfpYILhTr.K3MIp0Xkyx7e
 ndRwkQ9oKla4.7g9f7alCU3LPHaWXiZK.kLCqwjyr3bJggcMe.xge9ws4dW88OGbEcMih8.lPrfe
 XkeHz0svgYHlWBeA77V.JhulpUZroeggqcblqhraehmBTz4rrKCnHu9wGZAV.UHlxVzk.nNDl5Rx
 8Q.rf.RFMROaQWSfDr6wxpSOF2WGW70HKR8Abkrp580u6f8rCrtsqX4WbtmxaDz8JLRQLSXZGLsA
 ITh.jKTurj3I4jM3C2tN3n25g8LN2xnvY2.glHUxrlaoUhD35r7NskEqFcYYJsRIZDMa4EqszulQ
 QMNqMsu5yTj1H1buH3LnUVqLGiJJRr808nOlfulTekReE9sb7P.hWASrogNTz2lyI3SKLn0s6pNC
 BKHpqS30mXeJ0N_Xa3ds01o.mcvAQyg4VTuoAjPzuGXFwZcxFO7gXLcWUMmCEH2cSYgkjbcQGh7m
 _3kHSuoKv_49GYce.4PbMiDFjVpY6ZqwuaEbcTYeueAG3KbrW0ff2N8rwMl_fSYVd7uXK_G5lpDT
 40.YRl88YlM.OhFM01V.7hnTrDQc8CcTui5pAzCVpMhdyXYhT82NhxisKWn1jwiycKH6LI0QyApW
 AWFsHn.DgSa5Hp2P.mjSDe3SenZhtx7.WO9VvQr6.tEIcZqU7Pp0aNzD13OBSxnFTvIS4WPx6ETS
 ygdMoQZM9SGMMJF_Kg5uDKVIUNJxgn0.llsZ90Jsr30j7Vnnlc7aNNHWYxaySEnGC6_qen37214E
 kxhYAqLkZ4_h5rmV2iX_CYBthJEEBFTPj3SssS7StKe1ifVwr_K11sqPp8ZER0I8hMb7n0x6NZM_
 .ltGFMxrt7Oqp4qXfODv02kLK71ZyMbzQCebP6uBtYLJi81wy_f5IR2Rh3CQMNtGTI7.B3fklWkn
 UNnE34Jg.GYSY9j8fAWwkRLcKBgaY7jLp.HX9lmQJ2BTlqQcJP5tBFebMpVTVCG6tAabv2wORrB3
 Q30awwxs2e13152JzpXUatFCkx.pSnAPaPyJAttCZORo2gNuJQPUgUgu4n6iWu1ZQG0KAPZidEQQ
 6qfnYe_TB9Ko8MKTm0PAxZHAN4KrwHJWIdmDfXWipOedkFnoyoHXcek3VAM1SK3ejmFv0oogafMg
 .GP2rLg8TmnVUdfenpL1rFv6I5wB99ykqESGVk9uEaGml5EBuamfv4q4.loT_1ssw3OEbLsc.u7r
 GxsZlyzWSqTkujTYnUguC6yOCBDzXKXSq551qQ_GqVVeExDHkN7LRoIcvfGtBoVcJZuQTr3Wp2qI
 1wt2Vn43bukd7F9mJm3e92Th7cJSmLIRZzjoNxAxAAkn3m_1uSGtlapDAxvlyuDVntItHNr8VPIM
 HNASf2O7L81_Usy3LjcMtk3eM6_ri8JE07XzWPGBec6ccQrJJVqzDmHbH3Ojp_OCIgeZy0Cy.NLC
 4WsEPAaKKyjLHA.TbEsTDEclRP5e6fgJmXvfc2s5oWJBI2YSDbf7KZnIHhDNAvAjgYmoa8QVdUGR
 NAyBmob1HKmnvd3xFmPeL.0COStHYR5j9riW0vWGtYyuFjlXKm6LfT.ifRyt5vfvFrNRqVr6k9Ph
 TS8DxzzhDTIS7Xnjue.hU6dMS_Wr64wDwr_A2nXDUbr6kvgTVnV.i61sY0qRKIigQeSWj3FzVk26
 CbyGoz8pPbnk0rGTqR5CYRdG7WBg69ijn0cKxuYZC7IBtXqU4ZABleNynocbtpDVvY.iITL40wef
 lCMrctzYcaJCSOSf8OMdv3b4SQUi1F9w-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 999be496-6f8e-4dd1-b89e-298ec7d70948
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.ir2.yahoo.com with HTTP; Sat, 21 Feb 2026 12:09:23 +0000
Received: by hermes--production-ir2-bbcfb4457-p7tzh (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 8afcad8cea8f9281cf6d76a36711ab7f;
          Sat, 21 Feb 2026 12:07:22 +0000 (UTC)
From: tomasz.unger@yahoo.pl
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tomasz Unger <tomasz.unger@yahoo.pl>
Subject: [PATCH v2] staging: rtl8723bs: Fix spelling mistakes and comment format
Date: Sat, 21 Feb 2026 13:07:19 +0100
Message-ID: <20260221120719.16147-1-tomasz.unger@yahoo.pl>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260221120719.16147-1-tomasz.unger.ref@yahoo.pl>

From: Tomasz Unger <tomasz.unger@yahoo.pl>

Fix spelling mistakes in comments:
- 'alloction' -> 'allocation'
- 'overwirte' -> 'overwrite'
- 'indx' -> 'index'

Also convert a long single-line comment to multi-line format
as per coding-style.rst.

Found using codespell.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
v2:
- Added multi-line comment format as requested by reviewer
- Changed "Found by manual inspection" to "Found using codespell"

 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 9284657e23c2..b99a60e707c2 100644
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
@@ -597,7 +597,10 @@ s16 rtw_camid_alloc(struct adapter *adapter, struct sta_info *sta, u8 kid)
 
 		i = _rtw_camid_search(adapter, addr, kid);
 		if (i >= 0) {
-			/* Fix issue that pairwise and group key have same key id. Pairwise key first, group key can overwirte group only(ex: rekey) */
+			/*
+			 * Fix issue that pairwise and group key have same key id.
+			 * Pairwise key first, group key can overwrite group only(ex: rekey)
+			 */
 			if (sta || _rtw_camid_is_gk(adapter, i))
 				cam_id = i;
 			else
@@ -704,7 +707,7 @@ static void sort_wmm_ac_params(u32 *inx, u32 *edca)
 {
 	u32 i, j, change_inx = false;
 
-	/* entry indx: 0->vo, 1->vi, 2->be, 3->bk. */
+	/* entry index: 0->vo, 1->vi, 2->be, 3->bk. */
 	for (i = 0; i < 4; i++) {
 		for (j = i + 1; j < 4; j++) {
 			/* compare CW and AIFS */
-- 
2.53.0

