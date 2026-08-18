Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7AD3D0930
	for <linux-staging@lists.linux.dev>; Tue, 18 Aug 2026 17:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787072679; cv=none; b=bZ/7/VYa1LgQjQJJxlB3gagQtv5o3hT077oXlAKQmCUsnry2uKw86pxAHIKlRfpEyjAhnFzo2Xo5YolVbA3nffm5e6OcCFbeX6SqmQI7zD7Q8c+766tJRrJtrjUUTZWXgs5d2XLjVtImLRmOCLx3Z3HiXtJsEBqN+Vy7RAwhvyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787072679; c=relaxed/simple;
	bh=oKkv4SbLX3OJDezMiJebs7emxruvJRhG1jhmMBFIxLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=OL9HwRVnuUprsx3KMpeO1IwpgLaoqYpYow0pfRRwlpaC73EI56bFSFrtNGq30XAGybkziwfaEzq7fqDDIvVQ5ZeEyxisBIenALORAP/abtMVakYQ84A0OXZLGuLkP/4UeM7ok0fMW+UXgYe9P7Zt2RLqn9EqWEY+XDoNQHlb4eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=ipc42aIL; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="ipc42aIL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1787072675; bh=R80JT8/6n/sqseNeNdG+KZiFmjmSZ/Y0CnAQVwlA6v4=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=ipc42aILgL0j9dSu8nlf9yJgYMLrp5VFEKQ/OVqfA5HSvPScG9xO8I0x54x3wy8f72IkKdNcTP1fr3ssju7uofGpLzrCLa0KN9n0XUMCrwdp1OryWjwVQD/a1J626DbMpxZ/guiHEw971Tediu9e3VfHWUzhGOna62zFb8fzE+GTf1BhxBj3HWmOtT9hOhLRRs28+k17aDBGq4nTT7EqtpLz+Svuw+ig0xuFBZlWtz2QMufQD4JDYNFGlObbp4/sc7gLSzF2b+I5bghenXrUXJ0cC+Q1n4sEQj4iWNxuvNzJhhPragRxudzhT8bwltPYdZ45LkE8okQGLjjzs/tEvg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1787072675; bh=onEYDnbzepDyP8Tjv0jB19Jy8Co6NTXJILzFGBJtda0=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=hZJ/ImZJYHByoDvtYpLVI8ZAUhCdoPIZWL3+xD96E2MT3PkcB+fVpR9oigekfbkcSVtNEs79tVNt4ejJ+x+btIKg+Uur1O4+catYPAztB8quGxkw+J4mfraefYpJl1S+pO3Vy6skZiJEr2VSIrlkt+DAlXM3CAKb7EBTn0KPn+nID4v+YsKnuzoyIizB9Lsg1jiRWnMEVdmriceNMofIsA4vPZzupJonrREAccb3jS2iS9zk/F7Dz16XjIoHglYZHxKxC/T3E6UpSi3lUbb5+tZy0fdBAS3KLI+lCo1LWDRPGy/Y+ZrQQNzuSWAFDmJJiSQx0VeltNnhN9buv5ww/w==
