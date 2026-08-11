Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CEA3FC5C9
	for <linux-staging@lists.linux.dev>; Tue, 11 Aug 2026 16:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786466493; cv=none; b=Zce/qpcHu0M/OdUnfKvGEkb0BySM+ZKOEDPfIo+2N5uK7J5vTxDei4JzRX7h20KeG8ilQgt0/2Yj6y5gC7ktF2u7TENk14AsX9MVsRh8VrFGOWMtPhNd+0Y8SEw5oDmsyyU/W4wsWqclwN1vWBaBiv0KEjvnIyPDIQIqfrFLkZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786466493; c=relaxed/simple;
	bh=Ysb8a3DpbXnoTWrfEgJZ8VwsNfSZxTdNXI71SYKIBzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=OaAeVKtPwSldMn+VMfMEWPaXnL+qj59Ju0hAd8T3uPHGHtDFScBjO80D6Vl4kT7c9W9CbR/nwjl6sDfUajPIFQU++exLBG3TPJg5uAhT3nNy6cmLcuHaPbTfqTF0XhEfeSM+KdnArn0IP8xnXeuXAQsMdcXnD+7T191N/Y5vqW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=Bkv4A375; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="Bkv4A375"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1786466489; bh=jL4vViikoNW5AWYLDnxs+Ev/S5dAAeJltxQErUwrE0s=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=Bkv4A375TZLMFG+yfunmYyvH/A/H9eb4DAqVAb6UrOXiIaYzQLWJYM48Y+0ozhE7fgIq6lvZQBXTahXrxzZIrZgbrJJqIH/7IbwW7Y3YhVMh8/H6qNNle4+MnTMWzH3AgLoCGqaTqwNSZopuF9Y+UZtqNHvbKi0+V8/qFFbTWhxqrTxKnpQn1OK1tKE8dJ/T0pViTiJWBBe6KCSATootB/VE6ErXAQ1/ddiDKVmZlcgVsODhINABIn0bCDt/MS7ImkVke0ypqrnKFxNcF9+p1CRBBLwMVPyUCKMb+WhcPdwf3SQXcNlcXMytkPPO6l/CUZ4qZambGPcm7CTRjdrA6w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1786466489; bh=JJJAm3U9W/xdK1gE2nXzZ2jRhi9DCtsnd8JZpc0g8yp=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=FBykisak+13u2bVM6rEOgMbo7Gasc/F4hX3EQCR6iQvzews83ImxmVeqCXYXGGKWvQpw0fsVy8etkGjV5EZRoVW1rv9ItCiTrnPhr4nhA1o90Rb/42NMZfLEFjuUi+RP3f7d+s9CE2CPqarYMWi8dI+RmMjnITcoz5LEWI9Fjjac/sDFRpgp5zu4qlrZhdtTzFrOorHjkOnDiWtfw67OL7sJeuhA95byS/VfnEFmhpZ2BBJJ4EB8eELCSbQ+15+tR1EWj27jkHD7+CZlCdafbjc66u4Y8jRPE8cwNUkVDe2Bnr2pRvO8UbvuzGsAensiy4V5ZUWbhhpeX1eUS6TXKQ==
