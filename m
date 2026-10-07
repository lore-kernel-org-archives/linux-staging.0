Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A969480959
	for <linux-staging@lists.linux.dev>; Wed,  7 Oct 2026 11:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374070; cv=none; b=JCsnta3hwIGVNKROioG3fXOObdpEIc2I8T5FGSe0lpFuFnL2xId93ix6EcwS7+ByGzKFKcNR+KO5FpN9RHmFPe3Ro1FtwM03tzmJlZ9gFAWuuWefBGygjP4gLEu2lEM5fFYQFIIBKzIjnhQ7dwWyTiUyc3uerIXqW32/G7XCuHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374070; c=relaxed/simple;
	bh=c8CVE9cs8rShzXPsmQd3KD5PoRXwWzAmTDMbQYb64ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JYdAAWmgm8uibrPlkk+B7hBPdZ8TTHnTgBB9RwiO/I2JBSwAotMyoQCNq4CwMJajhZ6qfs+djSxr3aknlmTmP9Y+gbOC1aZ/lu8xO4sYEvuX92xrC97NWl5u2EoB8mghMEvKzA52IXbtXIAyQh3TmHQXuYCvXAR1UW48GsGTdtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2hIPd0l; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2hIPd0l"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so1272891a91.2
        for <linux-staging@lists.linux.dev>; Wed, 07 Oct 2026 04:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791374057; x=1791978857; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IRRCr34XAhK+FCF6lqb8gz+RLw8aUuaoR2HPbDjY2CY=;
        b=m2hIPd0ldcaaLABEKCqzkNYVVynzDZZUQGBBZCq4qfTqpHESFtRr9BkD720IF5C0ca
         qz0ZP3LGLNcvgO+o+3vyH6spcI3fl4ZWaHn6pUh2u3UcCULiDfmLpj8vGj0ZK9rmDcyr
         9qsZvC3swvz0VCMNRjbyo42pqop9r4UcXCiwmLPEu3jO3b09uZCRJIWLe/22gV5GyAxH
         0RdmUkalKjU8TI7ICSpo3tY3UJohFzFie8Mhtidijhx9dFSul2G0GsOTJ5KAJ03xp5iZ
         5/GJrUPEzleqBlGAEm4aVGQFtZdpCFfjRGyB4MQkJpbRDysxhv1GuVSR+Gq9mu120efn
         fWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791374057; x=1791978857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IRRCr34XAhK+FCF6lqb8gz+RLw8aUuaoR2HPbDjY2CY=;
        b=Zoquhyf7w+GwSk4Z28c7fh2ybKYjJz3xgzR+R+xKAPW/g1JrkHmfxlA3Ex7fVAVmwD
         +XBZT76bztYUJXjDqSe/Wvhi1uNLCE8QNYLDlIfwDLGSXenb3GUVKJCVeYkJtyWvGCMf
         BmiWGy84pgZeMJ6LnG3PN764nHG4SI5UFFJMQJw8b3FsrIs4bolrFw+kyG5GNgL/i8Th
         vkYpeK3bpcV6TQC0SsyDcxUGRygpgixeluChvyeTXM0UEewxpRO7LFwtocMC5fmehQMV
         LBTbFUdNTRLEHu6fLRZpLi6KQlUEqDQ510LZH8OdICYZymYKqP1Ikq8rBNoCDsGoE1Oq
         ilXA==
X-Gm-Message-State: AFq9FYIRQQebRRbCDCCRQXCyD10tUw//X//fxwORsvXcSl0juWyjpc/V
	MGt/wgxXOzPSF2Y3647HJ9xWLEBl4uiZ2NP1hOS7PFWmBc+ftqHZP2Ey
