Received: from sonic308-44.consmr.mail.ir2.yahoo.com (sonic308-44.consmr.mail.ir2.yahoo.com [77.238.178.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2828F3EBF1A
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 11:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.178.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771673787; cv=none; b=kELjW4a7zZgjGB/TWOuCzOFhKf6eZpUyz89PBIw2UVAjUTGe3Lkjmgx3aJiejDYf5VjoEhO9pL0VZRtHXXBAxWlAg4L44IGwQhqnvtS+mftdwQwdvZZPHu2x6mCoHuN7LrImr6Sj1uuFd21ZpmlhuSwbir7KcFce1e61mfJcraw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771673787; c=relaxed/simple;
	bh=4MwzXzqbC+nB4nWuyQ2sDY2zfzYQcnEIjEDJxPnsK1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=tG8iSlrj7ednbXtHpJfm9f+A1H3TqpHS2fKdskDdNjxhCdMCepa79UsCm51J3XLoBZuY6+dQVf+bB0XZeam4y+4/2feOCsxTP6ce/Qwkjr5sqFO/dKwxnkKuE3LUSEhawbpQDblDIScQgjGg0Px89oDfKr7ZFGj70/u3uIdRijA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=lHCePMSb; arc=none smtp.client-ip=77.238.178.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="lHCePMSb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1771673784; bh=EsmR7eOA+/s42igq1qgKvvvbupv7+iotIZrcUsJayOc=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=lHCePMSbyt+yxS++O2tO8ZQzrFP1WKeKP40h9bY2ZWdJ55CzcTOWWugNANx/xYVZl1JAR3XHqqIsgLkh74Qf5WZnjHCaQPJF6lZEkGhUi1DI0m7wG9ccQRkW0U69YGElSSVGG9gXTLBw/Lv86ClwrT2F2mcNSoeQqPMFJ0EDKxroX2UO/GbJYjhXKGoCgeI7ElWElwrcsqTaQs1wH9ry6AZQXh/yQBzWjNmC4FpZS7Zat7QPsAE+wweCq9fO3jSnfPvmWvtn56nSW09J8P85DuNYs1Ts2EUFtKkHn1G/5XX+1gyVtAjcZWqF6ETbc8iVnecocqqvxw8Lb18YWHVl4Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1771673784; bh=FDvle9hHuCC9TmyY6Bofn/tTxSOJvrpyFpIouPTc7nQ=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=Ct3lpOaJWZj9BtQkQcmgzyZRRkl0g7/F8RXhnAohLINdvK7HZmgZqNYfpu+9ETbhvnBQbN1D8unq9+4vfH0ak3fAlji13J8++p+Dcwfp62f0ExuhWyXaddV23JZuKzBdYkuiYWbcyRt83H681/XHwL7vjsFh/4X2xrqNoRs1xxKXy8J/ApO6S9rphW65L5WENf4hSPk/vSDRWwlWYD58SM5ZOCgl+G0jHgLxDOi4YRMav/D583HSYkiftO174hgNg6pj/CCYEIuLddtMOnfSRMP8nn0PXErFrQ4jpaNb8eF9gXKprqaWufPwrr0rqEf0vRKdJtpLg5gtYxs0XAP3oA==
X-YMail-OSG: vieHaLIVM1nexAXF0b2aLKqWLbxCFR.utzTw.MJ7XvF5RlWO6mliyYxusUtRkWZ
 slFBLGD2xoMCuKBmzR4tgf3wQpdEV8gPCembgxfEKR0rnjVIxIYxDuPKVWr4LzcDsWVxEQ3xs1mM
 pS2S730i4jPBr9zMc7If2Ytn_ec5S8vOV_6_3OaBCX1jsm98MaJsaItnVu5IvD7pHCS4b_iVtl.E
 jV8eAwgHuPPm7E.UdrSFKz22OTGBHMg6sFZ4.u5YyqXMeaw_REIoMvtGERMQfCbNMSR_w6bPZ6e2
 6HGTmO0NZZZ0Gt_vQOBnuSF3HyrdWXjQg4_ED.jcShgpI9i9rWufuJHRHXpUuN2g5AJ_3IZKsBl8
 GYUh8IIcX9BUcYIaRco7dkbmwD79IWADEQHzUn.o5uhNnds6BlFgsTwgQphlnzCDD1nkYMVf7zYI
 anramKFUEl6G0PwEr6KhyPyhP3bRvBHW9mA8Ipver8W8bNf3XV8j4A37a2NYRddEZM7f0oH4ew11
 FMIOiGqB_PNG_h.tzqLOimjC83_xq606acPYKoyCLrWTwbPOIikUZQKv_jcLyylTqfpzeM5PZto_
 .YQQ3xP4vGsK3Y8v4f0u2.aKvlUYgl7aPUwQR6cW7bY.bABZ34lx5i46Lx85b.gbjvp_Rqwe9cls
 xmJxgVWHHtHUBpeBDnG6prsR_Ahh75Wx.pH0dMvhk5r.T6jiziUnzZ_f.cnUQOV0JPNeB7UdVhhn
 efDOCLJAhOTDamVzLgNWMnzo6FzO1nTu1V3Tka25lpPkTT_9BouAaa05xjPKSQLe9ZZL93tshqEk
 tYBVfAIxKtpe0EyBVNR965THqTfuDyU_RJTwHWiGbynraVik1uujUyaWPtdZ.7RGPyio7JDednbu
 ENHUesbjPZUlmt.i1m28RmpOW9FZrju6s1dv341WAqfIX2Kuklc8YdcDJ7HCAa9Zc7KV8z6PELja
 2_FXxzMicAED5sjk2Yz7xi_kJYN6rBgqAyWce60UXjCKxSDOxAh4lnE4fqi6dhTGBGe_CVovZBK.
 3tRmu55_8WCAuNgNYvWaYkA6tfduofIBPw8dKHap5HT1qQJEMWI7jOYk.29SoIgDRoBT.SND3pI4
 RHBTbbCiUfBcLoyj7o4In21QWCahFwvNfk0QqoNrYXILsAsVT68TZFZMDQ1b7zYOx8uR1Jhkx88l
 5aRKmd0goPhYHQRTkuGEwJeew7JpDr.rQaFDrQLyLzbTPmTSe5.2M63fibeqwE5tgjQevpjmXNAJ
 rInQ9DJdEHuJN75zBzR5FRQd6AL08Vx9.GW4OiUv7oZwTFwSvHkwwIUV.QN01L4CWwpAZ.1LbiZi
 tU5QZGS83PBf5N_t6Zy5N4ufcB0hEP5yVD19r9I6hBBItQf2_9jvRsZ.EaXNTNvW93STiokufxa_
 AsE6ApnrySxO8hXObySNhoqRlZDd5Bt3iBnIEqw6W.5p.9eCQq0.xvXwbBZzjOHQ7K.DrgkcsD7Z
 R4I3Araf7efV3TYj2NBtje7eSQyyPV2boCAc2KBEdip_6CmVjMkisWdTroJiCergOAfgQ6zA4yk4
 8OjFypkk.NB11aJ3UR0gnwIwoEhP6PXaqDeswW6MLQc5fYhAD0ajD76qZuP6YZOMr6NLXU9jQh_V
 Uc8kFw3PqMo5nxiXJGdb_5EC6b_i2iF6s3hwGPBvsSpULHgmfffTwfZfacX75vUcyd6sp2HmQj_y
 CHVquTrjNJ84ljaccXP5GykIlDhvFxRuo3rVISnWaa1NU88VA.8XWEEon..DO5I6He4q1hl0gh5f
 IBC6npAiditTJtWTYN0edWCqwpLCD57BySce_bCSLCRss4mIam77x8Xb.YwvRRydE8M1CTTO1SIu
 U8ySO4JulnxBBVoiz4r0jKzlOOM.HYDx_KJKldQehrS4Sn.5G.8gSktKZD7i5Shccv7aEknWopNL
 mOgMMfdaEcki1TrfPl2uT4ZieMA1Qr7quXYV3emFiXV1Rv.QudtFzS69c8rik5EA_j8nxBn9uxcb
 b_eLZoGlmQmKK5yxStTSaO6Eik.CDxZWOTx.6b3GBnIVZGBo5YeUgqJ3MVXNTGz7aZdW.aVHcGCm
 UCymdTIATpEu4DD_LdaoRi8pkUpiTpIQ98zxu1.ZhV8SCx.bQpu.25JXujpiLYy45_XPJ8lTTIsK
 1wbO9XVL707VOp05.mTtCwV7dj881RUkgNliDWCMLrYIvVTLUMu7H2ISzN8SlGwC9GZjxdjkgLzh
 Id5FlKtIKqQ5iDH1ieHDzekpUUTMSBe4I..fdDtJI_4m99sVlWp0uJlUkZ7L.V.RKjjtHPEaxjZ6
 XqpKSC_OIB4DgoeYVDgY3mykKIobnHlPHBRFa5vHmFSRW2pY-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: d46571b9-dbc3-4645-a58e-48b857632efd
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.ir2.yahoo.com with HTTP; Sat, 21 Feb 2026 11:36:24 +0000
Received: by hermes--production-ir2-bbcfb4457-24w5t (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID a2cf8435db8eb5524e503b6779dbffa9;
          Sat, 21 Feb 2026 11:03:59 +0000 (UTC)
From: tomasz.unger@yahoo.pl
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tomasz Unger <tomasz.unger@yahoo.pl>
Subject: [PATCH] staging: greybus: Fix spelling mistake in Kconfig
Date: Sat, 21 Feb 2026 12:03:55 +0100
Message-ID: <20260221110355.9006-1-tomasz.unger@yahoo.pl>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260221110355.9006-1-tomasz.unger.ref@yahoo.pl>

From: Tomasz Unger <tomasz.unger@yahoo.pl>

Replace 'busses' with 'buses' in help text.

Found using codespell.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/greybus/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/Kconfig b/drivers/staging/greybus/Kconfig
index 1e745a8d439c..7635f3e850fa 100644
--- a/drivers/staging/greybus/Kconfig
+++ b/drivers/staging/greybus/Kconfig
@@ -123,7 +123,7 @@ menuconfig GREYBUS_BRIDGED_PHY
 	help
 	  Select this option to pick from a variety of Greybus Bridged
 	  PHY class drivers.  These drivers emulate a number of
-	  different "traditional" busses by tunneling them over Greybus.
+	  different "traditional" buses by tunneling them over Greybus.
 	  Examples of this include serial, SPI, USB, and others.
 
 	  To compile this code as a module, chose M here: the module
-- 
2.53.0

