Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B933BCD0A
	for <linux-staging@lists.linux.dev>; Tue, 11 Aug 2026 17:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786467858; cv=none; b=YxKHc9OK8v71o+Vt+FZ6AktRxsvDHt+cM3o43xfhRHyfyvVQK9OmgrSGceb3ph6/kTnkJ1XwpX0jrWglKoWjvIhS0uVR97PS5aFye2J2KTUpgIdAyptT3D/TLyPn02b4fdtgmtOtRx+GekDFtxoXBix4laK9VUlkFWfO6CJ/kmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786467858; c=relaxed/simple;
	bh=0aFMTzKBJRB636h0hyjcLr5TUalfpaoW4TR0cV2F/9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=uXbc9Kt+CQb4ir4CyZN27XzvgtGduYm31XLaTFlKlANPx2095qs8GCOGLIM7x+bEkjhmtNy4dPR5PzQ+gz/xbBz/XHy1CEEgNtdN4mPT3FKYzcbnXkD3PC9IxrqArToFAD6vRbWY9GtE/b5hxnQJnP9t4SMvRd7e6AIbJ1QB9vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=XOA8BlGN; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="XOA8BlGN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1786467855; bh=wnYn8VYldpOC4d77K6t0boyXPFlqDyZGNQaMoXjZFUA=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=XOA8BlGNwP8mXOggHVqFkSOTNgTXAeo0Dc/JC/2UhazwpNIH0bcp8zUQbu472YknFsYPD5lNgvk6Y3kdXeTNNKeLqBp2dHypuvOFCnIMaH3BawrQ0G9D5BHCU7Glg2FglDB/BaZvR1S0hE8I+ktzt0msmsx0KODdTcOzfECAS7CsyX6uVgEOHeDPRsmBCZGEYb+N7CPCRQjxprCik/Ql1T/1qLdgyx+GR1d+q/zOEA8TntMBx+UOOR30AYINtYmDS4WTM4g/Q2fi8t8HbtXU9eR3u0ww/jblRCZRrCPGvaXLMLMKJt+Ui8ZebVjaQy2/sBOBgu25R+NBV3XOaCw9mA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1786467855; bh=+33Lye71PJTEjzil7EAq3OKJFmCarxdyefk7LFz6XAv=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=Dp4iimcB9fANDyKrq0atHnNLMuvVWgZ2Pbi2bFObgqu+U6pqm2uTyAhgeG7OQz8cXnsAsMaGJy9+bnAq7rav/WvGtwSuUVxsjpjjqwynG4mDIoRPgEBKTnisOqnAOh/9ruXzso61eZi5J/gRKo8H9U7T7a6TcrIORAqtgn5TWfn3aH0lCkGNqsdyRCLMSgI6YCRcJWCDm0OI23JXka+C+gCyOokZgSfRjomgH6ZuYzITy++X3IPp74r/KYNpqzeHVB/0zqLIGS+sh84GskISOUdht+DIXwGbLnbCB5hoEvtTfozSu6a/b+KyhKZwPPr9hEf8C56OIg3j5mVQ7nYesg==
