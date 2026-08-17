Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DB243F8C6
	for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 16:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786985363; cv=none; b=VUadT9fkgbnCUI7mtBUggm9/fuxyHg7l+49bAqvItNN2o520Pkz4JVQeQuzAapSIIFtLXBGE96CHEKl3HzEQjxLpQnvBtiohdaPx1n0s9kFYIyWda0Q7wP0wGXOU8CUvQYSuJocX2oFiRE11wR1RuDMLn++8DI+zNj/k0q4DnSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786985363; c=relaxed/simple;
	bh=6D+ljmrgmvLwaLG31zW6f6WG6Ur2RXShFysH6kV/r8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=areq+Xe/u/M09/AWmo4WoN19GoiVD+FZITUi/ou+t/s2irbItBWw6usvFGXGUFCjfW1kZYEoYbyl7S1dLVYJ+4bHxj0BA748YNN9vEIuNOVYgCrcrVi0x3wEcav+ccE2UOZkH2gHk2bZBNOCZ2TjwBed4/n9Ju0ojVJIs3u9n2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=jVHMruSl; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="jVHMruSl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1786985360; bh=f1TIex6BQas2WrC8FOVyYvOY4miGkikgJm3Ulp8LjJg=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=jVHMruSlHcyRPe0sK3pIyd9+rhuhmJt7ozvVs7tRskuewnFcHUQWZ91ykwqjP6kJN3xzuJqpcF2B3yscu4jte+i2OGaJxLnVlVYDRGWmN5/nQXTpMvFXkdQnKMggBddMD1YYRisyaJCh+bUeVVm3hzUwyo/XTuGGG87mL4EPMnOjTyKCD348gQx23XdsOAdYLddABATpKWGFjooxVS32f/MTYhLqkwRUfPKFRbMPOvF4fEzclY4LsWJq8xpz0qJcDZLfA8BCKVP1CVYmMN4wLz9mV3KlB6Z5PSK50kvP3IFGO0p0+iKVuNxmVw6iKd4sjNSyR96bdRCV4ovLcx9MqQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1786985360; bh=FFR6HCC06riA+37cBY5gCF9HtkAhbROdLjaSgW+idNH=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=PsGr98aY/ruQhpaNEaSmmooFReJDdvh6TIdDP329W34xDDVUh84Msmvk8wgQ5K3swF2NQ2VZreuInyI02tNNcmOpI5tyLYTghiCGofMWgNWhFMxKQ7UBIToPwtgGXkEIKermL2Cq0MljYK0s0Ek+gbE+PRAT26WzUKBU539vzjcD85c6+ZctxElwIkzG+lRIXk8wReJw3jj8eWHDqbN0wMPF50Y5HJitWyeHsZa6LhRW0MQ2g1dvjVPBcwnJBkTB5OKHdu/+yPJRmE4tOXtkKW2QEZwjn5PNBNauLbiTU9rA5vrHcReZxvWGtm6Jj9U01Q9ezgtGisFtjneKt2v/8A==
