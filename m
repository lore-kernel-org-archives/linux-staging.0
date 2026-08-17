Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E71442394
	for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 16:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786983571; cv=none; b=HqpIBRib5XyOaMXLAEeyRCMREPe8+9HgxVfhj93H4JfrOHkacr4bRfBQepLfdtJx6cBLTav4I+WQhkktpK0MftmPOOa2JrIbdBPq2dJdVRw8109T1jHoor0YuLLsrW7Sfw6KMw3XM9OWCz5mWXNxkbYkTcdnlclvw9fZim4dW6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786983571; c=relaxed/simple;
	bh=e3TWMZVbvksbh9jm/1vaz8Q7iEQflKQypKIKYT6dgXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=eouCTJqO4aTCyJS4YrLr47KMtgbT/oiUY1vX77ca7xECO4BchF6v6qbCJaX02Gte05TDs0jsE+pVIB/vngHER7b94LLemCPlJ5OHMeoMaBC3Sk7ujN2oTAh/FQmfBkd6HOdYkzQPDKheDXps+1NABJg0WO52jZvluYDnrb87PC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=Dx9WZikH; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="Dx9WZikH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1786983563; bh=WZRo4XGITP/ZFKedOzl0575TZLZ2ftQtMoh7l/S44EA=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=Dx9WZikH47inEn92Lh63j1yXVvYldVqFdsMp0BXVRDLUkqh1+YmQTQbtuC9dsoJ2FbTRYwJEcmA2Pdwqm9Z8rhYIoNLSBsc/OJqk4x2HTzS/RN/KKcqIrUt0Xa1CMld8qeS6vQbIQxvdMj+ZyN+CYZCFZGsqdBWjfubDYXvbFPbLLS2GqmxZbpsXEpA2Vd8IwEu34mj2mLf+ItOSZBR/YLLFRckayrYt3z+nzlZ66d1S8lEPliS8F17RVQ2uKPZ3ibw02rv8oO+/F7y+O2cGYQTmSOnp8HTsdVcK1wsLUCaXOntDu5aGvvV9KRx8a31NxulYurg9EQDrisMwV7oIDg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1786983563; bh=v5CPPZRmtgmfrr3GbsYRalQfEs2opqiQlfx1PIhPtjb=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=Y39l+tgMJhvHDV8+1Tv/AlCK8Mp6StCVfoLN4JzKZdL008PM83gdnG/Cz774FXPofL5k/t/lccqFBDe39Q1w9pjMVBgaHxEvDxI6gUsCgS3yYXVJlTFFuoo5qNbfq/suicTbLkkCug3Qlas1O6l9twj7a3tSfJWldt80Y7WAiqlveYrBA6c/tpXbH2NmERasECT4lh5FcxSKAStBzfCjvVBMeyvjqjOTcFD/qM9WEU6SGJluXNnjM+Eb3Tblabtu4E88bs2nxozBMTSoKMPkBWudw3xkM63QyiQWRhwtjOIBEezToczGvSrcR5Rc4yRSko7SC7sd8E0/HD5eHdUvhw==
