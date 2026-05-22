Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3E928643A
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 00:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779410782; cv=none; b=KqHggb8EQHgqYATWwIDIlDviipAQVCSR3zLZTNAU83hGi/j1hOQB+D/SN99QKUDc33JSvhXPSSA3/lzO7hUH7AYCLTuwgCBD3lawnX1wem7igJKd3j8jcRtrKL69QrvlxNEV4Unqdmw2f6HUiPPDJAI0Qvl/lE2tzC/b1lUdaO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779410782; c=relaxed/simple;
	bh=11XpadIVbnWDgGbnLsDIYuVi8q6V/iekBQR9d9ytC84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PBuPzjdYnkbR+SmmeoiH5DmYl/tmRtgxjVIyaRxJ8m70bJBxK2317IM6Rl0m7a6dCx8kThOvQQXzgBlamffcpuYYmrzBuXJOtBYbr3ju+vui1/y0Z1mxBMNvrvJQhEI/r3H74ImCZjLgfCjrHEGsl4//9awvFJUxLNuGpHIegmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bi8fu5dB; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bi8fu5dB"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6870ad8072eso1666308a12.0
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 17:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779410779; x=1780015579; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMhZs4Eu6gRgBabm++8DBCSAa+Wm8K3ZfuFNhzHSur8=;
        b=bi8fu5dBcQQg0pHKYw6x6mayWTdbZ/La6EOAEm3SoBysGidyLjMoptEq/2yKIaVrgr
         hclcdyjOPqU2FB1uTo7cQc4LiZ2Hs/tPFk1MA+QQvD2r45CrQLxEglxllB8bl1kxoWy8
         SCmO3UJykxWAWf4jAFtRAssdcCsVr8rfezbSLmpGLrafX1w8/wyM55K5ZyE0qwIKJ4Qu
         tBwwWdPgt4C1chuMs29OAf4DlB+/wYlspINecP4Mu01fUSu6/OVipt4cLmwPTCDrWh3G
         /jyBL9fLzPb/w7c1OLYqj/wClIdK/uostRF7/MUrwRdi+pQCr4cpC4B8hyz6oS5W0zU9
         jinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779410779; x=1780015579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MMhZs4Eu6gRgBabm++8DBCSAa+Wm8K3ZfuFNhzHSur8=;
        b=cX5p8XODJWTmKR1UmDNVj+6SO3I3UVhzoFlNcri1VwM4MDeNyHc34BMpQCLAN55ONu
         BUlfG8fMJ2EJVBKHKCuXqQ6Ey0dWJWxPXSxTrdnbGE2tgnKYCBkt8CyafuUrxxvWgRQJ
         7dJWPCVeNTxK1773FtX8LPHvkpV+gkI1R71xHM/RNm/e92htlRREq4irSYBoZ7YEfQYb
         m4yEBaL89XpBvu7sZ3bFDoXn0UeSZK8I1/TxyjS47thrh4KaW6+RbUxln++J32faAwHC
         sMng92YJJqBKJnrR5E3mQ9OCtuBYPkHiFAaZAgAVn34G4kVDCCVhxqSGKmOnpEjbX047
         GrRQ==
X-Gm-Message-State: AOJu0Yw4rPlK8LuSJi3G+TAw+GaBTbaLsPJciiF3yZ0ZUprPoCJmOo89
	y95cyl6heDuw2LCLk01QlX1AGP9GQ/RU0493RCq2kbd9s455xAMUWgkWUifn5lwQ5xo=
X-Gm-Gg: Acq92OGj2ZLMO56WdCW6LAZ/geIUVpZaR6xphGCl8XmIIBylMrututXLdfSigg0gsLA
	NPY/j3oy+8y7A2N6iRHpEhx7Srn5hGrTq31BZjQ/D58kCntS/5/1w/+fHZuk1kD9VeOITgMc5d4
	tTLa+zUiZ2vlx9gWuhZLe4a5srEHptI8oa8/KmLbBjpPkcOEs4efmMkxK/ynT64tPycl6INpGJm
	JL4x68UZo1thYWCJmSvWw2QqOC8Ul5ZzgE8EGZOelPAeDH0xk5ABmdQG4LOI1T+DralabygOdAH
	2jUDGtygMs6whG+nie2UFNvx0GAQLh5q71f4beJFwyAvSGS+kmMazhYC1FmMpjo19sdWV6TUWmE
	aWoZ4B71R29CO0IDmyMffBndzol/ZQQAIQ3Mq0WEAWg4ySCrif9PXxiobayMfra2hnGwn9UsXM4
	q+EtRm3uNuEmxhr1TW34YJe1iIA6X9m7qp3aycmmdiZSHCKpd8WA+dIM0Kg/c82SFDtlj8PxWRP
	+45rnOL+XNsES7hhj6ZDRFAXMi2TzRIvwBhGKnOFyPhS2fyNRB/v1NLPVcbasA9sU//vOlSYIXo
	j18QcXi4W/q5sgD4Y9ipGA0d1izUHRVOcaXj/30=
X-Received: by 2002:a05:6402:510e:b0:682:c363:d96f with SMTP id 4fb4d7f45d1cf-6889c44e129mr462567a12.10.1779410778851;
        Thu, 21 May 2026 17:46:18 -0700 (PDT)
Received: from ahossu.localdomain (ip-217-105-56-94.ip.prioritytelecom.net. [217.105.56.94])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b72cbbf3sm3535a12.0.2026.05.21.17.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 17:46:17 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	luka.gejak@linux.dev,
	Alexandru Hossu <hossu.alexandru@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v7 4/7] staging: rtl8723bs: fix OOB write in HT_caps_handler()
Date: Fri, 22 May 2026 02:45:28 +0200
Message-ID: <20260522004531.1038924-5-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522004531.1038924-1-hossu.alexandru@gmail.com>
References: <20260521130330.754181-1-hossu.alexandru@gmail.com>
 <20260522004531.1038924-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HT_caps_handler() iterates pIE->length bytes and writes into
HT_caps.u.HT_cap[], which is a fixed 26-byte array (sizeof struct
HT_caps_element). Because pIE->length is a raw u8 from an over-the-air
802.11 AssocResponse frame and is never validated, a malicious AP can
set it up to 255, causing up to 229 bytes of out-of-bounds writes into
adjacent fields of struct mlme_ext_info.

Truncate the iteration count to the size of HT_caps.u.HT_cap using
umin() so that data from a longer-than-expected IE is silently ignored
rather than written out of bounds, preserving interoperability with APs
that pad the element. An early return on oversized IEs was considered
but rejected: it would bypass the pmlmeinfo->HT_caps_enable = 1
assignment that precedes the loop, silently disabling HT mode for APs
that append extra bytes to the HT Capabilities IE.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index e0d73c267786..dd34f229df12 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -936,7 +936,8 @@ void HT_caps_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 
 	pmlmeinfo->HT_caps_enable = 1;
 
-	for (i = 0; i < (pIE->length); i++) {
+	for (i = 0; i < umin(pIE->length,
+			     sizeof(pmlmeinfo->HT_caps.u.HT_cap)); i++) {
 		if (i != 2) {
 			/* Commented by Albert 2010/07/12 */
 			/* Got the endian issue here. */
-- 
2.54.0