X-Gm-Gg: AYBFou1at4+NvAQ6InJ2SH0SO3Ov+0Wpb7mOKqk6rVs241roNapGoxCC1Pn7XFpUyVE
	jsfPEoGhx2oMp1amLzgk2qQQR/gypK98mfYv59CVuQY7eJOmy2+KrIqmI3twSBUJnpFIMicT5pg
	IaKtRW8je8t40C2giTgZ9gXD4PDK4jJehhtEG18dajCEWHxtFhLW3ro727EpuAoYTyNi4tJ7c05
	W4zkQBtJkrsojOpC7FQyJ/CYi7qwOKb/M1DSoY9Sq1XhUlrVsIt/O7nl1PJXsbgHGJHt0YHJsGe
	MJjYO5TKQwH9UlS7l6Jap9jWEwDjC/LOFl4HgHQ1+e/0C7WAasOAMYaIbbsnIbnel1sTdbCaNrV
	vcl49O5K5EydjaITIxyluMeo7sJP1tavAfiJWzkesFnIizlh2s+OHLG5ug9Surra/ROv9cvU5LY
	r3alJpZlt3Yp9E5l2uz1lXsqIR6XU7RKKQ9uFf1zt1WI7k5q0l9LHnmNXvq4P4SsigQ/KETtxW3
	w==
X-Received: by 2002:a17:90b:1812:b0:3a8:6b84:234d with SMTP id 98e67ed59e1d1-3a89f693aedmr1421277a91.6.1791374057601;
        Wed, 07 Oct 2026 04:54:17 -0700 (PDT)
Received: from host ([103.103.208.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89b625d01sm4160128a91.14.2026.10.07.04.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:54:17 -0700 (PDT)
From: Pranav Desai <contact.pranavdesai@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pranav Desai <contact.pranavdesai@gmail.com>
Subject: [PATCH v3 3/6] staging: rtl8723bs: use u8 for frame types in rtw_security.c
Date: Wed,  7 Oct 2026 17:23:39 +0530
Message-ID: <20261007115342.1121742-4-contact.pranavdesai@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007115342.1121742-1-contact.pranavdesai@gmail.com>
References: <20261007115342.1121742-1-contact.pranavdesai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace 'uint' with 'u8' for the 'frtype' and 'frsubtype' variables
in rtw_security.c.

These variables are populated by the GetFrameType() and GetFrameSubType()
macros, which read a 16-bit value but apply a bitwise mask (bits 2-3 for
type, bits 2-7 for subtype). Because the highest possible value after
masking is 252, these variables are guaranteed to fit within an 8-bit
unsigned integer.

Signed-off-by: Pranav Desai <contact.pranavdesai@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 34e35c0eccbc..676587fabfe4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -633,7 +633,7 @@ static void construct_mic_iv(u8 *mic_iv,
 			     u8 *mpdu,
 			     uint payload_length,
 			     u8 *pn_vector,
-			     uint frtype)
+			     u8 frtype)
 {
 		signed int i;
 
@@ -669,7 +669,7 @@ static void construct_mic_iv(u8 *mic_iv,
 static void construct_mic_header1(u8 *mic_header1,
 				  signed int header_length,
 				  u8 *mpdu,
-				  uint frtype)
+				  u8 frtype)
 {
 		mic_header1[0] = (u8)((header_length - 2) / 256);
 		mic_header1[1] = (u8)((header_length - 2) % 256);
@@ -752,7 +752,7 @@ static void construct_ctr_preload(u8 *ctr_preload,
 				  u8 *mpdu,
 				  u8 *pn_vector,
 				  signed int c,
-				  uint frtype)
+				  u8 frtype)
 {
 	signed int i = 0;
 
@@ -798,8 +798,8 @@ static signed int aes_cipher(u8 *key, u16 hdrlen,
 	u8 aes_out[16] = {};
 	u8 padded_buffer[16] = {};
 	u8 mic[8];
-	uint	frtype  = GetFrameType(pframe);
-	uint	frsubtype  = GetFrameSubType(pframe);
+	u8 frtype  = GetFrameType(pframe);
+	u8 frsubtype  = GetFrameSubType(pframe);
 
 	frsubtype = frsubtype >> 4;
 
@@ -1001,8 +1001,8 @@ static signed int aes_decipher(u8 *key, u8 hdrlen,
 	u8 padded_buffer[16] = {};
 	u8 mic[8];
 
-	uint frtype  = GetFrameType(pframe);
-	uint frsubtype  = GetFrameSubType(pframe);
+	u8 frtype  = GetFrameType(pframe);
+	u8 frsubtype  = GetFrameSubType(pframe);
 
 	frsubtype = frsubtype >> 4;
 
-- 
2.55.0