X-YMail-OSG: KB9fRTIVM1kWnlzUySm6BVGkbvO57KQb.yZEHhbIoFjh_K1CdI47yjdFKPrJCjG
 2V_QCEKx2YeTBH8olXVldJ0EXF0Nb_Ou4E17G0twVjXEFgEcHwFVvk.mJQ4Ckbmn00XmokQWbrHx
 mmGiv9RPS.TNLmFyJMh4xZh_9Gu0zhgSCVknIXlE0RAtHxbaLFGCGAHuNKI0JADS8y6Cj32zYo2_
 G8xNxzM5lr7t9rHLxDtFinKOIluD0DBcFzD7KtMUcbHOuJieeIE5RH6JhGC09UZ0dlT4_V3V_cm7
 P7DntTJiCY60IYTnGuGulaxsbdOTvZUZha8PpeiNEz8ZOz3_ZZC5IDLruqwSUqk9Qt9koNo9mykb
 0R8naABFHkvAWRXDPNmVRgMYUlkKvOksvxTHdIAIzYIxH_WWJ.dZ1FQdlITQbU5ubdzrORlnJBkz
 skh3tL3dB4I9Tf65MhQ1.yfxdXZJt.k94ilD.HVEdlkTyrYkVrFqoXRYD6p0xKl64OJaZo2VL.W5
 8RO7Drjdt9KXwb8Aos5.gr6Yq5CbHpTPufKuPgnpvhJnbe16QJJMHKSYpHG7GYrSfbPEzmZCO8Dj
 nOEPMhBqXu3aU7n6xxwR_jti3q47Hgha8jQznQVVKINVQdBrMQw87q1TwyMjZ5KEs9Jm661BLQgY
 1Uz2mL.bv2zgTMV6FKIwVDQXfw0Hdfglr15CZ.08C2234D.LIiPhYkZbJIZciPleKlT75VCiFp4z
 SY02fP06s23t3IBU8_wQWD_shxTWLNMVF7sIepTDpesKjv9XhRjqz6Y2S8yZUJK5MbDkX8_MHwwx
 xWDfnLMxUbES06VfgBXGt3vPQx_rvVxSk3iRSOyTb7mwI7j8UguKyRwcAZmMjlwzjVGtJMSRP8ta
 vIKpeU5TcmNxG6rop4B4WwXfBkbbdxUB5.JqY6gkViwLyfnJAkcrmbMqMnZwP6KXa2BOGGM27nZG
 .TsbzcXm147_MxrX3v2KxmNn365dwhBmWTcaNK0F1U2I0eYTtgSQkP2CHr29iJZ0wPszleZRsCae
 ADBlxVQ0788lgkbSkwu1HaQphWtwoW_eUCKYlqQ5q.9Hqim.s5sapIG9pDLB.Je76uyRvZruKO4L
 GkPf8FSizZ8AriGBHwpJPp_DWfoawaVYKY6FGXWN3ud5hf5bPaOqksSyqR0dyCdsas.kfuy1UEJg
 14C5GEO3bsGUvSJerO1fSLfqv8YQ2DqqnBoZuH_IVedI9XKRen6oR7XKJ95eIAXvO86Z.92Ym7vM
 S7qqQYg7D1NKXO06wY8hJN40hDpi6F08sZm4S0yKKVSlNeWiIl_ZMxHoYIXPwDP_at039E2ncKa6
 VSLYI6xu9pEobdYlFK3qG3dyF6s2TuwvPzfXai0r8OHBcUjjzZC.BfF.TrySBnegR3Mn30BE1lNx
 pRdGQ88ALwDDWwGaFA1ctuc17clMMWNAjH3bA8MV5ACG0E0vU_sH9UBQdp8mz2OW.3S_SG5huLeS
 .NptWTykyJEjlndhMU2LEmkI2LaF6wxazxJZLoCjXbQ_nR5GXSY833W3x_kC0cASrnUCoGoy3T1E
 DlNagO4gREgC6FIzB3Eley16ST9OgtfdIkbfcb8xr5GKTWLQYDVVx8Csq0iroRMgoCojWq8VasKc
 CLnw305rQODKuaCUCXzGvSeWRK0RXguBQw_wUh8I1fPUHIDGeUChu4MQHPxJddH.ufSleAIkCScX
 39WAVe_6lqMdCEHfPwu5eNsPFGu47iq71aSXSUo_loEJ_VSz2Qr6k7_ajydfJhACILYxEpWjXVmg
 NvrJ7GGqsrf.JpHENtqDHVnUqIw_8JBLFwnFdFL6_8w2FQpUszLr0S_hiNGmsPfm.AFe8P1Z_KI8
 wh.VX2QyGJTE5UlghXvlnp1ALWNjTAMiJb4hyXiVvKADSLh4HF0QQ1LSeSWGKOwb5OgKLaIEyFwA
 6uSwJ1Q0UKZNeL4Dz1pEdwI2xsAHYqiBhI5ZJc5APLtlhPuYfmhz4bhg.mhGxVObxRHs_3NR9mIa
 obqpKLYXKI3ZKi63RBI4yh55O9YpNCYh0V6bucPJH5Q--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: c8332b7b-244f-40ac-ab20-6f5df6571d02
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-102 with HTTP; Mon, 17 Aug 2026 16:19:23 +0000
Received: from dip135.lsn.ir2.yahoo.com ([87.248.99.144])
          by hello (SMTP) with SMTP ID 7f4538acd5977cd50d7596d704016324;
          Mon, 17 Aug 2026 16:19:18 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Mon, 17 Aug 2026 18:19:14 +0200
Subject: [PATCH] staging: rtl8723bs: remove unnecessary void * cast in
 odm_DynamicTxPower.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-rtl8723bs-void-cast-txpower-v1-1-490308975065@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMAwA0F8hPdtkzMBWf8V4GKNqjWFknUhC+
 HenHt/lbaCchRVOzQaZF1FJU0V7aCDew3RjlLEarLG98a3DXJ7e2eOguCQZMQYtWNY5vTljR+Q
 pdIaod1CHOfNV1t9+vvytr+HBsXxL2PcP8RJLLX8AAAA=
X-Change-ID: 20260817-rtl8723bs-void-cast-txpower-59989a509967
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786983558; l=1436;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=e3TWMZVbvksbh9jm/1vaz8Q7iEQflKQypKIKYT6dgXU=;
 b=UI9JOLw6TnEdZmeFElzlesZiB3YObkSgyMHx0DJX1ojRTvl+bd5Z5SSgke5v2UAVdyah7f3Kh
 ejr9ABPKSpfC3Up1S4adPijyGNsQuw8VpBl8BtfucSltkW0tB9JMorL
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260817-rtl8723bs-void-cast-txpower-v1-1-490308975065.ref@yahoo.pl>

The conversion from void pointer to any other pointer type is
guaranteed by the C programming language, so the explicit cast
from pDM_VOID to struct dm_odm_t * is unnecessary.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Verified with checkpatch.pl - no errors or warnings.
Compiled the rtl8723bs module successfully with CONFIG_RTL8723BS=m.
Module loads without errors in a QEMU environment (verified via
insmod and lsmod). This confirms the module loads cleanly but does
not exercise the changed code path, which would require the actual
RTL8723BS hardware.
---
 drivers/staging/rtl8723bs/hal/odm_DynamicTxPower.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_DynamicTxPower.c b/drivers/staging/rtl8723bs/hal/odm_DynamicTxPower.c
index 398dfa13449d..d33103dd63e7 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DynamicTxPower.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DynamicTxPower.c
@@ -9,7 +9,7 @@
 
 void odm_DynamicTxPowerInit(void *pDM_VOID)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 
 	struct adapter *Adapter = pDM_Odm->Adapter;
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);

---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260817-rtl8723bs-void-cast-txpower-59989a509967

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

