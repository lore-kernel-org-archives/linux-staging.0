Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C3D3290C8
	for <linux-staging@lists.linux.dev>; Sun, 23 Aug 2026 16:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787503601; cv=none; b=gttbSj6BlRxe/VlrPErE/tK19lXJfPKL+XjRhPOqjDMyHGjjxUoR67oxouTRt5qW9ToFUvBQq1HNyIN5gnvnRBgPnSj2XB2b+oRDRxqJ2JGwssBSRSFFOZAzo+J/x+W9ByxJuY0DKQghI52OFmX5AleKAxCOV4IHwDwEWh1upw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787503601; c=relaxed/simple;
	bh=hzQT4R+dRAfhoaFyqg+g5ZBao3Nvhm/5hgvI3YoAbzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ED/kuV8j9+m13NagyA4sLwQ5E/cabiq86/FtmZWw9T0vmhOXtQKo7sPZwQ8wv3WtGLKwBGcZFF71DYvRCBMSI9RsxSk6soRL/vKcq6CF51sXC1JHd8uuN/VzenL5WlBxuqjbxII/DoH+t9d+eQygYHiNg+09Q72EsTEXkFvUnFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=e+P5PFtq; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="e+P5PFtq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1787503598; bh=803PFIL7GdTTClHCFl+w65UYDtYGEiJQLaR52k767ro=; h=From:Date:Subject:References:In-Reply-To:To:Cc:From:Subject:Reply-To; b=e+P5PFtqLELY8EjLX3YwJB9NGsV8V8nIHMuN/NxvXINjcg/j5g+y7kazqlhbf0zWVoGuAG2rf/Mi8Kr/qxnGLh3KZAWBT82W+++ZDuSSAF3kYmf9RHfhp2wgr9ISKlK8oH2Ui8gUxU6MsHMJliXQIlvIl09DxY0+Spra36HseB0dQpPyRxuL9B7FDZKlGMEN0SvkY5ZBbtsqwZBmdhSQ7EHZOviS4QQl2zu6QLOGt5EaYblmYl3WbVu8ZEw/LNFQ5mjuD0m4AExI+4Ra4RurqwFE8zNOu05jIvU4GzrHtHv3ZCUFzBZP9e3bFLsvNBn2Z0xJMHNVaAjMGlSve+5fNQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1787503598; bh=QKQphQsxp7TNXQf9GLShsxXFr00i7OL5HEWuf0xU4X5=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=Y7bcKbLK6z6o7W+Trc3bJ1iH80jzwOlk77jfNQpxrQl2+PjyUCdwiVJlaGoGS9F3Fxy1myDEW5fYeDfrDfNxdvpBenzmTyD1JQz5evczTLKY71z0oSfoZXb/Db6wkhLmaKGj5o7/KMNWHP/sFyr0YKlhTBHRIwxPOqIqagAHi5POzy0VZ7AQABgACWrpATjvtepx2ElGvtluzwpvQgIfNhiL7a+zLuBi9vhPfx9fBMlfGqZg+UnGH4oxj7vNlx2APPoTBU1Iet7iN8g1ydv+fD50mphrURphZCMWpcf4/AkC12ye87s/Mjf3OZlFlsZ61EDjSC37rf/tyxMVStYBSw==
