Received: from sonic302-20.consmr.mail.ir2.yahoo.com (sonic302-20.consmr.mail.ir2.yahoo.com [87.248.110.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B673793A2
	for <linux-staging@lists.linux.dev>; Thu,  5 Mar 2026 09:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.248.110.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772702935; cv=none; b=iAFWRAhU64QmaDCZxsi1RufpTWJtzYINL2OFMUiFb7wUok18sNmuqIso0uLns1CXA7RFBWdNto6XFNf77n8eUzyrzOk0KapkyrxcyGhgkeC1HhEylVPlEbbJjRX975li+yjpqX3GbuAGhtCodovCz2hARwo1dehf0pZkQItxlnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772702935; c=relaxed/simple;
	bh=eFMqMT63eHHuGbexa95CbTnQHWyzVtpSDpSesF3rohk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=M8XT2VHmGaE/IeO4qZJJzRkMPMU5w+4GT3ORAIcZB04e4KIZK6AIJfIr2X51Kv8AZfFuzFcpwwXO+tec+/QoOiciC/OFNwMC0juwRzykpjOukIC+8eUmIe0htn1J2RlVCn3L/5nDFccGM0u23n6TEZzB/EXy5iLg/7xszpQtiQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=UN43j5ig; arc=none smtp.client-ip=87.248.110.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="UN43j5ig"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1772702926; bh=e9+ACCgfVdF45dBZZ5vtGDLnIqv1E3MgAmm/fm6Pehw=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=UN43j5iguZXXfT4vd4LYJf0ur4SYqY3fNcTeVlHU3Hugq/JFxoBxxiwLClamRHCyRhP7JHQRW+JMDVVuI6gbxirhr8uvch30EjjIkS1IOmqfedHFfYRt8tXsG/3nb1WFKz1mTHrk3aDbT3l/AbFB+31p+psvmONNgDKfa7bGJ0oLxZwMPn/YfZFdzhSgNVmqgtjW9TJS1LM2rGQ1HQqrMLUojoPLTlpqewhEn+TocYuH7JpuXRr7nhfYYa9JlTp57uzTyoFMnT8JTIPmUcNpHLNqCWYM+kDy7FdvWbp1U1630RsfqMROXWwLBvM7/9ONLrPJzHCXDc3LlE/LpUva/g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1772702926; bh=nbld+p/jHTSVY5aOMXe6axanGuwiYHFxX+GumGGITM5=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=SDleROUKCJ3hZ192qtSY/T8NaFawH7F9XgdZzYvH63OVumRc/fqrINXoSLyKnmSr3r6SnIXo/MqEVdB3Lw9MDk1kMQE/PtG8dz3E6NPFYiXNXgKBg/tadrkmoMMxboHCIxJtcdulifI5Aj6gQOtVMHMM0XPUtzqfrKmoN/E6bpZykfdlZG1rcqISf1NVu0qb6E/4sRx+Ofg1upXUZMeij9AX5WWjVhzhzkhYzWJCnhrFGmNXhKg6qNdIO0rnatf2pWgXpsYP8ZpSPagiKVX2AUKL0dhXOOGjs41ji/5oYW0qtZ/InvTHfZFVAfbFMeRVEG25VhhXZR1QIJdoqHQSqQ==
X-YMail-OSG: 78iBpsIVM1npZVgJN.xtQr75x4B6a7Jg8MvFXLdORUN5Fizm4URQ1w4PKsEr_2g
 zg7l.f2v36Jrw5YWb1J6cQMT0E8uQSM74UayHL14AuW4zzKL619e6FXbjmCOnZsu.zBe9EJYBlZ2
 UNWhi9d1lJqppQqLQA57KjSe2KJtZF5g75mt9T.Jnou5XrlE2LsfpRrnHb7kaBP531rlP4LDigbR
 XzeMt.BPZlWFZMB9egWNGYbvoKJldFJDMoklf5kTj7DMKlw116.Hmibkjh1PMQl.Nx1D0VXuWzNv
 AC.kGxuSXlucj8rlq.0tHoHzGzNpXNYNnEf4YPjn0sMsNNI2Qg1d3s_ohSE97vVMbcsCI_qncAJC
 7JorbaoPa2NGcI8PAhcdq_.DnwkdarClKokLepW.2zGpDt4Do65lUOpGUkGFRGN11L_Hn8akMR6O
 KvckpT9BtwcvRTRRQ_X1nR95qnmTD1AU2z5yb6JMwlqsPd0thvyPq_BfBi_DrGKkua_AKi7gmb63
 InLcF7e.SBVblAvnBpHWPJSlDRdgSIoTYFCJ.92fSnFUzOpQVUFfa0s_L8N1CeoFF7PMnD0Gu0nn
 LeJOsUXshPu9RJoo0uTUhUNrQWy5XI5Q440K35BqqX0H9lcl4MdCWfkZkvs57.fjwGXBs7U.donh
 jGH02ksnt6.cd6fs3K3dml0xg6XXwsZFCLmlIbK2ID9iDhAGUhWxfacxjTn_Q.K4ZsKng55VcqA_
 .ArBi9UDDC3MN2oubEvqi18JQzXmr8MpMJKKLc67yzMajc9K1rwZEZytLPgXL_41uacLYZq4PCUd
 EfLsqkB6XEJa.KawU1dcQ2s9b7.xS8dIrgqj_XWP4jwFmUwsf2i6ocw85ydTuk6A_vcqmQhyuV6W
 vNMe_8mYr4Gu1Izk3xIyl8cXqCi_exkjo4YxPpJ7tcVboD_ENWjUlVujPT2Iq2Utu2t2ANlOt1Aj
 YNAfb3SUx6d8ixznCFaAZUqzNS1YKNDdc5Ged.t9bL4WyGhTpNlROLjTkC3JF6_P5crTaUHhPIGX
 0q.S5qiF7RH_naWaMYupkms0Rl_aMnb39hQI52HhfogUpqHTooN6wSJPER1BlxtYgBD4TyZopXdC
 8RyzryuMx3st7E1T185ANsAic2EC6LKlrkgDUfI6hr1itoG5i7lj8Nf5lP.8fyBkDixj9TRrO6z6
 o2JjXogZOblwJ2zIwhLkxrvQfV3tg2F_iiV6Y1z2fOGBq49BRlVD3qjaA143I3P8ueh9avRHCZiB
 l_8DPXS155TIOpIsdn4ZxHDQ2MqjaJWZpO0aqcG.A.77cg8uaC_3oRjtHeyGyvo6BCfZrBTOM9lE
 YnfScr314Gw99WeETd9oKLJ9wTYp0e5scCEzfCZB.4Sxkyf8W9DWTtSqVz19ZU9Kp9uQzreWyo2h
 eXCvRF9UlhQNBc_iHbuV0hasJVJOBWwV8IC6TgVBwIQZVa6RV7y4bV9hW2ulsvbjRqEVV0B99ydg
 wql3RJQOdb6ziIpz5NymQ5cI8umRgfFpLeh7yi1y1PwWnxpEkvpJGlS2bjRIRpRETTlS4YMB1QFx
 EukGI14mpHmmskAUgQknOZATG4ZO8eHAwx95TVlePAGmR3Moi_vzV0u89F2iuRkA4X6Qk0eEN906
 tAjtgX7gqKOwfNMo_PH2ucHhO1scntU64dkmbW1hw.RbAtWRx.NYWkd.MchYzGMSEVSaJlGzbQR5
 D.R7khZostaCPKtM9jRykIvQYT4XcUonyLdgfblIg9shdG4uBDSorzRwFkaZMVQsOJIc5J.MQb3y
 g66nncjKzQ99K9GxwKvbWxOB.uEsksmLWFEwrXB_L8lm6u64Eg9kQj.b30mLxXuUIOp2reLTbbOE
 8mIlvOAR6CIdLFWr4sWwOhL2oVK1l9c0ynzoTxMErAkvfAyg29V.2BvQHncdR32AqO8cxbsVpg8k
 GrjmiN.hLcm59uMrlIYkNW.IgT5ep3u4R6Ip76KZbp2FMkFJuWwl5d6tgPVvljcWRzVpjeTUdIXS
 ecIV0Zb6vYqcFRujmM0snGL4gJi3cT5UchPRGzrneGHtvfxUxGBypo_JMjKDZRD6hRLCK2B277j0
 Xk9R.TTHWjkQyccWaqJIHXLnDP8o0l97DSZYoEk299MjzXw.yK7O3L83teS_klL2N6IRzAMVt9p0
 lMuyQ_5n7o._f9GXHl8w5MH73WlJzOyknY7iV.vgRd5.jRPXJV32bLaRPoBGiutkaanDMfllB4YC
 BjLIaf6ih719eByGX3EscKUnHN45aLKdo9mxuO_bLW1vjTFv2D9nTESz.uRvUqab1knt06KkOXuM
 3wuXyYwuJ2tppkqOUJ8QPxVm8uKRszwc53w--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 889f582a-5121-40e4-bcea-3dd9e22d90cd
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.ir2.yahoo.com with HTTP; Thu, 5 Mar 2026 09:28:46 +0000
Received: by hermes--production-ir2-bbcfb4457-c2jpm (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 537325817d83b4fce5f78519c0b64c66;
          Thu, 05 Mar 2026 08:58:20 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Thu, 05 Mar 2026 09:58:19 +0100
Subject: [PATCH] staging: greybus: Prefer 'unsigned long long' over
 'unsigned long long int'
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-greybus-unsigned-long-long-v1-1-e912b6023fcd@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSwqAMAwA0atI1hZq6we8irioNtaARGlQFPHuF
 t0MvM3cIBgJBdrshogHCa2cUOQZjLPjgIp8Mhhtam11pULEa9hF7SwUGL1aVg5/sCnrymrj7eQ
 gDbaIE53fvOuf5wWj+1H7bAAAAA==
X-Change-ID: 20260305-greybus-unsigned-long-long-e7465302d3fa
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
References: <20260305-greybus-unsigned-long-long-v1-1-e912b6023fcd.ref@yahoo.pl>

Remove redundant 'int' keyword from 'unsigned long long int' type cast.
'unsigned long long' and 'unsigned long long int' are identical types
in C. Prefer the shorter form as suggested by checkpatch.pl --strict.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/greybus/Documentation/firmware/authenticate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/authenticate.c b/drivers/staging/greybus/Documentation/firmware/authenticate.c
index 3d2c6f88a138..0ef88b7d24de 100644
--- a/drivers/staging/greybus/Documentation/firmware/authenticate.c
+++ b/drivers/staging/greybus/Documentation/firmware/authenticate.c
@@ -58,7 +58,7 @@ int main(int argc, char *argv[])
 		goto close_fd;
 	}
 
-	printf("UID received: 0x%llx\n", *(unsigned long long int *)(uid.uid));
+	printf("UID received: 0x%llx\n", *(unsigned long long *)(uid.uid));
 
 	/* Get certificate */
 	printf("Get IMS certificate\n");

---
base-commit: 6ae79e7736ee6a5f920867e5346d8a106cd1db74
change-id: 20260305-greybus-unsigned-long-long-e7465302d3fa

Best regards,
-- 
Tomasz Unger <tomasz.unger@yahoo.pl>