X-YMail-OSG: 8a2CRIoVM1mGFPQ61hV9QCZ07t03xAlmChOINmznpE1.KRa.OUhKL_p09g7Iv0n
 rpXQOoKMBph4m5iEPERgpfYXAkCrNbKyghBqhoQ3XlSaYutu.1Jw8uXohtjDLJtKdN4tSda2d7jb
 o5SPJobV5u4nExOmQUBXKbL9aq55GbEKrOw55ilDFyJdS7Wv6vBOy6NCZx1qulunmLV.Jl1qFzOw
 mMVe05mVDf7yIqMeEkd.A9ORehsHf5ixz5KJMdsZp.ykDXWBbT1zdi5nAYLUlzhhsfdiBTylx8P.
 L88FVqagyR_c7C6VxQVDXfponX_9GX9Tt412CNVSpad44bjgMWSKfvi7mt9dwMqCDtHmL1xQv1vs
 igIm.qgl809V_Y9A3fCe8WqjlDOnIzIpP3yt5o504qMWvlUXaJYvn.ZM8zuZ7W7epf40ma5eak.7
 0KXcVDn10YZ7..13VjPlnPqylm1X5B9lE2A7T5qkk0HXsRSsC5SolxUM_NClX6S7qvkvR2E_M9Tk
 yyAS5epT5fpCAglh41nt3Cym80M60YWq3GcCogEl0IPvkShljLyz66RDLpKkaaH44zD0vk6zhh2b
 e.U99tvWp8WHu20pm0ELfGkaR4f1n2yfk8PKCMas_HRrfoonlCTYYDRccvfxRL_feLVMBart6.yk
 rx2ld14vPSTugSZaqR.VGSqxXYGM5ZjJyAyPfuLEITeHnB4F1vgEaz91oa3rdGwqHOR.m7_2tW5E
 02ka3b_px0TCAYKeO8Zs8_STAJeUpR5lhmXIqpxRigBWsM548Oa7MwlPafO.yucXmKizMF8g3qYb
 dsIiVHecoiam6gxxMqv37imwJIa9xWvhLm2C7hzpFLSKiUgL31YXrAIX3H_ikrjCRAqV81LCpOXX
 UCAYa6_9VQu0C1WQhCV_NkvqbS9A_aeWxhDQI63QIdTNTcsvQC.8wnI9siu_4Vo6W2OnYnj5Ikc5
 FSwrLIi2g1GzRRmM3sW8pXAfqFQuJzXAo0UCNldIElS0C.ahI5hbW79f4OARdEpKvl0_Z3_b7OHJ
 PTYkZdLA.._gLqmCQ3UoqBIPjgDHIxYB5Ph6zg3Ymws_9TGz6gAYwyjSg8CLn3GHyv6jOs.IKTeY
 mgmqGIe7PZxShPKl.hXcC_U_EEsej_15yW9y5bmHlBqzhk_.AdD4wAt6IJDC8v.hhizhM9Y8FePD
 uiqmQZe_PPp5bcrOssdgkhO0P3tUEZ6ClqaPwUXSsIVsRoOjprMrqJW3HbOS0JQXECrCXwAfxNTP
 To0ohZEzx65RHpeIqgJu7ZEfQfY52rmiOSP3c7hhf94MUEW2osX8f9EN79878VXRYMBTmlUq9xrl
 lvz2wNp_N.CRyBY848lD1uSF0dh7hx5WUB8vE4n26p9WjvVQMuEpeCkXxSzpgHDXrHoHWYF.Sd_n
 G3WGdQqD3hmIz98TfDNMGIFnRBdFGyWHMWuJ8fx.pHo7m4OIoxFXt32YlI5Zd4Qr9X51n8oePBaf
 LdKAWhbrICf4TsePE6pDoXddhTrPzEiCcs6L4z1_OM_b6ZI5QpYDFMttpt3aYdInpL_lCrR_fj8c
 qPEa24TmWdYrQ41PVJHkrwKupw.0KVT_mBkl.sr.SRC4avX31y2H0M5ki.pkUTVCsS2rBPZA2_Xw
 54.csrTRmK5QmAPfWdlZ9EwsOuzbPJW0O44IuJ3z5dmmw5q3TIigkZz7oiXMaVOOr37VWng8R_uz
 SrRamLKpSTBUNq73EjTx8VRlxPu1iUQjLkMaNurcgIy2dDtZMONHBUmIPatHyjfMfLCB4qfD9rPe
 q5Km_Xxm5255WX9h2mjCOqffjwmHcrZd6riddNgNZ2_WDt_E7s7jP7koWFx_gASVdC0ehmHGvM_m
 ORyBQTzp9PpjOSGEe6ohzMZ1Em0TlRS0e75RcAhadwLiTBgLEw.eYynO5jeEB0hUzniUnPRTNkoK
 lTFwve0FVMGeorh0mmPDey2LLamOQmGGTfV_Cc3oiNxE32pXTt0IMn5W2RvU25y4bmGWJSfvMPg9
 l2xrcO87FQJAUgFmJp8_zJJ4zcRzb3vooOCSofRk0Wg--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 694e8871-9e3f-46d5-bff6-aa6ad354feb4
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-102 with HTTP; Tue, 11 Aug 2026 16:41:29 +0000
Received: from dip210.lsn.ir2.yahoo.com ([87.248.99.219])
          by hello (SMTP) with SMTP ID 7040b2c35167413440f508857eb39bd2;
          Tue, 11 Aug 2026 16:41:26 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 11 Aug 2026 18:41:22 +0200
Subject: [PATCH] staging: rtl8723bs: fix typo in HalPwrSeqCmd.h comment
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-rtl8723bs-typo-dirver-v1-1-8c6a61f365be@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTsJbWMLXsW4kDLAEANkphIN4
 e4UXb7F/xsoCZPCrdhAaGXlecowlwLi8Jx6Qm6zwZbWl5UxKOlVBesaxfRdZmxZVhKM3oba1T7
 6a4DcLkIdf37f++NvfTcjxXTOYN8PgbdFKXkAAAA=
X-Change-ID: 20260811-rtl8723bs-typo-dirver-c6279396c657
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786466485; l=1074;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=Ysb8a3DpbXnoTWrfEgJZ8VwsNfSZxTdNXI71SYKIBzM=;
 b=Fr9qcmGQm7lJBpOEwCXR8gp814xi/qby1M3kV9vNolEnCl4Dkz1O/+U1nhcWCCIaErq7v61bI
 1EKE6baboBGCNAoHRGXeFyai5sdZBsDgtxVrf9cSz/TXLaZf1tofnFX
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260811-rtl8723bs-typo-dirver-v1-1-8c6a61f365be.ref@yahoo.pl>

Fix 'dirver' typo to 'driver' in a comment describing the
PWR_CMD_READ macro behavior.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/rtl8723bs/include/HalPwrSeqCmd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/HalPwrSeqCmd.h b/drivers/staging/rtl8723bs/include/HalPwrSeqCmd.h
index b81252d374ef..e50842c5c3a0 100644
--- a/drivers/staging/rtl8723bs/include/HalPwrSeqCmd.h
+++ b/drivers/staging/rtl8723bs/include/HalPwrSeqCmd.h
@@ -16,7 +16,7 @@
      /*  offset: the read register offset */
      /*  msk: the mask of the read value */
      /*  value: N/A, left by 0 */
-     /*  note: dirver shall implement this function by read & msk */
+     /*  note: driver shall implement this function by read & msk */
 
 #define PWR_CMD_WRITE			0x01
      /*  offset: the read register offset */

---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260811-rtl8723bs-typo-dirver-c6279396c657

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

