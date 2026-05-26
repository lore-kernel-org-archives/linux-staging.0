Received: from sonic311-31.consmr.mail.ir2.yahoo.com (sonic311-31.consmr.mail.ir2.yahoo.com [77.238.176.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED24A2030A
	for <linux-staging@lists.linux.dev>; Tue, 26 May 2026 19:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.176.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779824848; cv=none; b=FR46jgdGGzepeMDcfYSzD/OrdNWFrE0sSpKETnLi2uoal6It66p4UKA6yJVgic4iFJigOctPDLEq2qdDaV38MmnNGFkLmoI9KQg5Ov9r+uD4H1eW97Dz/ZtN83nmRujCV8GGszVKjrmiJ2TYw4ilYms5k7lz9n22821VLbcD5IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779824848; c=relaxed/simple;
	bh=EY5EPcZ5WRekbLL2AJRkIwWGEvuP3Ebi7jY/aaFJPyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=cXQlh+oQZLe+z9EXXvExXiXEPaJfY1W9fq8g+llivdg9BnULX1nY7X3fxeoqXA1vQu/ESKo7KLmquqGjGtDFOBTliFE0A4HgP5Lrq/CcRNtBjlqhqw88hrXPBF+nq0ef/hT8TzOsvEnpPu2Kz6EYYnQSMVFg5x0hNEsN8iZpGpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=YhHVTiJY; arc=none smtp.client-ip=77.238.176.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="YhHVTiJY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1779824845; bh=Y5J/+nps483SQHpZBqOaKD/ZCTts6DFHwHl7HO5vf3Y=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=YhHVTiJY75altVn55EjDdjoKfCrFcj4P+N5Clht1yMVLefBj1lYA8xlMHZ7uuSnGTuywcDQo75V0F+USuOlc5Yb9XyDhW5eylCxYNzmaJhpMGR5pJH7Rsdgqs9slYhNSSUh8ocM9cxtnA5hqs5ww7XUbHjdvV+B7Cuvzv8eNY2mh+k6mJiR1E7CsmHMLzbT9w2Q5fyGif6HzvUjuYtyFgCxtMuz565uwbPf+xjdG9OJreAcEB7hg2FOwuetMZ9I+91KHNdjTKbHhGC6VPXpaWwCIKT/ZHRwamc2C+eUb3lasmMmfSj9URro7jjmgfgHLoyMidC4IdQhHleEEEubdVg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1779824845; bh=N0MB3O2llgwyKYn2LTHB52wUIPwX8XUbmuDu2xV+5Sb=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=lGG+HSLsm9exdxSHrjlnwcuJwWGR7ICfes1IEN9/SgOP+6hp4VnWEmdZR/3i55JRRzfZ7RewlBKJYR3U9MPiXiATQqFAGKDA2pasI7zCISjq54fQ+t51dvgvGUZGCtVQXKG/CtD3i/qSMZjMUuGLVjemtE+W0TDn3dVwrK8qcaGUHq9vxzUrzXJGMtsnPKTojUxiYQiIJB3tuzfp8foR49xQn717ZiFGve0H64daQevT27P3REdUELqgim77dDKGafUjF+KLxUsuCs4djADnb6KrC6EtsXb1hovWDBQaD6jbfUMsoKPgS22p9ZE9+X7Pr/gv7t5FAl6KN2mwcG1nXA==
X-YMail-OSG: DhrrCSQVM1ldBrGlzQcTPkUt3bB4PPLi30xonfCXqLoelOo_P_yLoYP2zn0JT2X
 nRfHTbT_5Zvg5jKPSOEiUAU.UhR7x8yPA9bdn9SrC6VCyfbZKKXW7_0NzMycp807FdMapc_77Wq2
 Abfl69LDYSQzgsmfS54apIkL_qNNPISqrPkt6eYFl4UXis1dKGZZ7wYtNrUED6pR81ZDizB0aE56
 xey7ANw_FiK9xE6PFWQ76NyJZtwfZPfWabAGb3MI9mhTTZWy4lGnYXnA28q54izIVWf1iwQ4ZXX6
 7kYj7SECfOaapCcTFc9l0mi79hA5dovi7drghCTODnryHF7MAp1L6dwj25Yf9KWYc0xZNci8HjdS
 q8oUfUS6FUMk.yVYe.5r2WyKBNSwaxSNO9G9UXqz0kXxwO47PCLSWdI3BBIqZriqSfvvBWrqC25I
 _7CA3FwjvoQ4EjBeze.llWDq3kxFjl7nyuaWwKAa_XUpqFolXI3vu7PXeX_pV_NKjCvSm6bhL0Up
 8f.vPs6kIBJT809bCrGfsQF.vGRltkXnrYSyaMcB31Q.YZjXj1l5AKrDJHJeB2CwbdzJPvypkDmk
 _Je8s1q0hBE6dl3C0xC.Uekftn_H4pQe9G4DIrANuMVsqbXMX31WJzVqD0TN4gxfzXvgivNthxND
 2igZxwrR5Xy48BNwpU_1zz10fnrLC0BfFe61_OHyaEek59DABRtlYk4rjXtT9TKsKs1u0A4p0CIR
 0ij6pM82vzYLOtxJ3LVHtAI79ub5dlET_.dEI637agCC.7lpdQx62rED9HAlvaQChfYmhgaKAd_q
 2W8_ZRzDVyfdKCn15I5Ncuo5fxXIiLnn.MaP8QjDFTCkKK8_Lz4qKebB79AJ81WAdVP.qNT8_Tvs
 HJMvuSjEZDitrfTxLrQtn5i2IL7G5EexmUpJKtX7WBYHRt6rbxh3J1i4Ft767y1NM1YpvPew5QS2
 XeWH8yiUnV1g7wvZSOYZpRV0uQT.Sx2QDMo3Lhg_zwH2i8sL5ZGRiOH_mYJbyGYs73zpMVj.Kw._
 vcvPngGonxKg8xpCmW4VEyKDIwH6fvjmMntqhxOGaogXfReUKvot8LOTTvlV5Vl3IOPvX5SUZDNC
 CllqHmQMZ_xMTcaa3Y962SfxvyvywWRZAimHDwpE4uECUNBwTXCoSdAwYmKZuIXntG8_aUnj4Gyh
 s_qK3dxhjP1eA0TIrRR8L74Is2vfzzYzxT_qy1uLNqcOxiLR6PuIV9H.dXNoON4OhXbdKlKkdFUc
 cS7YPB259BOnCQIqAFhZqHBHrKkozUBJGODK_MCz59Vc.YKb.RF_EXYHj.z354Pl.YMXmYz8T6hM
 ha14Q0dzf.kdZavwY.Cl_HEVn0URbs7LyJWOVJoHU8FQUFGnXFwx9vj6EyZJEGaQuR2KK_nlqPQq
 eyF74Lh.GGp1MSK_Q3zQn6MCBPpZyT6W.AD1_8kCkXHA6WoJCW_cEeMAxSs7VRsklyPs26FZeUVt
 57kwKvU_J6sM8lt6q92cgenQ0f3yIuKHSDf6LwsaIbVoXYVlS2h8ceQW1Plzp1RYBTcqXFdTkcDS
 V5DzncrbRFoju9Bd.3Mgp3xawLPsEbjKhtnKds.acvfF_LIya5UjPfrvw5AcrhTwV4wHTzLK0.Rg
 L4_TsYTg0a4FcJ1.oKtztyY5WFZhTwqtCkCWEIEMxY2e7YUFXTgjfLRH9B4.WHJhyr8iOK2JFRPA
 pE9Yzw.FsKgoIOL7_2M5F085Hl13IkOAwzlWlmfVRsPgHWCBiB9EbYa041W4oOGIKW1bOgVfLppq
 3V3O6gPu8zZjEnRQWDkLq0CVOdhh1qUCeisSkWYtFRWC3_vYpcCl47ikcTn5m6PLncHck58eI7C7
 CwtpC29byFjTSlNXMP0qnppmf9K_5CQF3CedKQn0e3692MfT0UHFaOQbEYCtDJRR_HRLwPORsCCa
 cpcF1ycG70SURckbwX.OeGyx7zO3SrpmJ4C56gG9RQCSjO_kw8lwpRrVijCmMupqUbd2HdPLxsZv
 oxUWQzkKa7xoWOIPcnx9Zqf0FXQUfDOnCQcWk7H7e2cg6FSx4dwfh9MlF8FWb0Z4idLC8bgSIFka
 SPN13dbjZZW9aku1pXuao1I7HSl_b1LOwhLUZHdhMHz_KXS_rjBcoDpqIgfeOWzHyT8G_SPpD0mN
 oveachqa6sYleZrBBnbVlHmZ2iJLs0uuzOh6kx7Bd7r.zpnb8NF7b5sBnr7v4cADJdtqxQK64j4c
 rdepd4AEkyUNjcmUeSOOcX9JAj0dbuPKKHKga_1R2Vo9I.qfO_ZywkwAksv5HMvbQpEbo9nhSyws
 QTHMtPB2MzyoLjkJo66.VRw--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 19dd4127-321f-4160-ac10-655a78cd91e2
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.ir2.yahoo.com with HTTP; Tue, 26 May 2026 19:47:25 +0000
Received: by hermes--production-ir2-89844b765-ms5jz (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 63a93519caee4a55bfdf9bef642f8240;
          Tue, 26 May 2026 18:52:36 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 26 May 2026 20:52:32 +0200
Subject: [PATCH] staging: rtl8723bs: fix spelling mistakes found by
 codespell
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-fix-typos-hal-com-reg-v1-1-9deb54e6e2e8@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QqCQBCF4VeRuW7ANhS2V4ku3PGkI+bKjkUhv
 nubXn5wzr+SISmMrsVKCW81jVPG+VSQ9M3UgbXNJle6uqxczQ/98PKdo3HfjCzxyQkdX6SV4OE
 RfEX5Oyfk4d693Q/bKwyQ5R+jbfsBXNbm5HkAAAA=
X-Change-ID: 20260526-fix-typos-hal-com-reg-3cdcb9e9eb95
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
References: <20260526-fix-typos-hal-com-reg-v1-1-9deb54e6e2e8.ref@yahoo.pl>

Corrected typos in comments:
 - contrl -> control
 - Redifine -> Redefine
 - pauload -> payload

Found by codespell.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/rtl8723bs/include/hal_com_reg.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_com_reg.h b/drivers/staging/rtl8723bs/include/hal_com_reg.h
index 479748d85626..06cbc3f92baf 100644
--- a/drivers/staging/rtl8723bs/include/hal_com_reg.h
+++ b/drivers/staging/rtl8723bs/include/hal_com_reg.h
@@ -20,7 +20,7 @@
 #define REG_RSV_CTRL					0x001C
 #define REG_RF_CTRL						0x001F
 #define REG_AFE_XTAL_CTRL				0x0024
-#define REG_MAC_PHY_CTRL				0x002c /* for 92d, DMDP, SMSP, DMSP contrl */
+#define REG_MAC_PHY_CTRL				0x002c /* for 92d, DMDP, SMSP, DMSP control */
 #define REG_EFUSE_CTRL					0x0030
 #define REG_EFUSE_TEST					0x0034
 #define REG_PWR_DATA					0x0038
@@ -186,7 +186,7 @@
 
 /*  */
 /*  */
-/* 	Redifine 8192C register definition for compatibility */
+/* 	Redefine 8192C register definition for compatibility */
 /*  */
 /*  */
 #define EFUSE_CTRL				REG_EFUSE_CTRL		/*  E-Fuse Control. */
@@ -273,7 +273,7 @@
 /*  */
 /*        8192C (RCR) Receive Configuration Register	(Offset 0x608, 32 bits) */
 /*  */
-#define RCR_APPFCS				BIT(31)	/*  WMAC append FCS after pauload */
+#define RCR_APPFCS				BIT(31)	/*  WMAC append FCS after payload */
 #define RCR_APP_MIC				BIT(30)	/*  MACRX will retain the MIC at the bottom of the packet. */
 #define RCR_APP_ICV				BIT(29)	/*  MACRX will retain the ICV at the bottom of the packet. */
 #define RCR_APP_PHYST_RXFF		BIT(28)	/*  PHY Status is appended before RX packet in RXFF */

---
base-commit: 7cb1c5b32a2bfde961fff8d5204526b609bcb30a
change-id: 20260526-fix-typos-hal-com-reg-3cdcb9e9eb95

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

