Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3C945C719
	for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 15:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786548637; cv=none; b=dDcCmSz04atVGkQSoCtu/DlgcfSfFXld4yLelTw4CYCQ2xDApCWWYyfYQ3NU67NqUfzT1OfUQdvhJuIoc/kdlG9qgA+O6UVvnJ2ZAPkxNdYg26yH1TD8rRXhksCo61XtaXfHpwVWMvVw3dzDBn0KYu5xAiaSF19Bx819lWSzSyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786548637; c=relaxed/simple;
	bh=KgNiKtC5KFuc1wDCit6AyEiSLuN8mQ2IgMB1hVpvO8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=FlA8tLbbe9XvBMxIx515934z3KDRGCIKyjuVuqCzRMWNISwNAIjEFQ8HbHdL6KOKPck9qmI/XDLpx+qw4dIHEoQrLb1mV0tXsrLlWnCKWSc6KHcwmNlqgnOkEMsXJhscVKBC8s8A26mkLAfCl3Awdq9Fyg9PTG9ck57O6jb7Ews=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=LbjYcgX2; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="LbjYcgX2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1786548622; bh=iJcYQ+i5eZAqt9k9URDpi12HLr9WvUz0Om5uuQ1CdcU=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=LbjYcgX2lthO4wagbur/xBB0RvichN+Bfjuerfpi/+lmiDHhkoQTosMMfxt5mIwCK2QHszZtOx842eJCzo70e+4ATE8rQN0fhS74YhHkn9u0JmE1ObbIj6HDgykPxBSemQIogFmSsNlyRs0YJiuPygWV2MTmJFJsUOrK3XWexeNmuRgvL9Vgs8uIM8iwo/cvngF9U/PYH1N6zJJpVOPI5NnFVajXGsemT/3yCGEzqAXlsBZnrV9uBWrA5r0I1FQ3Tr51ItKAi+npBXNilrn1lebfYOAgoccFZjBgkun+vY0rRS2sfwUVuEWQkMrXYMMx3+ORFD0TiSsT1LkFFAvQrQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1786548622; bh=pUEqYu8vvE8e6eRE+ytRKmOHvNaU3DPXZXwqhWLBhVA=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=HwxeLsAgJy+mKZjJLCvBHeptrGjr6F59CVjrJxvTBviczZx3tnsIhwFZUEk0NvuEZ8bdN1eYsHJ6Vz+R5ImwAsUF/khqsLebSX1MkQqgoiztLn3g13OznWs2o0MYfObGduhc2RkdJiT1meuK6Zmz5Exxhp0tqk1Jpvgk6a4OgAxg8tNAFGAQx8fJUSX31Gg1F3zh81/AKaAk2pdQKrOllRddLP0ZV9KZjPEeDiXPcDKUDvdseqkktdMzCfdGSy8IqMxAoNf+8mc4o10ZPTwWyYg8IxRte48/GmsoP8xUREtF218hCnvY/ekBqgyKRLL+A1Shud4sdrkfhe3j0wRdYA==
