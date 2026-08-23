Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684AF2441B8
	for <linux-staging@lists.linux.dev>; Sun, 23 Aug 2026 16:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787500913; cv=none; b=hcPgjKUAeRq6cOdMOjWRY6QNwQSRzCu6r8HPtZdmKjeALJI+EWZVqKFRCLN9GHVELaCH0ikAr4FPYT9BLim7W6S1jhSXDumtmabJRaFdCyWFNEDnW/gAQ8f7ceJVC165qShRvw0opJc29awBG3863BCYtlESTv+iJsoB4xitn/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787500913; c=relaxed/simple;
	bh=K9g9sgV1Z4AS2syfVq53BwasmEzwELbCLjTe00aRr/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=O2VcID5flu+w00z+sz0IqG1pk5nB0V0+QdjJBDtpgJB/GpmyudAcsY0gciPxvU0KVqmmGnKWrgges1AXWPoEmF25H4eflLuWuYxuMtBauYvZpaCQ2yyF9Bb11RhAVhAz0emKPCXrUsWhfP73XN4JfeZXTWCAkRYRqi6HQkuAlcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=TtrS6M/A; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="TtrS6M/A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1787500909; bh=yQ9I8n/haDbNqa46IqNvXbdZZeNd73OQqwlVhyrPHY0=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=TtrS6M/Aa7qcAP6h86dx8Mh4Zt9FTpvhVgiM4ImIqYMcgH5xNOx2+6j70TnKSt/q81ip1DcD3VuYshC804/KgcVcOAuFV6ymtObZVza8cBGBrt3QWo5XOPg6iyfP9ufVe4pOQ+LT8X+aLC8I5xzz5OJk4qeqoNuaPm9tSgNr+rwNtGjsPBalu1IE+hfHO/iQC9cGn2OUbv/RctzI805kjnD3KSVsHoA/8KVkA+DMXaBfvtusPOKwJE8j2VdDSiuunLZwp14wE+Cn7Dd/y+CCLSlRxvxd/T+xJagNmFhFKMzK5CjvfM3ae64Apf4gfaQ83AiC5dzsw1IYCit2CXxcig==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1787500909; bh=6tOkH7+FqjxzMMgWhEvjFsaKTxDDMvDsSbgbxeAihCg=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=GhdjdOjRNazyvozs3fhX97O76EYa2QHnSI8TLZLuiT0dV9XgB03ztc2GU65lsvBkU3h6gZ+kyjHzm2k9mrb3bErPPOwy21JAFVg93h34u0LRgv+q3Ie9peBLUao5yM9i5lh5MLA4qjEjXo/25ZtxAEUpuj9VGYg0epRUp6xoMLDKhf7Fwpbj5aNOU7uDok8MsdwwpJQWZSte+mKd44YoPJsG1NhHddj11jucVSZeRS2xZ6zw5/MoSUsPrZzYMAbtanCDs/58ys/Vc61kxBlVf6BvxvBsH/DT12yIpAilW93GpQxPyOcKGPG29K/kNwJO50Te1UNLShC3y5BdaVtTIg==
