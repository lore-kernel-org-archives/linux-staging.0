Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6072E48CFC
	for <linux-staging@lists.linux.dev>; Sun, 13 Sep 2026 20:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789331440; cv=none; b=Ail5WhvLTGp3irCGczxSR8H0tgn8yMroIjjM+amN0RrwNEayjeET8QPfJgHpTqG3fizTia35PSjSCSsMMrqHsMotI1kfN69/V3dE36ogvD3Mtx4ajkyWfdt6hen8NiFWfPt0W2d3bOK+UhmV0oG8yGxIFsW3kfuDWeaJC3NQ5Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789331440; c=relaxed/simple;
	bh=zA3fRD2dbdgRkzdQmMxm2I9rF/JJPljBzonVlY2JBtY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PxU6Rinmer84TkD2sNLEIB6fD7Qj7Xg5wJI4BQklVEb3hScYtkO4GCGG8rjhemCpd7E+KOKXDmA/q01ycB2WnoYEWx6YTVRthrVrz5dz/2A66/+1ZQgapiqI08l+J6tIGjkwXZM56kDXkozMo1s9vKNz312uo1nDQlLqKucJznY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mViG4Ll3; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mViG4Ll3"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b37a2ffee6so371346b6e.2
        for <linux-staging@lists.linux.dev>; Sun, 13 Sep 2026 13:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789331438; x=1789936238; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=onWFZmQV2N2Ecu+NrSOnYh08nqKQZnRP9Qdi8ROiYmc=;
        b=mViG4Ll3tpiHD7W/eTlh5p4H5sZIJaH8TZgM/KQL9GbtDIRDXHX+RZEoag0Q/diFe8
         3fFcqjRbe+L0ipMVPgd9zFBuYAbovQCthWwzZHZgm2YshFTC7h84CZRWj3Z2/nK48cC1
         /wQCFYCYcn6HXblk29G2xcslMuga3CQpHA7Boa6p6Q6+MHqcoNs56yU/SiLhpZgTeH81
         tvCGxdT3d1YIetJXbnfymGUFelUvqPWvDT6VDQ2hRZ3cEOBhS9Ielm1L/hU3ooYWSN2n
         5eylRhj4ST+2LLYZQToB5n5A3UvWdTv2SLrgKmnORsk0XdK49mAuub9DH5h8UP75TMm0
         z8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789331438; x=1789936238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=onWFZmQV2N2Ecu+NrSOnYh08nqKQZnRP9Qdi8ROiYmc=;
        b=edUc1JrZXpNUCKMCSlIuDI4oNM5ZUVIvKlwP08e53iYx8eDS+KuQpnufNJ7Uc3aAAx
         II+KJB68UvYAcuUZF02bW56oJWnqmIAHN7ImKM3FRLwrKYpsyONvsHsWP8HSIeXO7MtI
         CWVgv+mOsv8xUET3g6KKoYstlp81xwNtUZVjemQcUattgUNw6iJs0ZsSw7W60aNe0Fcu
         e5Xu+PcUXRZg/LgKvzBLLmigr0QHwgThM+FNpG0hXty/JvoegrfmBSsBz0gmvNKrw2m8
         XQ4rI79BxK9Wj6b5Ct9AFBhI08Xqj+m8idnspyfazvuHEJaFiUMT1X3IAxTGPGJZc9Ga
         4CQg==
X-Gm-Message-State: AFuF++n4orKMd8MnbjEKOktKT5rNvNVbAi34OkYtXJlRKwgTxNPfG6x1
	qLSE1S7DA+gvHPcT2RztnNb5Qh9andvLYmRheLhhcpsSQIHiHmUWgpA=
X-Gm-Gg: AYBFou0ljMafA7OSU99pnQhultI9KgoQJ9cJ44SwkHLspcoNBZiWj/onzRA6u9KwydW
	ydf4QWoOaaOxZ3cVkyVq9Ke4p/Ij0XMOBcholeDPE9pJwBu3oksjOW0w/z696klHM7YzM6jCCYu
	k2JU2ySnZ/xmzSWDkqto6qWDx5eMps7wNmuXkwpJKniC1tgq40sZNgDsrEtoKIilc4FDxkS2wqw
	2DxC8Nupt3jyNvPNWmGP40jeAxB7nmVyO10ve+++3N4i8FNzqHLyTgyA7QgCMd7PKfY6d/io1Bv
	cvL4ZrTiMJ1/zYREr7+m01Ig87/chxpwR301LRtdexm/+AgofJ9fMxG706bH6v2X85pjOPRvw2X
	9giMkZPo79VQAcY+Z7/FJWHkOr5nh8XED6XghnGIu8TjsLhmSrxT5JXEvUzWK2qMw++gsNVeWWF
	H085/adgJ0zVSjKzsRKsyieNQsq0WtanNkU8AAePpcMlEDNlqeYMtS0hBO+UPkrTiKCkrhMf+iL
	LT1EDoCi7KJjS7Z+Q==
X-Received: by 2002:a05:6820:2219:b0:6bd:a88f:c8c8 with SMTP id 006d021491bc7-6c24d49e225mr4103398eaf.29.1789331438033;
        Sun, 13 Sep 2026 13:30:38 -0700 (PDT)
Received: from DESKTOP-CCA1RSU ([2806:108e:2b:e56a:389c:aa85:99d8:edd5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c099b0e318sm8789077eaf.8.2026.09.13.13.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:30:36 -0700 (PDT)
From: Moises Dominguez <dominguezsalcedom@gmail.com>
X-Google-Original-From: Moises Dominguez <dominguezsalcedo@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Moises Dominguez <dominguezsalcedo@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove redundant goto in rtw_alloc_xmitframe_once()
Date: Sun, 13 Sep 2026 14:30:32 -0600
Message-ID: <20260913203032.1346-1-dominguezsalcedo@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the redundant goto and return NULL directly when allocation fails.

Signed-off-by: Moises Dominguez <dominguezsalcedo@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 81d9e713fc12..cd659bd2f261 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1715,7 +1715,7 @@ struct xmit_frame *rtw_alloc_xmitframe_once(struct xmit_priv *pxmitpriv)
 
 	alloc_addr = kzalloc(sizeof(*pxframe) + 4, GFP_ATOMIC);
 	if (!alloc_addr)
-		goto exit;
+		return NULL;
 
 	pxframe = (struct xmit_frame *)N_BYTE_ALIGMENT((SIZE_PTR)(alloc_addr), 4);
 	pxframe->alloc_addr = alloc_addr;
@@ -1730,7 +1730,6 @@ struct xmit_frame *rtw_alloc_xmitframe_once(struct xmit_priv *pxmitpriv)
 
 	rtw_init_xmitframe(pxframe);
 
-exit:
 	return pxframe;
 }
 

base-commit: 2f0c1cf72f4682178506f513bbf015e591b1aa4a
-- 
2.55.0