X-YMail-OSG: UYvm.7sVM1mjHl062U.kGWmgMAykDG.we5534BwxzfsQ.tn0eI5dY3iRz2ZgzCn
 0mwyzg0Tl50To4zopWAK6aLvXyInlDrPhu9GWdzvPLZWV1_WrpR6Wxwe9TwlpU37WMw0.KJ8DVE0
 K28NPgEmBF.xpd7RDToy8jiC4o21pnCcrIzl.lTkgenuO1QdVJ3UxY2gqpVwUwrxOBzV3bgcLSzn
 3Dvwpsd8_wMSAavWJPPhxAxFy3IacBxnOGV9.2pPGVXbAzqV2kwF9U.VDvh6UwlD8sAC.YGcOYGZ
 VCP8akALzLbvR.6C35sfOWeOCRo9_ALYlKv5C7_VRRSsrLfOrzVUlWblVDUpHoMsDyAviLK8aiQq
 NJNs2jMCbKVV6ZSoOu3AfbluBEgW5zoPORSd4t0XAJ.kVaUqGBm9ixucPZNMdoD3u_8FjAr8EYF5
 zSNDoBI5ZIvRflAZ4x12hGsoQtdYpaMj8HrJQWTjTNPLiipwktbng.ebrcZvcHG8xZT1H0.R23hA
 D81dCYYg2BvwXY8wQnBmVLdLn2Wqc3BajG6LoeRsSPNSpXIgFh5cD00G1GDjXvgQv.VXuulFsSoR
 .kIrkNqw.W1PdAZ9ys.SO9lzjXL01FVRI1v_GwAdq5kJQxgQudc59LTM7iaX3qPsRVmYEy6a6TFV
 G6N2VwbFXkjOjj.XyNEIRGhLKVhNXbOmQo..Z1m2tT2Qppe.oNi9Ql_b3clh1YzAjhZ0oGcLgzCp
 HU9KNY0bTzr9MO32E68LpLZKwDMzhCMKr91d0PvpM61aRsmfLm9MLnoXjHzh1MDu8OdOFaGOwIUE
 X6v7Gn9lvMWk1XRTQ6YjTuqTLQ0AKSFX7pZXBzbfbggbsQtaNavES0kb.U9x9IM5_aqSB4gp7vw0
 bfexrxzTZ6Kn5Xd_FmFHP0__GxUw2DG76_1kHpSHXSOwzO2tPFiO1__qapjv2ohyPnlKY.6KW9KX
 0BYoe86X.g2CBzEC3d5DeEV755VpsBTS86uQqP_LN3QHs6CYPmOFVNzZl8m3zrxZGm9A8yD1QhLW
 UqvHevkrDHhSAzeuYDrvAGZ392OvEaA0WgghEw5UljqFT6K9PFblM3MJqeHHF2KFDiic7Qwor4X2
 nJpKeHClJnuKekdbf9gO7I.b5CZa9U08WPby5jDU6UZ9zuQp3Geoo9MehNx_DaEth99pgoBiTPwW
 GpZdkGxZX9RITaPmIiK8Xh1K4ddpeURaVpn3twmN_ZLRGtNFpMAmFjBr_Jb3cYdXBMhPkvIQn3Kf
 1YoVAUku1JhrnLZV9l43OjiQqrNAML4iVsZc628A2UEgyJcPDn5eEk39X_IYZh1hbc2lUqgYjYYl
 kPQG3dtUgdgAej1NxrXieS39QX5zCZXbRuWW9oIiDus.XoQH8SL.jXkBOsxPDchAIMAkiGMsOlLh
 98AFk.wYtfSTCBoIpAV6t1rV0wpAEin1KVgGrJXmTeq2ys6lMC9ULsyVxvCjwKxOPdqNKA6n9Sh6
 wOY_jhTnV6.MgpBJDmKmViFhkT3qqi.doauG2Qc4PxPDZciGXYrKnkK49ux0gH6E7cVceAojhgHJ
 PHJ5SCo5xuXrlshaRr_z8oqUWvVrh7RSEfdFFAGTdwa7uIg6mhTmG9Xszr2C3yq.arFh35ABokAN
 kE857nBZVXmGN0Onm7wlhPI8qYSMkzc3rgPiULMejkRAD7EQKOTPWvdoodHT4uGu7gFzTf.GivDp
 oZuKrzjYLMUjKJh54M8gYGyIBAyw1Y_h.MMUx41z1UCvxb776gkZoSbaLw6lmUvwH0dwNw4Pvfde
 iFg2jm3VrK670rlNJQg.sgN1AzMh5acvB7IfAWh3dQTsRM71HAiLOhd3ZXdGlwaO_XO1yM4P8ZIq
 ARSYI4RH1v7pyUjtIoIM9JOhF7KigZ8xfy1vTMfpiTnvhvvg91Z42sNexCee.suNRLqXOMNsZhu9
 QU3KTlYXNCgYWEg0WP1pMFnx9yI8dcK..ihfmHUVqu0Jug4C08_N7NLVfGFofCDSI24eTBwSM3yt
 ajFbk.E5raGgW53_Exa48_8qSzc54fVOnDE8d5fQXO0P4fwwoag--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: e395ea95-2952-4a9d-9233-0c3ca6aea537
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-102 with HTTP; Wed, 12 Aug 2026 15:30:22 +0000
Received: from dip29.lsn.ir2.yahoo.com ([87.248.99.38])
          by hello (SMTP) with SMTP ID 73e725dd6d55608abda7fd226f05cabc;
          Wed, 12 Aug 2026 15:30:20 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Wed, 12 Aug 2026 17:30:17 +0200
Subject: [PATCH] staging: rtl8723bs: fix space before tab in rtw_recv.h
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rtl8723bs-space-before-tab-recv-v1-1-7892d817ab59@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQrCMBBG4auUWTuQjkSLVxEXSfpXI9KWmbQIp
 Xc36vLbvLeRQTOMLs1GijVbnsaK9tBQeoTxDs59NYmTk+taYS2v7izHaGxzSOCIYVJwCZEVaeU
 o3g8ivYcTqpVZMeT373C9/W1LfCKVb5b2/QODGiNngwAAAA==
X-Change-ID: 20260812-rtl8723bs-space-before-tab-recv-b255f22d5e02
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786548619; l=1445;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=KgNiKtC5KFuc1wDCit6AyEiSLuN8mQ2IgMB1hVpvO8Q=;
 b=gcJ6CwCqKY8hgNMo775JPRfPrHRpiRKgsvsrFY+dP/s+8W2mhRpH9cYV/p56QF1k/9D01EoSy
 WRhGEnbaDdyCZrA+4SiGGaoM/s5ANAJ6Gox+KG4byI+z/YkZyX3Emep
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260812-rtl8723bs-space-before-tab-recv-v1-1-7892d817ab59.ref@yahoo.pl>

Replace space-then-tab with a single tab between field type and
name for Cfo_short and Cfo_tail in struct phy_info, matching
the alignment style used by the rest of the struct.

Verified with checkpatch.pl that the 'please, no space before
tabs' warning was present before this change and is no longer
reported after it.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/rtl8723bs/include/rtw_recv.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_recv.h b/drivers/staging/rtl8723bs/include/rtw_recv.h
index 9c32d480a20a..153b43de9d5e 100644
--- a/drivers/staging/rtl8723bs/include/rtw_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtw_recv.h
@@ -75,8 +75,8 @@ struct phy_info {
 
 	u8 rx_mimo_signal_strength[4];/*  in 0~100 index */
 
-	u16 	Cfo_short[4];			/*  per-path's Cfo_short */
-	u16 	Cfo_tail[4];			/*  per-path's Cfo_tail */
+	u16	Cfo_short[4];			/*  per-path's Cfo_short */
+	u16	Cfo_tail[4];			/*  per-path's Cfo_tail */
 
 	s8		RxPower; /*  in dBm Translate from PWdB */
 	s8		RecvSignalPower;/*  Real power in dBm for this packet, no beautification and aggregation. Keep this raw info to be used for the other procedures. */

---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260812-rtl8723bs-space-before-tab-recv-b255f22d5e02

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