X-YMail-OSG: Ev1uSDkVM1mGJUlcmSRmAWHHXb.ggRRjHJhEtvjRIDmRB2Kl6aDg.kQ8khKt8G9
 cFEb20VfFcTJ4K6HaYCFk5KcW.gT2fI8IuPMkEHtuDuD.ij7TdKwN2FuDeOQ69o35N6yz7btI41w
 LhXi0QljM3X47S_bVCTTikPkh7OQwrB9Joz94dbBvEqhr9KbPAOyFy5Olfaa.kfWXIMjmXOTDCRQ
 VqRTRijQvoUofHakSsjr5hNfsDwgyG71XkUj6lwhI0e80rFeDCV6uZUl5YZxpXmK888x4s4uSEH6
 12kh0WNs3G0Xi2afUyTOQeC1bvKy1NCbPUb_U6eBswtfw9U5oNglGnCKc2WthZLd0XcRCgfjoYS_
 RrXYEd.QzKIxhzSfTyVG6rhuTDbTh29j15j92FIrJIQz7gp6a2eT2SR7rZ82YeQSqteFmVG7AAC6
 o1_s3xET45I6McLJSx6Je6a.IV6RK.gbsMKqZD1F_zDALyYMW2QrcuqyyLAakTZjMd0OcJd0jdJl
 wsl13hQ468y4X.fR50enu23tKf3lHxmuKtI9ub8HFqOGBu5HHFi6kfM4X3pfdhx46H2Dea8b95SU
 axnhM4ZRK5.QN_JTFs.Sz0rg_TaeZHWvp3Hbdc4.VZslH1CPV9GhwmJLj5niorEVwn91GEPhYelj
 hbZpgTYA9NC9Dpo8UFf8IIgDaUjo6rCIdlL.Sw2M5bkoVEyolzw0V79dFyB8OZExoM7VOLFRLrcy
 .7E3TJkwY6uF9u4C57.fe4_YYvDA5JoXUQdskkFl3ZLgpSxvCkrTtY0xO9yKYlu3hRiSKPf24J3C
 HJDgmTlFB8hiNynFRTcHDXIBcw5tvG5RHt5u0VUPuhQAb_qzBdcI1FYHk5iVbN0N0Ev7284LCnbC
 gfB2rt0jjKq44op1CoDu7qjrKKSNva.P2RcbNB4ochVrmpRq94jspXGpQtlv7kJDtubbPbvkyHGC
 quO6GpVkNqiywrMimWJDq0ZrAd7zQi8JneXqFa9TrrZjgOn_.nnwhSvOIHmIp5PDb9twORLeG.2A
 5L09igBpMyc.hdphC5AoqAEg8OBNE3GOE2oUvpbmFRifH322G2wu7ZCaT1WQQJkKx.kUiX7iwbFG
 Z_PpE.SDJO6EU8arqXoseLMlR2cN9cXu5YPU7iUBqTFCrOb2bBD5TbrT7KmBqpF7XSfE1Yltav6A
 jqOOAWj1VNT4DsQw23Iub8tE4M84dlcX7sJGNBlbO7T0WI3gF0YJkNSImFvGvoXEyAngjvfE37rG
 MS8wCuFAqia9O4Vnb8krqBfTiKqMty39VxJPH5ObeU2axW.VsL2gnO6GJLUSA2v2jDIHe0YiQ0ND
 L24AQwCD_Q.LDKt8A5X6cqUUtWImBH3pdeW_Qi5vaM8.34COIq32fLg2Ycr7PfM7CErgJo6RTu48
 TyU2G9kO97wd8ar26GR0L42qmt97dG1kEePMAKvEzysaeaO_ziv63NBhI2V7yZ9FMVTYze15anz0
 t.eVllOBJ8WL6faoNY9muGKcQKy6nS.i72HmV.QZM8pwz4eliNtgB8eOEBk4FuSSlrIXO3xfw5Wy
 YxEgjRD5DK7r3epqKIZ3ZzWMvO4NM7yxWUIGKeX5IZ_lyVxZcZORpyrfpESUQ4UOtdYdA1nglSz7
 2Pqnc8YF.qUZIUpGEEKT2ZuvyRH4wS9HgQxUdYocHMI1tMGA4Z7cO2vx5tlswojv4a3CPF5bG.J2
 YwAuTXPF_.D5qXgkqm7dc0TwE0MJzLnp4MmUmE7tiwFGvLoq2bC4nU2tEYqOyqb_nzeOJVvqYZbK
 3R49o26FHjbKVaDfVCJfuVe__e8rGoLur4i4ufZw5XIJtUt7e1.88lTCc0IZYkKkwfHMvcg8LSnG
 8SnYiVWEXn56IjsLuwGRL3U482FNzejewcZYet1c4GckpijPL0evD2J9dT7UqBTid_YvreLKBP7R
 pxcjvkABVIZ8pXWfqGMGsu_NzCsWdAiY8UhKRAlwUk2IQWnZf.JP_aAfg2UvQOyzSqKHv.E8pJM8
 8Dk_uERkEOtNAa2h3fyalCMGCWj0dMxjfqTx2EE8ZfSPe._Pc272Ww3YZsmaK3Tg-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: e2f15711-50da-4148-91d0-8d1d53e58171
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-101 with HTTP; Mon, 17 Aug 2026 16:49:20 +0000
Received: from dip162.lsn.ir2.yahoo.com ([87.248.99.171])
          by hello (SMTP) with SMTP ID 85d7efd1dab39c8978a02e35ea7ce8f4;
          Mon, 17 Aug 2026 16:49:16 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Mon, 17 Aug 2026 18:49:14 +0200
