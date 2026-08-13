Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6C84968E0
	for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 17:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786642020; cv=none; b=BDJAnGDrmNd95uCJxTBhAXPx0SFCnYYSP/NVlcoLd2cpM0cD3khCU78aFUNt5fK6OFyXJ6IGvmdE0VJnV986n7LZcMcFeHYnXRBNR/TMlPC66D0E44RZ2hoabUnwi0mGP8MD7I+97MsLf5yI3u8r2OwBHr5gurxFavNQ/szqkn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786642020; c=relaxed/simple;
	bh=KE81XS4SZOwNKE+v39pDJHU/20En/gX6xACDS9io4qE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=pCqYNc1DWsuSVsB4GRpdSCrfH3YXKiLLDtuv0QJ8gPsDnoaJGygVCcigZqORReiCXjd/dIjquEBeB/Lj5sWdi1MgA9M0jATW1Q1Ki/xmBO1liC6p3unh11fYagj9v9yy+B1pLpDwXaAo/kkvnUsZTAc2TFfEtyQqBeGmggHU7Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=pKLDFz/z; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="pKLDFz/z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1786642016; bh=ISNohv9jfm1225I6xCPQmhy815hrpbWQlCLTVE3VUN0=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=pKLDFz/zVgo4SIF2SBNtmeUlzEKPVwRd2838dmuCS8kInWymy52v2jZhnfQSJh8I0SzahWTMNW0f9TpvjDO6jdWBuLz0jzmEOrlPjGBJZCwqKCHxJA4Rn/nmycegNSZoOMnKvVhCWXgbYk/lTdmeY6y2JuFWyGdeqhMoxrwxGKlTpjgKxOa8naRO96FdlIEteVDV2HNod7wIWby1qaVBw018eLLCaaSPSPRLx5u4/gbecXY8f2w1uJ46+iilNSJQUFphxpOZ23gCZYrchvMgDWK2tuMps0KXJJhvFa0l/5Q082xbj9jWyPBYUfJkQAX1/KJZymWmLdTYehynHF8mwg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1786642016; bh=H4xV3s9qnN3a3Do/pSoaX6etdtmPeCa5D9/5VWn5ZlF=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=s7042qbgn2Q3JgOxtKyL6U/kpnCVRY8P3gGB2YJGF/gG3auZWfy/502TiMbibVBhcsvwEp2cOzzDR3ZEmidavq5p9itDLMzdvoAxxUccb1IUZDGvHKwUBwXQIouwgeqro3gt2f3feyunYnfv4FkdMI1g4d5d0L8TeJyWrCFjaFN83fAge5pe8nS5cI0tjio7B4mzUtqHVP8lyqbufmOic/kdTETuFu+Lxti3WCZFWv8Iok7ptfUcdke/AQUODXTlrfjoijoNWljK2ooaws+NbnfFqdhXkyFPQxID1VTQy/KY9lp12WXj+9BEPhCTNsdZbdhH4LwA2MsmFZtB/z4Wkw==