X-YMail-OSG: Ic3nbmAVM1m_5rpg1mT5Lf5t5t05LxuCUwm1UfWw8ZE.AmKdySgICtpeRnmMpKH
 5RWgeq8XkDRofl1dDDd.wwxVn_K0A1ZenmcIcjDFSE09udiQB1APwtUylYZjWLHYJstMmk8HP.gF
 tB3PQLus28.kNvs1_rilTYwDrF.1wASLmEITjzF_cZUsER.nxrj.F4AIW03ekFK.2BxvCBteUn44
 nuT.LOCwxGXcDCohmYdkZtdIxPG4hH0F7K95GQp_zImSnMelgUvX4UVEd9puoPXw5tR6Gy2yl1wI
 xNvmmhZqmwp_S8eEYGS77yjShbBaUraOXaNkh5YO6PBm.FjSWuO0664eheOBfLufNcieGOgr0mK9
 vnA0IBlVwPC6NnBnYbC4_2Y9As0fHTcSIId2JEroibupvJOxB7JRj3He8CAonEHRUGxAQcwx5qQ.
 mcQfyFNWh6PivVq2UY8.9pe5njytiULiPCtbm1XPVCcw7F6_CsFl0ay8UVTRxlYUurCOcbZxMCAL
 UplzOghr6EKCE6Z4t4Gt4X15cGHKP6sW0zldcpnMH9et2528FjUVgrrgmh0zOwFNQK1HJ.uaWWMD
 olPlCI60HwmCeRFDCfIxT1CGod8AfOFYgY2YW9n19NlrbSQQrkjdcV9wY6e2YKdsc.9nqAVz2f7m
 I0Y_JqHKJCnTIKX_RbFTDWpbLMA7hOJqA2nfns8_l6MI02nwHVSMtsEup3X8lnE1HNnjOd_588R9
 xb8WLylkH3Uq.K6pkTuCz6b3oOf3MAJ9b5sXaTTNY08FVM.yHShtQYwC11XDl.BicsYhL7waYlve
 uG7gvstVjkI87wIi2b4JX_Gu8HC9b743UGlf1Et5N3qyJo7AFYr6j_.PPlfoGZi.uMyB7SOZH1ow
 XmfepySgfKMmtGMBSS34Y1WCHGjngfHDfb6HxFP.lmMEjTUqNRdrNNG5LrlcPrEg3M5zkezvvyXR
 FIZ4NlkJ0UvBEOJLW19g6uhH5GSiZXy3iIWZOOMhXllNT0KtWCrE88uegI9LAMG8WgETnaIEUUS7
 Jt36TvwfzUn_gJOkFcfzJHT3tyP8TTyttxwtnZAt.d_IheRmYN_2Zf1wz2TBLu0P4efzBEUfk_Qj
 yKBCIpNYMU2RTMGReymH0DEdp6MuXw1rC.soVu4k9eL9JCY48jw5w2NIRvFxi5hhgBYNmUNyKGEf
 Pl9QdYR6UnGeMKcVzghPvkPraAYk4m.f7dP2dBr.bTBexKVVC1JyOFY1ugfNeWJJZTqQq3Joo8zf
 1kGHI6NCaiTkLbXpO4x8HUpRY_z.NI8q87fABzX72CPfQSYV0hWwMBlFTqbz1MQPVFq5DNNKu7n5
 WUHUpKleqCU_XquO_KfFXbI7TbhygeNbLV5GmrWh3uzbN5f3w1q04wnuXUGspaKj2VQSRsCiQcan
 6MfMNtiVMXzfq3M0lCdnSb7cUK64WqMu.k9JhZ8.NAne98.ia.2ofklL8CVm7kCgnbpBBlNDGtEE
 KhyJEb1XP1RMtKFvZO6nbiAKJMk.uuQMt_eOkLBeEvvKcY2ibdzXiaItANoO9jmcnCRZ5EyE3beP
 ZwPr607Ezes2egXM_93XAE4nEGR0m1oYy5xUM6JH8LXQYi8anQAyeyVK4R.1LSM2ijNcqZ15pAQG
 TsGED20vRU1lfz29bQpmpzgIuv.7jeL5N1nVbWRp3MI9g2F4ovDxiODaBhXd4mWPaEIRm23JyUyN
 S6tL36TdONNP5x546KebT4nJaDQ9fc9dPHtB7JDoTywSHx4THul6Mc4.U0SeUTacHDzzdY_pfokh
 cgm1xY4w4XHrFc2KyVxFYYGfZe8IqnDKkP_x_9sqVPmcMCx7T6iG5xYl0_CfbqbcZaOc4kcrac2R
 uTSbDFdOqH3R_Bppd45he602BL61F_WV6Om1uaTjPawsEM1y5t5wsA7gH1utZMv7nSvjS7r6fkLd
 EQVB3EyklgQmU8Ty7Hxd61E3OTtWE0PW_GqA3QMZOmYWLREGrLJe_BoPrrf4S_YEYm00Uzid505G
 7GxLH0kf_WvrshVg1cpRp.zn.s7eakZPi
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: cbf1010b-ad80-4ad7-b108-e11e4a8d9609
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-101 with HTTP; Sun, 23 Aug 2026 16:01:49 +0000
Received: from dip80.lsn.ir2.yahoo.com ([87.248.99.89])
          by hello (SMTP) with SMTP ID 6dcb5320392481cc848892d330b311e7;
          Sun, 23 Aug 2026 16:01:44 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Sun, 23 Aug 2026 18:01:43 +0200
Subject: [PATCH] staging: rtl8723bs: fix space before tab in rtl8723b_cmd.c
 comment
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260823-rtl8723b-cmd-space-before-tab-fix-v1-1-452d83d8718c@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNyw6CMBCF4Vchs3aSUkgtvopx0cugYxTITDUmh
 Hen6vI7i/+soCRMCqdmBaE3K89TRXtoIN3CdCXkXA3WWGe87VDKwx9tFzE9M+oSEmGkcRbCEiK
 O/MEhu9jbwWfjWqidRajOv4/z5W99xTul8g3Dtu0rAsdYhQAAAA==
X-Change-ID: 20260823-rtl8723b-cmd-space-before-tab-fix-9d6b4298d061
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787500904; l=1041;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=K9g9sgV1Z4AS2syfVq53BwasmEzwELbCLjTe00aRr/w=;
 b=nguSXINdjDeaQu7y3conHUVmx/g6+SjWmkJwdTVRPgS3W/nmhf0eS0mqHrCwxQWnl1FK6gx+t
 BgaRQ/h7C/+DgXASAEl4Xs5wm5qQ891BPnA38/fYCtcZ20pUzuR/pKb
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260823-rtl8723b-cmd-space-before-tab-fix-v1-1-452d83d8718c.ref@yahoo.pl>

Remove stray spaces and tabs before a commented-out line.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Verified with checkpatch.pl - no new warnings introduced by this change.
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index d2b44ad60a4c..d39ddf396f64 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -895,7 +895,7 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 		DLBcnCount++;
 		do {
 			yield();
-/* 			mdelay(10); */
+/* mdelay(10); */
 			/*  check rsvd page download OK. */
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, &bcn_valid);
 			poll++;

---
base-commit: c6eb4dc5964fdf4086b73b7f0f5dc0d595fb5cf3
change-id: 20260823-rtl8723b-cmd-space-before-tab-fix-9d6b4298d061

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