X-YMail-OSG: iULAoCsVM1l.bxqRbThY5dAAf0G73vMR7DDb1cFR6lGJakNl.GO__LLYx8m3UYW
 BwSgBXOKdlefd.XWeUKcgZIQhFZQJYE0Lw.WdnhVdE94KJgPrg2QMRUV9FsJkFN0afVo7A.9Ah7V
 WLYMhZYbjzAFNvmWv6225a1_efaBTYq6pnegzhze0mvZE9eTxIdqAsVsUrf_lV_9d1Rf0HOknY40
 sbWzbcv6DVt4JOdyn2SrwWY3XgRoSts.bOuz5sFMPPb1n7VbvBlHARvgRVLD9LIIPWWiKqG0J4bJ
 qI7.Qeia7VKRZ7inMptHblYiPm0LZizjF6I2DpsD7JKzTAjDze1tW4W0zJ1BpBpx8McSatbJhqWu
 aIdoNAVz4RpyJMcICAyi_VTv3wwa2iKPYa.y6mb7y20YmDUmRp_HwmTPk8qDgA6i9a0x2KSpa9C1
 ur5D0VP1__H_sLS3aCIurhggUKYWb0mJ4ONxB1gw.mt5ex5W.kkz.2rWS7ZIGCWSsjTN5wiIiixa
 6Fxr5zASa7sszgGK1mkJA0_GnDINu0QG0xvAFVesW6cm6xdk8u1obcYNHDfeleWkSKf67bBRMqMk
 oWEkL_C4hXMoEG_6VBcP68xQIumoujn8itqzsVTtOJ6DhV4xenqNFrQl2N6vpd_iQyH9Oq4aatab
 52exouzNKb.dzw57yWDLHucbSbuAVZmoKJRtIel9p8ZlW32OzWK7UfFn0jXkt9Ani6uOSsD.CVnS
 NJBbGyihuJWecZ.qauxvyFunS7ebsUm.9WC63XqVPPThueeC3J8H2szsHYEGgz0zOQXrirhY28mD
 S9ntV2W62BLLVLIavBQL0Buwe5plh2mIb88LOIBdc4L6hsYlFTSZ.GFYlxmQQE3vGCzRQyrCvFxx
 eM9ZPmFAF03s69PzrDh_K9d5xy2onIPO0cuB1enlMoGWF8cdySWhLbyro8Cm.o8CGrc32vPBKsaP
 8u.ypi8rXldEMkm.TOQB84fCAzVdJPao9DL0VOVTeGBukYYSz_KifIZuljBMIPQagEaVYDG8VYar
 Isah8FYgjibTNidAFwUArZF3SAztmSOmsrdlC.ZyWJYwaQAPxHXaNh0ioqEJvb26.zekpdPvr.Lw
 4T1U_zwH0kTro1z0aGaghOzEayJUvXurfQp6t4CrcP1WOFOyFfbaXb9wL1zIZXlz5Je5vovxoG96
 lQUcg59upRhevtHbG5FJYqF7lNlPDew0rVFyhf8fpl60kGlDBAE_nBB1PAPFpeeibC2c7w2.Bima
 Of5nsMuvVGFOr5Ovg3RTUwbFX3oO6Ej7dBo.uF784v7QTCNI57IceWDR7_gW73pJ0OPTlT22R1Cy
 8Z4h7wK4UeDlm0m5tcQmMKtO3hAYKUtjCdBRlqH5y5vDJwesWMf_XL8.PnOOE9Ixct8WjUDXcL79
 3bEyQ4cE9gbUHlivZGKeVG.08OBWqF3azqNgDo8mq.E74Cy2LsREEAPipAxjw6ozX7jhPVFciXL6
 lgEvBexDmiWX.haoN9ldvvJt6sFlQ4A8KsUIhzZbTkMTwQlmgUuqt_eO8bQbv.qKDJ..4ohTjYmr
 Flld7Wada3w3GAG36LNu5AN486WSH6djK8FUyrJOCvMMQHaDAyYteYgVjN.xlLnW9aZOjYB1Y8HR
 cOlzN8w4YcJxpcdYuK1fWP2KVKzRnSSVUMzDQOGvLsU4DhTJcWQ3zmBVmeOm3bgnIncilio7dubM
 VZ5rOd4pJC_Myh8jfiNZ4iCcofeUWHjcYmq.B4i3P.y8FC_SQ2vodTxYRiZDEdYraurgL4kkGikY
 GZVHZ6gsmOZcHBHV13uaH2WhZCOmX63nn2GnvgBeG_slIvyP.6J4ZSvwDu3_788iKvi83ZwJjPbu
 V43NtAX4OIH7rDJq1wBKIId_DxhKCxYqT7KskOgQR3.AHI_YfARrNHHw6nJanl52KZ9mkNbL3_8A
 Azc6coN6EYNXFLfg7JkclaTM7ARZ_VvVpZ6YHgjPGVEM23uU_yD6xRusVNqPCgapHNYlz8AGjOOM
 hsQGLDWaVnS_ONcH3QH86qzDT_KNu7DEXVjsRN3xQfOXM6g--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 9e636fed-0595-45c7-bee1-30b7174ddde7
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-102 with HTTP; Sun, 23 Aug 2026 16:46:38 +0000
Received: from dip173.lsn.ir2.yahoo.com ([87.248.99.182])
          by hello (SMTP) with SMTP ID 5d2b60595e62a328da161988bd9de51e;
          Sun, 23 Aug 2026 16:46:34 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Sun, 23 Aug 2026 18:46:31 +0200
Subject: [PATCH 1/2] staging: rtl8723bs: fix space before tab in
 rtl8723b_cmd.c comment
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260823-b4-rtl8723bs-cmd-xmit-space-before-tab-fix-v1-1-11f2600e470a@yahoo.pl>
References: <20260823-b4-rtl8723bs-cmd-xmit-space-before-tab-fix-v1-0-11f2600e470a@yahoo.pl>
In-Reply-To: <20260823-b4-rtl8723bs-cmd-xmit-space-before-tab-fix-v1-0-11f2600e470a@yahoo.pl>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787503592; l=857;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=hzQT4R+dRAfhoaFyqg+g5ZBao3Nvhm/5hgvI3YoAbzw=;
 b=huKhps+1vE1KpMPIdwh1a4m1+I9/nO2vWMkLRPnpb5DsQPfSwwLBqZnFl9/gR+B84DeQHzu00
 wFdttw/IqH/BgCVkqsHew4i6wRYZTgTFj+oWW8MKRw9YBysQYJMYlWX
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=

Remove a stray space before a tab in a comment.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Verified with checkpatch.pl - no new warnings introduced by this change.
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index d2b44ad60a4c..5f6eabc76562 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -895,7 +895,7 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 		DLBcnCount++;
 		do {
 			yield();
-/* 			mdelay(10); */
+/*			mdelay(10); */
 			/*  check rsvd page download OK. */
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, &bcn_valid);
 			poll++;

-- 
2.55.0