X-YMail-OSG: lzBWsfoVM1kAfR9O4S4jUo1AI4A.0o0jHHbKiUTQ9jiixGYMG67abH35zn6_cT5
 aulwjxM4DvflAZqAhsmPR9gkUtJrFNCSSP8Lw9S90Yb31xovG9PdQpTLNeaD57W.eAndeF6SU.zw
 1AGjEPR_OzN7qKzx5DvYkuAr8MMQdPRg4t8S2eEcqiDsnfMDaDU0R7TPjRFs3aXJjIXhfBVdGIf4
 oJR4gOfn1B98zWeRlpgkQs0VaE_LkQJL4Wd0krohBpqT4FQJDanIWWS_zlFUwB_gxxc9dG8hX1mW
 cDKd_vNiieaFjbBhGJT1DMCrIf8GBnajChQFSpMyw6feNvM8A43IIvsYuh1HKknhqQSLkQ2hHX.H
 YrBaRicOoTkrZgnolras.tmmfK5c_LoG9gWogfrLujSqKhYL9AGJJ8e26MZ356L3kcGG6DT92__k
 L1lcb70bwIqK.0IbOYrYNvuMaAYyTVv0QOaLCx1DNbymnqWWPFW.VwOKrBaubSgqYBsNiRa4tsFV
 jBYxficowlcKxP07CKvXXT9xs2YgIsHgJjsACMtUq42X3WvYBXLYwQ.ozrylYFt8peGyvhUqXEVu
 .TUdYIbdSH032qziZsTyzvinH3vXCajoVmBD_e0QeB.fWih96zsEAzH.OaNCVx2rIxQtfPHRlZEr
 J6EaeBv7lNm1XzBNiXIIo4R0dplaPBaUdWY0UW79SyMAp0LyPziCvxesHVrq9nKQ_9YRAlOuoJdo
 kXMioz.D3Jv6N_6YgfXbHEIjvouhi8cX2gy6DkXLsWwNyNY4uRjdBdcFdQqyW4FJZ.EeDRvDzJPD
 n82sw5kE1fEfXfLXX9IL8SJMI29GYqk7tmhbyMy2Qhhnh2mj9vlal08dEgY3gGOnIpkWMRB5krow
 cA..fmvwVtWZ_naZ7R0tN1d_LeGH4.8XW9aqdmX78K0D7RsvSTsMNJ1YZ.5nFTFV1PblaNQUoaPP
 .P6gkaxzcPt6k.FjWWQyVxkK2SdzgZ4v9C.XeQe66N9G_cKZXC6.cCNjtg9OZaPtLvA1hjN02vd0
 7CkUL972f5ib.Udaz2d1moXGnslar45IU4wma_NFuhMTVwa8GDhySbjkcXXR6AejGid5V8N9FSDM
 y7oyvbPsjWKK5dGlkwcUNzdcotaCsW.njbmbPBzb6b_SGhMVo6ipp6gPv4I3BtGgFNjawcVMLtPX
 3Hy3O5H3pnqSZrxaclLdlVgtHrGsTLwUFecS4pXJ.PNnjuTkb1166qnuupnY7oEc89kZRpwXBZLD
 dIUT9gDUH_uFKhHsjo0B8RWSsGR_mWhWLiuTfrsiDGj3vwDAYEMJLrGkMuhOmFKg_zjl2Cd_uh9w
 5ztRxluA28PpQd.otbYgg.nbvJpyyfOx_4sVtyfL4RqS6_BkibuPGMB532MjUhaN65mmuDtH9qN8
 fFCH3dYKVo7RHnBN7xFfYYkSzN2CQgs4Zg4Xb5TquXt9Xf8hBPJ8CKW1LxkXt06a6_qhg_c8.8dp
 uWekCbQFwUEvF5yHOCyyZZOUEWWZlLPswltwO28AtIhsjeFDZSUbCl8EZOjH0DLNJHWAYxf4BVeZ
 JuhqZChdtGbGlOt5jT0.gNzzA589sajsQF3IUEp514FdoD3SI5Yyhznfuuj3sAP.emGGkWK4x_Gw
 WRpq05wuBbcqbRVQsHB_XnHc9JjoC2jF_NzSpGByV7cfgxkHQLgD.0G333rdJO5JCsBQ3Ta9kGhO
 qat4kq8c1GUrU9nQtxOJrAj44kry_njBUOJvmJvQrjEChnH53T6W6ZpCXzC8sQ5aJ_aj.sbHLlli
 hfSkYgF3_jTud09ICmJ5N3W.2oZ5StLDW9rfYpec_MQrjUKxePIy6ozMELHyPNhk4_4JEkYARecv
 Q.gyblPM0RfEjKujXibeVfy3MaMNgySWYewUdR5nPbqpT7sxm4ciFqUDjoL6esK_LkeDO0fqoX9w
 AkCVB3pFjSsTqgwBc50jgfv03Qx0Kvn75w6sTpn2DTVX7p9N8N_RQDDIhAujoV9._WpfKmS2doHu
 iStlRFzzGVy8csl_iUlaSMXjHzrXTuS3fwX7N0YQ8GmN0jjUUo3eC2sxlJat_Bg--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: e0e296de-97b3-4f96-aba5-e9f0063774c2
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-101 with HTTP; Thu, 13 Aug 2026 17:26:56 +0000
Received: from dip35.lsn.ir2.yahoo.com ([87.248.99.44])
          by hello (SMTP) with SMTP ID 29379e8e604e542267b8e432418ad553;
          Thu, 13 Aug 2026 17:26:54 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Thu, 13 Aug 2026 19:26:52 +0200
Subject: [PATCH] staging: rtl8723bs: fix XXX placeholder in os_intfs.c
 comment
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rtl8723bs-fix-xxx-placeholder-v2-v1-1-a9be805ac0e5@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQqDMBCF4avIrDtgIqTaq5QuknGsKUFlRiUg3
 r1pXX7w+N8ByhJZ4VEdILxHjfNUYG4V0OinN2Psi8HW1tWtaVDW1N5tExSHmDHnjEvyxOOcehb
 cLXp2wVHnXUcGSmYRLsv/xfN1WbfwYVp/XTjPLwTsu5WEAAAA
X-Change-ID: 20260813-rtl8723bs-fix-xxx-placeholder-v2-ae6b6c9a69c1
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786642014; l=1744;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=KE81XS4SZOwNKE+v39pDJHU/20En/gX6xACDS9io4qE=;
 b=ZO7bSqGf/EURFHLRIUElqP2g89FSYdbNP6MRFnzeooMghKluv4XCrYnmPnODAvAlsMwlRX0dL
 rVqmvAwfbpJBHRxoEOBA98K7HQkhluWXts0qnS+7rDO5lTspf6YBIhC
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260813-rtl8723bs-fix-xxx-placeholder-v2-v1-1-a9be805ac0e5.ref@yahoo.pl>

Replace the 'XXX' placeholder with 'securitypriv', the actual
field name referenced by the commented-out memset() call on the
following line.

Using the real field name pushes the line past 100 columns, so
the comment is reflowed to multi-line style in the same change
to keep it clean. This combines a content fix with a formatting
change; I considered splitting it into two patches (content
first, reflow second) but felt the reflow is a direct and
unavoidable consequence of the content fix rather than an
unrelated cleanup. Happy to split into two patches if preferred.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index f31196f54b3e..873e00a04bcb 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -664,7 +664,10 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
 	/*  add for CONFIG_IEEE80211W, none 11w also can use */
 	spin_lock_init(&padapter->security_key_mutex);
 
-	/*  We don't need to memset padapter->XXX to zero, because adapter is allocated by vzalloc(). */
+	/*
+	 * We don't need to memset padapter->securitypriv to zero,
+	 * because adapter is allocated by vzalloc().
+	 */
 	/* memset((unsigned char *)&padapter->securitypriv, 0, sizeof (struct security_priv)); */
 
 	if (_rtw_init_sta_priv(&padapter->stapriv) == _FAIL)

---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260813-rtl8723bs-fix-xxx-placeholder-v2-ae6b6c9a69c1

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