X-YMail-OSG: i5V2uacVM1nx4QxKGevQhXKGllSkX2eSTyt3rAOyOhUKRopeoQGJDd5WzfzwSJ3
 qUB2FSSGdLt_pMSGUh1My3bGjbf4U4Bkd7Yw6BokjMRKcV7C4lRsQR9.ciZPsWhhH5JHCAQN5psF
 _tnFajOF0an3V8fSe5g2KbLtK703v6s5sn8DOKO2bGJJaSE8Iz7HsmKpqrhDBna0pPdSCJz7v1nm
 oXTsw9pIZWEwaDU2QsJhCFHA9uRANUdjZ9yaSaX74V22tvtOgqefAopJzfcG.4sNdpbfbI0gERER
 WJBJW.WzNW65wW3Y5mXL6w8xSu31SIUXT9N0A.hPuSHRZ5ImPB4dHh0IJN1B7ZKwAUw8hgOZq36s
 5mKCXXwjXJoELKLd0P0SF4rZ4_GJ2sIb_iqQgC8WYoe4f5VaJTiX.dZxJaakckNssf8c5zks0Jvr
 puSiN1EYJMcmKtB0J3bP9PmkX_6qkZ9FH8DsDvRJ8du.RybJzsNRbm3JscjHuVmwpHMlOZymb3jJ
 4KJcVG9GNq2rHKJvkFYUj6Dnpx1ltPqzrOL9LFLac1QN6YumnMlOyBMXkUjpstZ.X0ZaEvVufS7Q
 X9cqXjx0uDN9fL_KWNvVS3qrA7JMJ5f1sKqqd36BpKwhlbNRNsZ0LawsXfUqafIp_tA23sqWVukQ
 N41nycXA2fubML2.Apz9FSFb2pn32Whddx59aCX2jcNK0fW8XVwFHiAWYh94_WMusRCJuajbzqtX
 3YLDlAOsWCil_5kGa1ysp7qdMCFs1Xnd2YLyVOD._8V7kDjAriAdSf_ON1ciMoJG257cG8afORBZ
 lCoudWXraGVeu9l8MGRKf4y_tZdP8TR01OLI_ci_gm4.oqf2dlCSK4xQeZZqtOerQEJse10GAI0L
 2Sls8zMlVgr8LkFwz7ZOC9n_hcrYEYFOZeg6gCyT1YG0rieIH01cR9F2qT9K4omhfnS68Us1xfeo
 1md0RET.6OzFvw5KOiVrhawyPiJLLoFEahOVoDniQoASa5NGlAjNOBwgqR.c2KfdSEWykGV55rU5
 wInXGzaFROAUfaBXc8rlPla5Ct_B2u8ual_.NaNunH1DiyLCnvuN74fplyUB0p0mYktidef9qP_B
 HS21r5UlmuGOB8FmY9RyfGx_SbIhZZd.UFaVsNDmuWH5.5exRNCnoL7sqpPqmjyLUsKSWpsFv_RE
 AiJJEAPduqblwSXE3DJvx8M1p5N2DsCZlwyjvK2HzqrGPqqBDD8k42Krm0H2ItVoVPm40AyuAc3G
 Zlr1ZnvHbwWktgkGesIGP46a.3kBUK5tWmZYbsb21FaHpBQx7qEMoVIw226u7tMWTM6c2M0wguPM
 tt3vylGqjIbqmzvPhCk0uqj3OOPHFjHLC0oIKITLODs8XK0vj5FhKjxWDRbMXtBq9K205_FyLiSS
 .57ZdAdN6igm_qEUYdjQB8vijOUsco6ZoGI9wjLf9YMKtq0vOKYxClPS84Gw52HCCX6LhBgjyIZ.
 8jD3bJZbTOWNLN2aXRb9ZHKDHNEvo6_G_2F4BcwPaXyDRMPEzqavMfUNIRHeft1OFfa4Q.LyWe_d
 oX3.bgEAzFQwGNKo23jFYF_m9yj0bc_XvAns3X2RHWV3yTjcaRUMTaQf0sl6dNTZ4bVJvwxWz.YN
 TOy2qwUtrKD1mK09ykN4d4Dw4rbjFHzVzgKZPESfLG1Pu.hZpXf15NFW4m8aUDEw2wIIu6Gd3SVp
 4lshIecjzAU.HC_JJn0iUkIwu9MvvjNfoWtlqGHk1_i9oIXQpc6kTAhfggWr0VDEcFxKqJKYaDiO
 jpjpRT68WD6YN7XX4MN7NtVnlqkLh6rUDzhy_4GbbAgOFXwFNDe_3uZyzotK1D3HcgNTKaov32hV
 GAd6j.jXmIO_S70XOo9lIFBqWjPWJHVfw2KBbkvYB4zDshy5k.cUtl3iJNPPo4kWMpCTC9VbHBh4
 P7PZin_gO2o9VoEttVxCjdn5iuBqvynRLVyCHq6xHwxGu7KGkWX0xIzA0Evz94h9vqeeYcu06mWV
 dH6BDh_emxVn0_uHhyauBiTp7M7eLLHW94EE.iQ4sbVxtcLFgb0qhl43fpxktGA--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 90cf5a19-82f1-4a45-9570-811e1b6cfa0c
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-102 with HTTP; Tue, 11 Aug 2026 17:04:15 +0000
Received: from dip35.lsn.ir2.yahoo.com ([87.248.99.44])
          by hello (SMTP) with SMTP ID 91fe3ebccfea947589735747de9f31f6;
          Tue, 11 Aug 2026 17:04:10 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 11 Aug 2026 19:04:07 +0200
Subject: [PATCH] staging: rtl8723bs: fix space before tab in rtw_eeprom.h
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-rtl8723bs-space-before-tab-v1-1-433daab6060f@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBAF0KuUWTvQpNJGryIuMuOvRqQtmShC6
 d2Nunybt5IhJxgdm5UyXsnSPFW4XUN6i9MVnC7V5Fvft8E5zuURBt+JsS1RwYJxzuAShaUPesC
 g6PagGiwZY3r/8tP5b3vKHVq+I23bBzFWpeh+AAAA
X-Change-ID: 20260811-rtl8723bs-space-before-tab-b68c9e7ce34e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786467849; l=1396;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=0aFMTzKBJRB636h0hyjcLr5TUalfpaoW4TR0cV2F/9s=;
 b=IdRIKOzr48Q/RnByzy9FzbG9Fs/ACGVDuPO9OBNF5bJSWuy5gIFJACnVl8+/JPvL/yHl/pvlC
 hKMcyU9tfzKCC90VD5wHxLY8ASzHUuk9WcLnmdhfIdfz8hyaignhmjN
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260811-rtl8723bs-space-before-tab-v1-1-433daab6060f.ref@yahoo.pl>

Replace space-then-tab with a single tab between field type and
name in struct eeprom_priv, matching the alignment style used by
the rest of the struct.

Verified with checkpatch.pl that the 'please, no space before
tabs' warning was present before this change and is no longer
reported after it.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/rtl8723bs/include/rtw_eeprom.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_eeprom.h b/drivers/staging/rtl8723bs/include/rtw_eeprom.h
index 9b84105af816..b1e7ea3d984f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_eeprom.h
+++ b/drivers/staging/rtl8723bs/include/rtw_eeprom.h
@@ -100,8 +100,8 @@ struct eeprom_priv {
 
 	u8 mac_addr[6];	/* PermanentAddress */
 
-	u16 	channel_plan;
-	u16 	CustomerID;
+	u16	channel_plan;
+	u16	CustomerID;
 
 	u8 efuse_eeprom_data[EEPROM_MAX_SIZE]; /* 92C:256bytes, 88E:512bytes, we use union set (512bytes) */
 	u8 adjuseVoltageVal;
@@ -110,7 +110,7 @@ struct eeprom_priv {
 	u8 EEPROMRFGainVal;
 
 	u8 sdio_setting;
-	u32 	ocr;
+	u32	ocr;
 	u8 cis0[eeprom_cis0_sz];
 	u8 cis1[eeprom_cis1_sz];
 };

---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260811-rtl8723bs-space-before-tab-b68c9e7ce34e

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