Subject: [PATCH] staging: rtl8723bs: remove unnecessary void * casts in
 odm_EdcaTurboCheck.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-rtl8723bs-void-cast-edcaturbo-v1-1-78097864e35b@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSwrCMBAA0KuUWTuQRGmCVxEX+Ux1RBqZSYtQe
 nejLt/mbaAkTArnYQOhlZXr3GEPA+R7nG+EXLrBGTeaYD1KewbvjklxrVwwR21IJce2SKoY7Gh
 OfsrRBQ/9eAlN/P79l+vfuqQH5fZNYd8/QVQUaYEAAAA=
X-Change-ID: 20260817-rtl8723bs-void-cast-edcaturbo-816047fca287
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786985356; l=2221;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=6D+ljmrgmvLwaLG31zW6f6WG6Ur2RXShFysH6kV/r8Y=;
 b=nIv2xhR95kbXw5QYNwjlItykUeKlB3FgsuXmghCAxZcxB4K2+6r9bItT2uCogZ+NKzxF3IC+C
 R/ZEeAwWR5rDwgRJBn9sroEiTXSRQzlBxeZV/hs7gwZRiUx0koq09Ts
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260817-rtl8723bs-void-cast-edcaturbo-v1-1-78097864e35b.ref@yahoo.pl>

The conversion from void pointer to any other pointer type is
guaranteed by the C programming language, so the explicit casts
from pDM_VOID to struct dm_odm_t * are unnecessary.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Verified with checkpatch.pl - no errors or warnings.
Compiled the rtl8723bs module successfully with CONFIG_RTL8723BS=m.
Module loads without errors in a QEMU environment (verified via
insmod and lsmod). This confirms the module loads cleanly but does
not exercise the changed code path, which would require the actual
RTL8723BS hardware.
---
 drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.c b/drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.c
index 578d5712645c..5760a65be164 100644
--- a/drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.c
+++ b/drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.c
@@ -31,7 +31,7 @@ static u32 edca_setting_DL[HT_IOT_PEER_MAX] = {
 
 void ODM_EdcaTurboInit(void *pDM_VOID)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 	struct adapter *Adapter = pDM_Odm->Adapter;
 
 	pDM_Odm->DM_EDCA_Table.bCurrentTurboEDCA = false;
@@ -45,7 +45,7 @@ void odm_EdcaTurboCheck(void *pDM_VOID)
 	 *  operate at the same time. In stage2/3, we need to prove universal
 	 *  interface and merge all HW dynamic mechanism.
 	 */
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 
 	if (!(pDM_Odm->SupportAbility & ODM_MAC_EDCA_TURBO))
 		return;
@@ -55,7 +55,7 @@ void odm_EdcaTurboCheck(void *pDM_VOID)
 
 void odm_EdcaTurboCheckCE(void *pDM_VOID)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 	struct adapter *Adapter = pDM_Odm->Adapter;
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(Adapter);
 	struct recv_priv *precvpriv = &(Adapter->recvpriv);

---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260817-rtl8723bs-void-cast-edcaturbo-816047fca287

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

