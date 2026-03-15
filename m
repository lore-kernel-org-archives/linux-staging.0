Received: from sonic312-25.consmr.mail.ir2.yahoo.com (sonic312-25.consmr.mail.ir2.yahoo.com [77.238.178.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D028640DFD6
	for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 08:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.178.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773564058; cv=none; b=Rj1wnOB2xAUty7m/L3yh/z+8E/zhPnD1PhPtoSVtpCGJxGmAH2MCeBy7Qc1G19azbBUTM+gdTxOWK89sRcL+oNRNLY152THGtZxQUQt8vWBoQXmz2KHqdzBbYkRa5rBLgJIaDpon5aMajjGoIPgHihpCZIQ6KbqAjw/ZsZIuyM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773564058; c=relaxed/simple;
	bh=77brsUdALMVqk5W/8ZvPjHDSWi23UUeVVSRviNwO9Ew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=gJ35zgQgsj0qNkXbFbB7vSgWBh7TCg7YEXY7YqVynFb7CgBftYC4KLW7p9OWx2Ezlk4OxFosbFniS4GAXfHbRJB3fFBa72l/UTUrTgEwpXIEul/QNitjvt17T0u8/yr+Vz9FeMM82CYzBd7uQVnY6ieKHkKCcxzEYNjXQLh9jOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=pVOgCq0C; arc=none smtp.client-ip=77.238.178.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="pVOgCq0C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773564054; bh=p/M00+GdOANlk08aXMwS5N3HoG10K14ld95jenex9hI=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=pVOgCq0CJfCiWigTc5av/HZoZjKtvad88YclcxmOHjIp80qfxQYvxdudQmGsXzDp6ReQJgL62MFaJSoYAe5tuX7tovtdy9VQ4oeGl4u8BhdqYg3l/FPJSDT0rdFVshsEA2piorE3TTuu643peFh60uoWE9MA4Jb2ZKjFLnQ4h8xaZ17alz+I8wpBQ1ke5qe/icQhYmmLJsJJ7wmTzbJIzc/A9iqGocKBXCoxR9z/8P3G8X+YKpoLzGJG5xnJtcz4eDZY6hAjZuaLh8Unfx89Qv+BRG9cmqA6IF4oslqkIcf7i1Pna4AG2XMc+mseWad8JFshWj+zbCPnm+l829kghA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773564054; bh=pKyByAgpzZU5x/zynWaOzkJtYkJLlYj3km1uT8dBxwF=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=GO9WYxI2BHh9pg+dQ4KZRib4ghr85iu2KL7X3CssORXGL3wud5wmdhd4OrrLxYnuU63SkP/8/kqVwe1vpzgmRgWZ9Kn869y6pFI24gqM1ayeyBIgLIfIJ3fRE2UI81P4CZnXLrWClyI2Jx+UcBkqMk/QJHphJUveCw4wp0ptC67MEHS2iw2y+KMvye2Em8zX3bWMYXGLZXIS9fw64tg1Y3HcOGuz2CosehwLZw8ipeIgrdpioDnYaekB+n6Ud5j3pD8JM/uZOzOKo6nY+bwHKBzgalEV3HJiKLbrjPHRsZGyoWOx6fQuqsnsLPvSP5qXHaB+L4qrQE9/3laLioa+Ww==
X-YMail-OSG: BE.j3cIVM1m7wsJO2ufEXkXqDpWNhUIb_Y5O58LnDhbav8JOI458vcguBxouxfM
 eHqFIlPZQOxf.eAXUZKkQVmnPSbdmiL2ZNMOcIidKZXdLpPWrLNEFbeSfEXNR2sIR_nDqPecx4Jh
 PwDa36GD18fYplDZFdrS1LwF_6fvn0YmwxBR_bf189HmwDUAb4Ov_bOliJ9pC5.6fHypMhba6bCY
 _8cTQgsP.9wYarPDAh5E6Zuz1OHWwfHJ3Pbi3fF876s3aylYQ_s3_sIu1qMa_Z3PqG23hr87_ha1
 7Rw1f7F89VXbWNRJyN_3bdUm26sdqAd40074Y.NGNtAs1FQoXaZV8ux.mCz.Ce4jDtzoCdfQZ8Ve
 M06qgu9JfrrUL3NLxAtuXSbAeZnU__5PdhuSSppQm22Mg.BFGG8TgtPVV_dsrRbi3kxKmkVYH9Ph
 pOP2pxQdOZsGbVwt4SlnWDzyqYl4nq0DRSo6.GrUc6HuKR1CDa9LKJ_Ymb2GkISaHuA74KLMzKk_
 n7_uCrXjdyf80ZLlqiDhbfFiqHiXE6XUJTlwdm1YJz5wcXtkULkUau6_o0hEvRhkcl7vkB3veMys
 joHWz_b9ytPpIltOzVrBB2icPYM6348ymfXjduOajKFvjiL7N_fOi3_AaXQdY_RKhQ1OJ91Pkb_7
 tickRrlI2mpjYcTNRBlRdzCJRIpfSo0OLkByR3gb9pUyF8j6JWCYWAD.mJv5UJYH.cyiHIf1GKsU
 E_zcEctt87Go4_FrriOCY8Sq0WleQR74j20nhv.7ruzVyzPEsCmwOiwPWKIJyqPK3BrAinpQgNNr
 fIvFeiRWf.e4UVl7tx9ZtplKdFIJiamt63WsGvBpT3UxzfTg0.A7uCjxqdqZT_gTzbamXTkCXwLb
 .Q1ajYf.ouutDRpIIRhItKv._hba7diybv1Yf6GhcHD6L7SfVSk8j80eq49SE9NUAKCmJ9ifYW9r
 b1h6cfOmpp1aCnfWlFtC7GEx3HEh3N5ssT12G2e9eTjFr2RFB1U2sy9megWLmPI6dn91tSDqwgL8
 wuB0Wji2d6vu1TT3CCxDdbHM8Zwf1mAsZu0ID3TjrvYe0FCYyEw8zu.luGwJIUsL6GfB7fAwRNYJ
 IyIp7oat8PNN5C.QJ_Z7eZC9VnYZSHDMVurEKOjW2hcYQFoslLybcMO0iv3PCCKk23PZSGlqTeUS
 X2OEdAXNuB_6L2uGq9Bu8O9Awld2qBruuJoyS0CU.yvjPgls8ZvnTJjk5GWrIcstQEdqZAwZ9_8k
 BwvkzenYf5pxAZIhTuz5cZc3MlWzl.BI50xTny3FbMaa7kBB7VzqdxBE2YOhmgleOQzBFi9TRYFC
 DYwJpJIc4lK_XqoiK07hMehWcG7QvI4LTCrdu3jhKXwo37xWvB68x5HkdqpxVMTcBsZcNoroCfsm
 2kD1GZJYHrVx9ov7_PM68.qMQ5.7TS6vJMvDNY8TAGiHNjyaxRSSE0Xqo8tJZ2SnOiB9wWZdJdUl
 zJZHTUzOK4GMyg88mgl3J3QtBItHXUeDr9Vb3.rBse_xdd5T3bu2Sm4udWHnoolWUZ2QTZzP.vX8
 gyj6TGidccN13skah5T.jKicOQasMWMtB9uLBlo1bZVCIfYK.Y0Wrnl9qrM2jWtEHRDACFWLw1Jy
 OaKI3VyNekHbuJI8EdTLn7KeSjtyCuE7rcq.1C80X_vs90ahD_9Q8MnyNOlSipnH760ZYSAGb1r1
 i86to7p5NTe9Utq6fajkM7ayZ_MXPE57mnMecVsS.g4UoqTOqnCAsetsAED93RdpzCJJ.vlEgsdf
 5HVT8M18vObZDvCFvyaF3vbLtee3FZxEkulioGW_KHvghdDp.KwsQAnaJs_ajQuU6jRnFrUkHGaC
 f_DJ5OER1q5x5NlxR0SAf4_FqHrUDcMN6SePQWL7x4X69j35IryrIPsJ5Q7HrB9MQSO9M8.dZGQc
 PeVrBseKnkhbP3TTgVKY0YiYbhZ_VovDOJoKkYfAh5TudZAHjU1npi1O3DDVgkTmqqlyDExQL2Fw
 8k6g2c73bAO2iAD0gNYdWPURkMYMPiABkBfh5XgdpJb4GIQ9bAn9pnJuUo648JcRZY3ySmWPju2_
 lANCJtgUbhwSQG_qKSOyF7kfk2F6khe0zDmWe656Q591CjJlYun1Y6JL9eyFRNqH01paB_xniDen
 MwjwpZa.xrN4gSv0cXFR89DoFhTg.oXMiaPiqTOhWOJpYAp3Bde1.wteiKfpUoy3aZsqE4M9xVpC
 B3LfGusaiWv1_ayV5.U.G2GX_8suv5_SbWpC8onMGI.yobbhP5ljtHLs0S7iWpmkjFXdWSyYObzy
 aXjlpneJMp28LtwXezVHqEISm2bkzPeitIn7s
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 6e995da7-dd1a-42c0-a9a9-3d09e3b48693
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ir2.yahoo.com with HTTP; Sun, 15 Mar 2026 08:40:54 +0000
Received: by hermes--production-ir2-bbcfb4457-k8sgb (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 25fb6989d9d1f1fc9da53d8daf963e14;
          Sun, 15 Mar 2026 08:40:50 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Sun, 15 Mar 2026 09:40:48 +0100
Subject: [PATCH] staging: greybus: use %pe to print PTR_ERR in fw-core.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260315-greybus-pe-format-v1-1-d923fbed3097@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0MT3fSi1Mqk0mLdglTdtPyi3MQSXQtTS0tjcwPT1FQjIyWgvoKi1LT
 MCrCZ0bG1tQCVsnjyYwAAAA==
X-Change-ID: 20260314-greybus-pe-format-85993705ee22
To: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Alex Elder <elder@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773564049; l=2233;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=77brsUdALMVqk5W/8ZvPjHDSWi23UUeVVSRviNwO9Ew=;
 b=nm0Gj6Q9kVjbrTVaIDWieh0cTuIimPbCN9Sms9AVOKh2Pf7Ksn14YaPJEUGUbCVlMEQjc5x2C
 sg7kkDvBIzgD+opRSQxEgL9CE2S6Q8L5YP5vs0pemkQ3tZjwyutqMlN
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260315-greybus-pe-format-v1-1-d923fbed3097.ref@yahoo.pl>

Replace PTR_ERR() with %pe format specifier which directly prints
the error pointer in a human readable way, making the code cleaner
and more idiomatic.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Verified with checkpatch.pl - no errors or warnings.
Compiled the gb-firmware module successfully.
Module compiles and loads in a QEMU environment.
---
 drivers/staging/greybus/fw-core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
index 2016a74f137f..7053afa9ab3e 100644
--- a/drivers/staging/greybus/fw-core.c
+++ b/drivers/staging/greybus/fw-core.c
@@ -112,8 +112,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			connection = gb_connection_create(bundle, cport_id,
 							  gb_fw_download_request_handler);
 			if (IS_ERR(connection)) {
-				dev_err(&bundle->dev, "failed to create download connection (%ld)\n",
-					PTR_ERR(connection));
+				dev_err(&bundle->dev, "failed to create download connection (%pe)\n",
+					connection);
 			} else {
 				fw_core->download_connection = connection;
 			}
@@ -131,8 +131,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			connection = gb_connection_create(bundle, cport_id,
 							  NULL);
 			if (IS_ERR(connection)) {
-				dev_err(&bundle->dev, "failed to create SPI connection (%ld)\n",
-					PTR_ERR(connection));
+				dev_err(&bundle->dev, "failed to create SPI connection (%pe)\n",
+					connection);
 			} else {
 				fw_core->spi_connection = connection;
 			}
@@ -149,8 +149,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			connection = gb_connection_create(bundle, cport_id,
 							  NULL);
 			if (IS_ERR(connection)) {
-				dev_err(&bundle->dev, "failed to create Authentication connection (%ld)\n",
-					PTR_ERR(connection));
+				dev_err(&bundle->dev, "failed to create Authentication connection (%pe)\n",
+					connection);
 			} else {
 				fw_core->cap_connection = connection;
 			}

---
base-commit: ad6bb64332bb4297110950769ad5af52791e33a2
change-id: 20260314-greybus-pe-format-85993705ee22

Best regards,
-- 
Tomasz Unger <tomasz.unger@yahoo.pl>

