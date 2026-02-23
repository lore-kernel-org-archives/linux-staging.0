Received: from sonic302-21.consmr.mail.ir2.yahoo.com (sonic302-21.consmr.mail.ir2.yahoo.com [87.248.110.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519BA34C81F
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 20:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.248.110.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771877433; cv=none; b=oxnFGpIbdR/n9lKL+S721AB+yeRH0vHvzV3Ikb/cZ1ifAoovsb2tCtnn6Hhi0cGw925WkjVJCfdVtfz/XDj0AFha2LpF7ci9CWFmUzjGo6GZcqv8i4J8spn+WJTHAEusiFFhL2QxTHYzx7gbwo1e/ygC+TDOVAkQsMR4YCVfpkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771877433; c=relaxed/simple;
	bh=o4+RHCQksKE6ZEr3yNw4O15WO6gjZJC6t9XcL6D8oxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G/ktN7s2r0rD0jEuhgr631oUEUmskbTfWOTQJAhM+un9jSzBrGw1UXqhQFGgatB4fOhHJbi0q3gkzxzsvOUwtC+U7JUIJPKpbjFP/Hq56TCd8WeIKUxBoEIb0d6ZrpyCso0g2rpnJTtL5kf8KH6WfyH2bY5+iZsU5daDt6kwC7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=lSk9WZs7; arc=none smtp.client-ip=87.248.110.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="lSk9WZs7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1771877424; bh=zG1omimsFtBIGHSTje4wJ4X1gw89L+90V/owD0ym/tw=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=lSk9WZs7O2sFBgNgYKPmaR/nFt0t8PbbHsoPc+8lwcu+ijlrSWkWrLS5U5FgduAhTnvP8ufnonbJ66OqcLz21DsuMe0tNxroqJZTnsMuvf/AhSbcwGk2nC32tzjnd4scrfPMtUz9ZR6L+OzDDVMSlz5MFn0EYHQ0DjMljYfjewrVF/i1hzb3Cy2+cn/YB0FWbaMJbc8ZLKzlUotqF/4FxWKGd9s3yHs1JkG0jQrdq2Z282vFVOLO7D/O1a8weTU2w8NeVGKEvX8KksqhJrHMZIxNniFeOaXLTnfzDUc4gOHEVdD3LnWBXqN7qHrL/qC4c2skXlrF92J9JMBGEJAL3A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1771877424; bh=TaUSIcyCMZpO7MMJkd7+PiksnHM2AG4zU/Rgy/RICXu=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=sPjK/JXVbhGCwVjMcAZJ2aXg5QZX6A1n3NLFU71HAnS42kYdIH7fPykijRr8L3SaskYi4bKCSdhu7osZHdg1frOfYLcnI6Hd7K89H39JqObhJGkm50DmvzbeTepb/YZOf8rR3lCQt69Qjc+QDt2DW3TJDq8nXGMcjP5I0qRS634T3fQAlCmorFP8BMlMTrQqlXvuaeu2sLZQEbj6ouVnLV3aZfYmOPTWV+p/dvPpoTycs53DR95wxzyLUBzTrqIQ11c4RrWBvS9XyF1ZvunQyqy6ggVAusfixdqGUPg83YZdSr6qMmCrUTyN6HutV9DL1mHKlOngifvxihKPzFgu8g==
X-YMail-OSG: f_zdZN8VM1ljpMRKgFf5B6Nz541t7viJEmxI1QGDlWGDt6tbA4NXXb6FI6TdObV
 16fJX.ge3V53hcR1yRA1v3LCtqz2GXhbV22JIxkKpeaS0RrVNTvuhq4sn8t_3SS7Ril7OAiYlRa4
 JqlEI4A2GCwKPskGRp7KwUECp4rUkb69OkvL.kmOYpasM_iWzOkJamETj1VAWPNHK6yXa2d2yq7W
 72778Acj62JQ.J5oXfD31HcakLAK3JPB.EoVB4FjivcdzINsFZV9vT2_F3QTuk5LSXvF9NNSGcbm
 DNEFK8BnY7qgHaYkTlGFIFf.R5U5Ru7f5obZoFSLtroTVatwAs8N8f1z1QSpUBkZDHp8lSwAsTTD
 NjopBFKpBT91CwYnBmP8fIlc5IBDDwwMWV3KtA4b1Bl.AY34H_2vREUsYNPfxn_01ck7JQEBgtdt
 d32jpswAT17YicwQPJkxw8tsbZV7mknQ1KoEAVktgjZ2zN9kXqkbw9lmxaUN0.6u3neZmO2LjhGH
 QxvgkfV4dRAjI4deD7Hl_IlCznyzZtCqEWwJef61qm3VI3d6Ih6d4GzNNFr4hvU_gstGCTaMUDri
 SfrqVzaVUAonJjE76HXAnoTWFo7YKHCeI.YNvdPqgMIKHV4VL7oBxXz6ismTyKjdBiLPAVmyfh0F
 ymbLOOLD2u5j7yPqlkMfdzMhxSPbP1Fs5gQ7kFAJJETfSODV09xPbcHN7QK4nwsd6K.Ltm09.QKf
 CVWEZAZfmqVbS16NbWX5cKhDROB7YnsvQYMOJDMC8_uiLIHupn6IHMiBS2_vUVo.N3WRY4GEBYYs
 xqTDw.eav_2syG5aQd9IcjMo9C1iEsgn84l9m3XblCnidNCBiHmUwB.NkVaRwwDDLv.ZQokBe4hD
 HSzmxaiKxs_5JaLrdip3gldTgecuCuymh6V2GOO0LN95m.r5Gq3Cqz8qqNirIm6CnCo5p10dCdau
 Knpuox5mNx5FnGRXF0u8sx9wuJRPfowor5ScVBfzNJGnbQg5rYS8TLtcfcUT4JllBSv_JKIM8IIg
 vKp42rblMEXt1j9eg3PwRLzrC.gtQsa9YvLcQ1tVmKXxecgT6cyqdMVDXRpTpK.kkFPwG1D7bsIz
 kpqo.6syhtf87Dm.f7RtIV3S._sY2MhlmwCBq6xarvhF4V_TgHbi0IJXJafakaDPZfX7V8zAQVYU
 ewIMCTk0jYTdp1kGxmDU.wti42qrUsC99fknk_ysE7oFlfW1yKvTyqsVmJkdteMVrosLBvualqco
 HGOVVKuAsM9EeqTTH4FX1FmzufDxuylfYdiaUUfX2iko7TxAh1E2nFf6Pw7ElvCGWMbvuuc81XMd
 3hFXCZCu0y_F6O0atayy4iHp7BZWxPWPyoi_539.YeK48PazwMyWpS5MCHMDyU52aINhofLzmNNt
 uXM5wLQBuaKyVTQhVek.nrwMuZoJOtPumijdOjEBkBOEgXvTvcYLkInDHkFE26.yDJp7jCqNDLHm
 wOpPLPZAx4PrEh4AL2gcWfUJbADwQNuFt.3d6XYG8xLaxIZzJz.VRk_gAZSHzHiCCfkigJGxQaEG
 s2NSdks7WYeGesom6LZjnhe84AH8J1s4Wr6_D9LwWZ8Z9i9QXI6CII0XXyR.nru6hIP.mxIQce43
 rllyBC.UsZx43qQS0Iv44GxhdLxQteog1js3RonpcmJw82sthEpcII4S7LwpqnfDvZg14IP11KFk
 _8yMqNUiWSXV9CWioppqKdNUFRzyk4JjzSiOKIUPCNO1ocqFWfwd03PnqPSJCJeCMdGgH9CdXLwr
 Y0vFpEQaWwpwmOQaY3VzoBueQsdimckIZBumRDj9FZMBxnsvopL0T5M78ybIzZp7kPgNDvBlNgAA
 ueeTOTyhB7d8BFByq0Ch3E8W_t3n5TvsVlroG6ZQr.1P0uLksV1K84IS3nRid54H8DHM18jiYzRw
 BcKrCEtFIb1jKi9c2Wh7tDNLcvrew1LFb5mp2xjAa7TSbp6pxNv2L0j.juGVQ3e7Pab.7Fb2FByH
 coz1pTr65Ls68_djYikGlgdjoB1f8Y.4AzJofNQxSxvFqfxdcYwtnv2M.XXOh.JGtpmeZheeCCRm
 WRfgu3T81.yRA77sKiBsGM4DXK9F0bgBPcBJaTYtx2Z5cDpv2Mku4McyrGpdEQw6NE7npnQIfPky
 CqgdOvWu2_Z3bJPYhMMNm_8m4HBoGoSaNU7DBI3tbu5ElTLNynVYjs6FMCp8vbiJle.KiYVfvKEQ
 7i.QHKveulCn5tDybjzzF.XnzVMVH9LtWuEyHjVxqV.mE2_YEGZmD1zOY_dyyy1ZAZPIUdGLPZw-
 -
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 4212fd7f-5d7d-420d-a382-2bdf3f09aa65
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.ir2.yahoo.com with HTTP; Mon, 23 Feb 2026 20:10:24 +0000
Received: by hermes--production-ir2-bbcfb4457-796l5 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 84811f5c729edc09a1bae7e4e6fbea98;
          Mon, 23 Feb 2026 20:00:12 +0000 (UTC)
From: tomasz.unger@yahoo.pl
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tomasz Unger <tomasz.unger@yahoo.pl>
Subject: [PATCH v3 2/2] staging: rtl8723bs: convert single-line comment to multi-line format
Date: Mon, 23 Feb 2026 21:00:06 +0100
Message-ID: <20260223200006.145296-2-tomasz.unger@yahoo.pl>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223200006.145296-1-tomasz.unger@yahoo.pl>
References: <20260223200006.145296-1-tomasz.unger@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomasz Unger <tomasz.unger@yahoo.pl>

Convert a long single-line comment to multi-line format
as per coding-style.rst.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
v3: Split into two separate patches as requested by Greg Kroah-Hartman.
v2: Added multi-line comment format, changed to codespell.

 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 74c31a97f093..cffb1a9d36fa 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -597,7 +597,9 @@ s16 rtw_camid_alloc(struct adapter *adapter, struct sta_info *sta, u8 kid)
 
 		i = _rtw_camid_search(adapter, addr, kid);
 		if (i >= 0) {
-			/* Fix issue that pairwise and group key have same key id. Pairwise key first, group key can overwrite group only(ex: rekey) */
+			/* Fix issue that pairwise and group key have same key id.
+			 * Pairwise key first, group key can overwrite group only(ex: rekey)
+			 */
 			if (sta || _rtw_camid_is_gk(adapter, i))
 				cam_id = i;
 			else
-- 
2.53.0

