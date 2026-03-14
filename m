Received: from sonic314-19.consmr.mail.ir2.yahoo.com (sonic314-19.consmr.mail.ir2.yahoo.com [77.238.177.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDA8261B71
	for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 13:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.177.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773496252; cv=none; b=YpyhcYALXcTKuOPuCtiD8aFxs7o8+dY6zG8OBsLJmUDNJkgWXfPHGVZL80mkSF/gVDm1mCr6y0GKDxZQQ1S/qOOBzrSXbVjmz8XBXedkx7lagkFFDujIURMHeuUaCGIGSBAMnfGHNxrIEEsCdEr/GbTdsN2CIKQOkKEj5HWSrhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773496252; c=relaxed/simple;
	bh=fHZzPhkH9YU8IhK94zvW7S2hKpQHeP6T1Kb7+Xb8FjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=NUqSbAavfv396xtIMishNpVZnLlGyF+Oj6VOx6yE+OjbCxCVvYi4GMM1WNoWM3ZSri5BM4HA+TI0iEvyCpTyef1tspK1rK7v9t+VqqfMGvTC0WsIcvT5OGNO4ArvQKU0Crh4YnGtOaAcGroh/Bbb8ZPtm1GweT19IKeRTFycQ3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=gkVufGcf; arc=none smtp.client-ip=77.238.177.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="gkVufGcf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773496248; bh=pPNQB8gtZZvhGsZU8fGGu7n87IeFOJUHU49HuFih3nA=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=gkVufGcfZ+1qAqDpNC245Xb+6Pxomq4ATxFQKFS00wlqnwR9Yld30OZhmRjydULRxrcuKGp3i3NBdC3ukc6vub5vI405vWUPRFlpr2qkCEZtURd+c0hH5uuYeB5hxeTpPFIcada4qtOVym4kz/EVXLTfVTE1335IjeWm+ISw+wnJmTYIked37k9dMyjRVodMg7HLhRtZKldbNyj8iiVWHg8QbFtyOM1FGg7QACabx4kHCVROIX6NZp5MYknT9kH5j8m2mfi1FzlDZjKtBfj9ukCbju3TOQRdZr9gwEIcQ0OsOl62JePBPqtB6D0YQfMkMDyw6grsbYjjnLEpgZB9ZQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773496248; bh=hMceK1UEW/jSpLyhADw7NIErSIr9sgJ3wbo3I2KvP5u=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=PQUkpXagYkAFnm0e9JN+368dUyAmT2quOCficbN0v5EF299ag7LKgU2Y8l+8i+5lIgnP/Tuhe3/eHMqDidMnEZweNWCRjn7vo53pNplIPH//CH8ZtP7kOsvzmFkfsItfOoLHYM77eAavDkVtSqm44eBk677MXdrnKLC4+yeIsTfeAjuWZhboxMRNDIa606LgKMQQW9C+zmhcpjvxeJniDQHF3+wE0dVpksd8t3bRaJ3tJs1kDKP8DKmdqGNP2rHVOpII7JAFQgWHmWV3OQs4J+YwZucU68PPF02Jcs+krNym/k9yhr8jeXazm4OVQBZP/LQRgoLHKfGpC7rVldKvlA==
X-YMail-OSG: g7sdEdAVM1nYdfn3FfdkifZM4avNWJaoArD53k4IuDDoTRuiu33hmuNpxCTEXNb
 lKcgYfBKOBTo_PvkCK7PfeOA3dqOPHt6rqyFB6yJ170dkA6rcN.LVUu_JN0_saWpEzexJfLb7Xwn
 UfZu_fCJYEkYNo83cwFo.1Nm3lPOJEWyAhcCQivNXDONzRl.ik0C6K1sFoM6Ut2Py_5us9A4UFN3
 ._wuPQFx.JXIoKd.ZNGjNmcHJh_bO70XPm.soI20v35nyZMpEDHk.ZXaY1xyIp9UYzV8eMesBtv.
 3khGAHibPZM3js1rB0z3HZF1G.2.9hCGqameCPzqdXImB56sZ9fXsT_7DBEIMFh.flaQ1C5OXjvV
 n5SYpLdYfdOZfdVdFkcctbx.p7iKu0wltMaY7VUMWoaci3YEGdsFSjfi0X_a.8pbCvpi65eoLydn
 1qbXyPJxkczdaSIWUCsk1YkgoLwwxFqHui3tJSw3rwLOvgJSVrNiMUKReMhUJF_g2tqUtxTdBMSX
 YUcQITTnjSIlwCLbcIswbvLW0xtOkW7RWU4qlFlMefSdUtNp0alIREv5SfkofoJq.DsoWcxmZPuA
 Lo0qwNcbWKqd_QsFxtSsqS3TdcjgtKT4.CbhsRZIrhp3l1Jouv4Bt44qXtoGOabLO7xVQVaHOlia
 TBpTQzVcffgbb0sP4.H78OM9S6CFFbe9x8PvfuRtUPAmK_R7XfqRlIMsEKGSlYEHwsmljk4CNisI
 X07cCSKgBdoEZj39jXuSE6hdZW7GZ1PycUpHFq0o9uDzK.IxbPDmsWaASktgFKQn7LzotoKZ6NuN
 barLCLt0MxEgomGz2dvmRkK4zs9hyPupuTOcdBz7.o4UockHT9VZhr_J09AKeVRKKGXynPUDnTCG
 hD0Ce0_oCn0z5WsnqefPadMfgKbilul.ULaAcDwUi1CDs_qUcUwtok6F1WK9iBgE2d3CXf_Dv86P
 BfzN0ZPFYz_4GX6yO88LbxydJLte7.nIKZq01LDrG6.OCZO2QYtMphKsJX4FbZcwu.sxx204XOAq
 kHzNx6ecVEZhKimoe9sqXKekN0O6TbnuQ192vz0wupCjKeVPpLl6Z_3ID3fxg8_NHK9QG1hh9ljl
 50HFNBS7IUsCzj1i_ugJ.jvJYR.q1JGWFHRrdKhh3BzfM2DVhDCaYOojkG9bGAxeI4F92saHg2pk
 xBoDZRl3DyGmF9KWx96nb937ern_C8XUC_7iL8LuAkz3dJwWCvCXX0Y1SheodMLSGZ_zZ_XTamXK
 wdKmxJ5jRsLSAVGb3I4x4e7DlvRh6VyGJz634bGqSf6rkp30ad6StBdjSGUPO_4RCQqvc7o8MRhN
 kLtV31ZmEBs9KzIYoQsFc9a2otYq9HrwURFunKx2WeG5PZLtoSH8uzha00_TkCmCmh1PSIuoTcGA
 9BnRDKW2nEitSnsedE9V6cKR79xlmNlwuRGMKk2t2tW_vRZc1VAduHYaFVf6DtnfGPWaMD2RiC6Q
 NJkzFTg9evlrypQHo.ZMWRsN7ArRNxsAK1j.qotXY8D3ug_C22_kmNSacktEmnbfNTQbDqFZ1dXG
 Tu7DLTfiC0E6RG8IESTqQ6kGT45.5e6JGOT2CebszNURq3Ibc5YvwGyiu85rFdNo9lfhIFQaELcR
 gpzATD9QDMXd3Ovyw9Ov5jjuxmSvqCpF.asWbdf_bdcN4X.ceYkbfXq4Yf6EZSdghAUQKqjrBkXz
 cXf8nruJcEk5NvK5eA3o_9Pxob01UG2Ld1iEoUbvvOUNm.3yOz4BrkBC7h5qVBzbnUnb7TcLdFq5
 .fkAX6402BDD1FitRbn.XiYevp0xyZixGd2bxpOEcRE4hb.DNtCp9UmvR_N2hXwj.gw52Q5MxU4I
 NlnBmQz1NQAxNrp_k_tYZON7z3Z6QHTXBn2ckh1RAQmWR0Es5NWdeiU0lkUKI_1mISXPxhyRgc_r
 59YDU7bSXkUK4iY7IZCH4T1FfB5LBVrNjaiEuKbe3tgApB2gwL.E_9xfCd88F42Ux6kY976RTlns
 FA3.kTRQ_I.LIiOysLdWDB05mC5WK00msfTMMC30rMLt83DiZzjUFZXW8tLIoFZ5C.nPFmqxnsPX
 e_c9ZHrUeesZGy.0g3V6rQonn5M6Qb0lZ2NoYLf8K2ePjuNTsFeCL2iS52U6KZmEUOTAmiSf.fx5
 UORXVosWVlh3vzcIq0OkSgSb6Bgx3ZwvKkFOKMECbMQjX4PNbA.oBSA1QV6RG0ZMwpMMsd975dmf
 X6RS507LPVb5ZWgBbD_RuSXDzkPCO4nveznajR3.sydeE7hClG7894GTy9F2rzT3MKrf1nsg6mO9
 G4DcGiOIV1ND.EwXJZ3_sqUjybQ--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 74991517-7e7c-4ffa-9f75-7eb0418016e8
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.ir2.yahoo.com with HTTP; Sat, 14 Mar 2026 13:50:48 +0000
Received: by hermes--production-ir2-bbcfb4457-qnj4k (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 17a45a113cf701a9c8b69ac7566005ef;
          Sat, 14 Mar 2026 13:30:26 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Sat, 14 Mar 2026 14:30:24 +0100
Subject: [PATCH] staging: rtl8723bs: replace kmalloc + memcpy with kmemdup
 in sdio_ops.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-rtl8723bs-kmemdup-sdio-v1-1-b551f87eff8b@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MywqEMAxA0V+RrCfQpuLrVwYXaqOGGR80KoL47
 xaXZ3HvBcpBWKFKLgh8iMoyR9hPAt3YzAOj+GggQ5lxNsWw/YucXKv4m3jy+4rqZcGCet/alFx
 JBmK8Bu7lfMff+r4fyzDs72gAAAA=
X-Change-ID: 20260314-rtl8723bs-kmemdup-sdio-82fdb1423920
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773495026; l=1199;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=fHZzPhkH9YU8IhK94zvW7S2hKpQHeP6T1Kb7+Xb8FjI=;
 b=8x37wzN5kAOkiwl9tKfhQ9qnoTB2PMY0grryWt+HTU5utbyfUod/LvUhukYi0pPZHrgU+05Cc
 lwtqdY+y2QvCfWJ7Fzamcp8Lgg4E1AIYBkqEEcAdDXiCyKR5J4JMpbp
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260314-rtl8723bs-kmemdup-sdio-v1-1-b551f87eff8b.ref@yahoo.pl>

Replace kmalloc() followed by memcpy() with kmemdup() which combines
both operations into a single call, making the code cleaner and more
readable.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Verified with checkpatch.pl - no errors or warnings.
Compiled the module successfully.
Module loads without errors in a QEMU environment.
---
 drivers/staging/rtl8723bs/hal/sdio_ops.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index c9cb20c61a2b..514c857a998e 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -583,12 +583,10 @@ s32 sdio_local_write(
 	)
 		return sd_cmd52_write(intfhdl, addr, cnt, buf);
 
-	tmpbuf = kmalloc(cnt, GFP_ATOMIC);
+	tmpbuf = kmemdup(buf, cnt, GFP_ATOMIC);
 	if (!tmpbuf)
 		return -ENOMEM;
 
-	memcpy(tmpbuf, buf, cnt);
-
 	err = sd_write(intfhdl, addr, cnt, tmpbuf);
 
 	kfree(tmpbuf);

---
base-commit: 2f10e53847d208e97f23ceef3678ce8c88d2ae0e
change-id: 20260314-rtl8723bs-kmemdup-sdio-82fdb1423920

Best regards,
-- 
Tomasz Unger <tomasz.unger@yahoo.pl>