X-YMail-OSG: mciCsDYVM1nuD4TcPiXuiWUnDhLdvfRZlH0nYuilEck57Q9Aa0TQ4mdRXDoCAeH
 6adx.mv.wT2byBsnEpERjcaRcr2aQ354T1peChf6Jbkc_oLxXTiFyvEVoQXgT1v9OiheZAxdRXK1
 0H_SzRP9eb1_hGGEp0PModmtFZFo2TwoQSwAifs_nY5aINedD.mVKN3Dn9l8JhH0P7UCprUNnEpq
 MWX22AIvzWnIXyR7pAPvkDWwsfDQnRPPVNd5M3PnEjvAsmWcQhCZ1_743pEI69UvJIYM8GBikRNi
 doVxa9gqFjinyREb9_Xzl5N9sAiWR.4EQAXM24dfTubiL0xk4B2IcsVt0_uRLGAkWqEeOhsfTY.s
 KMTXKWOS1sBJwvUnuCxwaZIf8mT8vEpI3kpNuI.FzlOBIU3AM04Byc9m5hgTJUs323lcNjQuEKGi
 FCapVA3mn_CMfLbMdvOZJqR5IqnwhPUseyJ20Kvupx2y8dXbPcAnSGHavYhGt98GLFagVmb5GK3v
 NcX49qr0qyVwGBlIENEt.KdYIoFAUuTIUiQaAIHlwCePbWMvr5CHXji8HjcXI3AvZgUBKKfYCmvp
 B6uO888.s157E3DvInrth1ho2NG_6I8OrWV9VTl9AE5.dxoXOtYSHCdskc84esmBgtPj3gxmLgIQ
 Org7b3kRLUUREHmcskOLfWIXk..t4UJPfH5dwHnp32DrB82F75bEwEp_RB_b8lxvpuL_U13FCgdv
 Wrseik63WponUTQznNVE1nOEQboVwysm6nphTUxfnaM80L3gf3EWy8SgfVXF1ZwqacVhkjCnbJ5P
 qgmHUeJpzXqJ6lf5StDeVCsgyp17V4j2m0YlSzpsHx7JCYLr_aw1kfeow8C3dMS6zvf4FWxc.ZxW
 LQA1bZBhA52rH0pzg_JV9DC_3YB_D0dUX7CLjygcXeMw3vMfv3RL_r9L4.HFroXnF1sLX9LitS.U
 e2W6QFIlQvj2fy6ph3OGi5uaGrgYqNS9O_1VRSuQHYEA3osWGXCruMOtVxeZzBuZA2Z28W8RCMY4
 KO1QtzCzkMGzR.0K9_lF81u1.JeadnXhzeQDUIz9CACALPWoR8CaHRxh9oTixyLvAtc31gV.Ph6V
 _YpRjhRswX.YEkY1zF3ipVY5BgKxa_gGPu25JouDcQQA2iVygVeyEznYU20fofTorsMXENZwrbEO
 TPJknx6jWigzQ_SoN_yMSzm1bTDRSPxAZf8d8qqYCqSN4he5C.i7Jc0hZ4zlooIRy3jBVmDhOx21
 OtvO2UN51bIpbH2dOVIikClmn4TX3F.UxXbIN2MYz_iVJxWfpB_C6LapRVHU3Zi.6aQf7yUysXb1
 E_tUEiYjZdtz8wZGwINJWi0puoZQSllxlzSZMDfLoGTEZ.4UeT8Z.Q556x5tJZBy4zGxSF.bSoVb
 iJ4Bid36h_LzLsqgWYGsFTzyarP73eMnSSf9.rtfnHMskgvYKq5lVjFg2xcA15K4.MCvmCU0pFGT
 MYWS_6sRJC56YI8ty7RFOS3oqSx.Y4OdeX34O9hT3c0m8.co1Xgr6NSlswHScOsjPYnnivfD2Cgc
 EfB8Ogdo0OwaWt9pvz.loWWtykGMIw2jqJ7cMxlzLcjkxop0EyUDlXxtv6ad4uAH95n0jMvQHeii
 l7LyQKvgvOBMUWqGZlaVb8I1bHbVJe6pUn1dyKVOq98YUiUPFfIIpTYN_5zbis2oSVpPbPLB50gA
 5zDP8YABudWy2OlC5KGIpcaAa.FTIB2s1Bmg7GtyuKzGf3cOqw5F0a2Da_rR6ocnIdvSUAC9L04S
 oohBGWZAwBzoxYvuhijWGq5dz5Jc_5osO0_MX8va1bbqwTKmjUhIzamPcTUBD4m71jtHzCl6943l
 pchgD7mGuA65FZDtP73.IyuAKYBxt6p5I4lW6.xZfTRSDc4JgWPbYpB35CyPGu3gjTOv601UzEb4
 QH3cfpvNWYoATFFwPEHzndK5TW_l38kchhLI3H0pxyRrCXS6Si2hGyYP.uWHJI7nhly.SPyU7C.7
 Dac2m29bjytrlFBVmMnI3rFe.M4Ao5NYmCwn8Lj_NRYSDH4JiL7w-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: ec140948-1f05-4b61-b8fa-d520bb84707b
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-101 with HTTP; Tue, 18 Aug 2026 17:04:35 +0000
Received: from dip47.lsn.ir2.yahoo.com ([87.248.99.56])
          by hello (SMTP) with SMTP ID 62249549a0826219c07fc95bc8b70caa;
          Tue, 18 Aug 2026 17:04:30 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 18 Aug 2026 19:04:27 +0200
Subject: [PATCH] staging: vme_user: prefer snprintf over sprintf in
 vme_tsi148.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-vme-tsi148-sprintf-v1-1-f48acadaa938@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDuQRLGJVyldaBzrCEbJpCKId
 ze2y7f4/wChyCTQFAdE2lh4CRn6UYAf2/Ah5D4bjDK1striNhMmYV1ZlDVySAMqU7ZP52rltYM
 crpEG3n/T1/tv+XYT+XSf4Dwvvdk2P3YAAAA=
X-Change-ID: 20260818-vme-tsi148-sprintf-023a79960c19
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787072670; l=1683;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=oKkv4SbLX3OJDezMiJebs7emxruvJRhG1jhmMBFIxLw=;
 b=3/rHBV0RJpGk4ne5lkUZ2OIK1d1Vplp4yGyWg8OjP6IWjfjll4A3q2g1HPXiNRSdExPMRoLRN
 b0mU2bvFXSWDCSjwI0e4rsHgArxgExycZMq1Qs1sFoIyWskGdiD97ek
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260818-vme-tsi148-sprintf-v1-1-f48acadaa938.ref@yahoo.pl>

Using sprintf has potential for buffer overflows if the formatted
string exceeds the destination buffer size. Replace it with
snprintf, passing the exact buffer size (VMENAMSIZ + 3) that was
allocated with kmalloc() a few lines above, so the write is
always bounded to the actual buffer.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Verified with checkpatch.pl - no errors or warnings.
Compiled the vme_tsi148 module successfully with CONFIG_VME_TSI148=m
(also required enabling CONFIG_VME_BUS=y, previously disabled).
Module loads without errors in a QEMU environment (verified via
insmod and lsmod, dmesg shows no errors). This confirms the module
loads cleanly but does not exercise the changed code path, which
would require the actual VME hardware.
---
 drivers/staging/vme_user/vme_tsi148.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
index c695ad9b4ca2..bf3589118da9 100644
--- a/drivers/staging/vme_user/vme_tsi148.c
+++ b/drivers/staging/vme_user/vme_tsi148.c
@@ -744,8 +744,8 @@ static int tsi148_alloc_resource(struct vme_master_resource *image,
 		}
 	}
 
-	sprintf((char *)image->bus_resource.name, "%s.%d", tsi148_bridge->name,
-		image->number);
+	snprintf((char *)image->bus_resource.name, VMENAMSIZ + 3, "%s.%d", tsi148_bridge->name,
+		 image->number);
 
 	image->bus_resource.start = 0;
 	image->bus_resource.end = (unsigned long)size;

---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260818-vme-tsi148-sprintf-023a79960c19

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

